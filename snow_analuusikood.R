# Pakettide laadimine
library(causaldata)
library(dplyr)
library(ggplot2)

# 1. Andmete laadimine ja ettevalmistamine
data("snow")

snow_data <- snow %>%
  mutate(
    # Määrame aja tunnuse (1854 on sekkumise järgne aasta)
    Post = ifelse(year == 1854, 1, 0),
    # Määrame mõjugrupi (Lambeth kolis veevõtukoha puhtamasse kohta)
    Treated = ifelse(supplier == "Lambeth + Others", 1, 0)
  )

# Vaatame andmestikku
print("John Snow koolerauuringu andmed:")
print(snow_data)


# 2. DID (Difference-in-Differences) regressioonimudel
# deathrate ~ Post + Treated + Post:Treated
did_model <- lm(deathrate ~ Post * Treated, data = snow_data)

print("Regressiooni tulemused (DID):")
summary(did_model)


# 3. Joonise loomine
joonis <- ggplot(snow_data, aes(x = year, y = deathrate, 
                                color = factor(Treated, labels=c("Kontroll (S&V)", "Mõjugrupp (Lambeth)")))) +
  geom_line(linewidth = 1.2) +
  geom_point(size = 3) +
  scale_x_continuous(breaks = c(1849, 1854)) +
  labs(y = "Surmi 10 000 inimese kohta", 
       x = "Aasta", 
       color = "Piirkond",
       title = "Koolerasuremuse muutus: John Snow uuring") +
  theme_minimal()

# Salvestame joonise PDF-ina
ggsave("koolerasuremus_did.pdf", joonis, width = 7, height = 5)
print("Joonis salvestatud faili 'koolerasuremus_did.pdf'.")
