# =============================================================================
#  MEM5230 Rakenduslik majandusanalüüs – lühiprojekt nr 2
#  Kausaalne hindamine: John Snow' koolerauuring (DID)
#
# =============================================================================

library(causaldata)  # andmestik "snow"
library(dplyr)
library(ggplot2)


# --- 1. Andmed ----------------------------------------------------------------
# 4 vaatlust: 2 gruppi x 2 aastat. deathrate = koolerasurmad 10 000 elaniku kohta.
# Post    = 1 aastal 1854 (pärast Lambethi veevõtukoha kolimist 1852)
# Treated = 1 mõjugrupile "Lambeth + Others" (vesi paranes),
#           0 kontrollgrupile "Non-Lambeth Only" (vesi jäi saastunuks)
data("snow")
snow_data <- snow %>%
  mutate(Post    = ifelse(year == 1854, 1, 0),
         Treated = ifelse(supplier == "Lambeth + Others", 1, 0))
print(snow_data)


# --- 2. Kirjeldav statistika: 2 x 2 tabel (tabel 2) ---------------------------
d <- function(y, g) snow_data$deathrate[snow_data$year == y & snow_data$Treated == g]

tabel2 <- data.frame(
  Grupp  = c("Kontrollgrupp", "Mõjugrupp"),
  a1849  = c(d(1849, 0), d(1849, 1)),
  a1854  = c(d(1854, 0), d(1854, 1))
)
tabel2$Muutus <- tabel2$a1854 - tabel2$a1849
print(tabel2)

# DID käsitsi: mõjugrupi muutus miinus kontrollgrupi muutus
# (-45,2) - (11,7) = -56,9
(d(1854, 1) - d(1849, 1)) - (d(1854, 0) - d(1849, 0))


# --- 3. DID-regressioon (tabel 4) ---------------------------------------------
# deathrate = b0 + b1*Post + b2*Treated + b3*(Post x Treated)
#   b0 = kontrollgrupi suremus 1849        b1 = ühine ajatrend
#   b2 = gruppide erinevus enne sekkumist  b3 = DID-hinnang (kausaalne mõju)
# 4 vaatlust ja 4 kordajat -> 0 vabadusastet, seega standardvead on NaN.
did_model <- lm(deathrate ~ Post * Treated, data = snow_data)
summary(did_model)

# Tundlikkusanalüüs: logaritmitud suremus (suhteline mõju)
did_model_log <- lm(log(deathrate) ~ Post * Treated, data = snow_data)
summary(did_model_log)

# Log-kordaja teisendus protsendiks: exp(-0,510) - 1 = -40,0%
(exp(coef(did_model_log)["Post:Treated"]) - 1) * 100


# --- 4. Hinnangute võrdlus (tabel 5) ------------------------------------------
did        <- coef(did_model)["Post:Treated"]
kontrafakt <- d(1849, 1) + (d(1854, 0) - d(1849, 0))  # 130,1 + 11,7 = 141,8

tabel5 <- data.frame(
  Hinnang = c("Enne-pärast mõjugrupis", "Gruppide võrdlus 1854", "DID tasemetes"),
  Moju    = c(d(1854, 1) - d(1849, 1), d(1854, 1) - d(1854, 0), did),
  Moju_pr = c((d(1854, 1) - d(1849, 1)) / d(1849, 1),
              (d(1854, 1) - d(1854, 0)) / d(1854, 0),
              did / kontrafakt) * 100
)
print(tabel5, digits = 3)


# --- 5. Joonis: trendid ja kontrafaktuaal (joonis 2) --------------------------
# Katkendjoon = mõjugrupi suremus, kui see oleks muutunud nagu kontrollgrupis.
kontrafakt_df <- data.frame(year = c(1849, 1854), deathrate = c(d(1849, 1), kontrafakt))

joonis <- ggplot(snow_data, aes(year, deathrate,
                                color = factor(Treated, labels = c("Kontrollgrupp (S&V)",
                                                                   "Mõjugrupp (Lambeth + teised)")))) +
  geom_line(linewidth = 1.2) +
  geom_point(size = 3) +
  geom_line(data = kontrafakt_df, aes(year, deathrate), inherit.aes = FALSE,
            linetype = "dashed", color = "grey40") +
  annotate("text", x = 1851.5, y = 131, label = "mõjugrupi kontrafaktuaalne trend",
           color = "grey30", size = 3.5) +
  annotate("segment", x = 1854.15, xend = 1854.15, y = d(1854, 1), yend = kontrafakt,
           arrow = arrow(ends = "both", length = unit(0.2, "cm")), color = "grey20") +
  annotate("text", x = 1854.25, y = (d(1854, 1) + kontrafakt) / 2,
           label = "DID = −56,9", hjust = 0, size = 3.5) +
  scale_x_continuous(breaks = c(1849, 1854), limits = c(1848.8, 1855.1)) +
  labs(x = "Aasta", y = "Surmi 10 000 elaniku kohta", color = NULL) +
  theme_minimal() +
  theme(legend.position = "bottom")

print(joonis)
ggsave("koolerasuremus_did.png", joonis, width = 7, height = 5, dpi = 300)
