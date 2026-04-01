getwd()
setwd("C:/Users/Alexis/Documents/projet-professionnel")
list.files()
grippe <- read.csv("grippe-passages-urgences-et-actes-sos-medecin_reg.csv")
glimpse (grippe)
count(grippe, Région)
count(grippe, Classe.d.âge)
summary(grippe, Semaine)
national <- grippe %>%
  filter(`Classe.d.âge` == "Tous âges")
nrow(national)
national |>
  filter(Région == "France entière") |>
  ggplot(aes(x = date, y = Taux.de.passages.aux.urgences.pour.grippe)) +
  geom_line() +
  labs(title = "Passage aux urgences pour grippe",
       x = "Date",
       y = "taux pour 100 000")
library(ggplot2)
national <- national |>
  mutate(date = as.Date(X1er.jour.de.la.semaine))
count(national, Région)
national |>
  filter(Région == "Occitanie") |>
  ggplot(aes(x = date, y = Taux.de.passages.aux.urgences.pour.grippe)) +
  geom_line() +
  labs(title = "Passage aux urgences pour grippe",
       x = "Date", 
       y = "Taux pour 100 000")
france <- national |>
  group_by(date) |>
  summarise(taux_urgences = mean(Taux.de.passages.aux.urgences.pour.grippe, na.rm = TRUE))
france |>
  ggplot(aes(x = dates, y = taux_urgences)) + 
  geom_line() +
  labs (title = "Passage aux urgences pour grippe", 
        x = "date", 
        y = "Taux pour 100 000")
france <- france |>
  mutate(dates = as.Date(date))
national |>
  ggplot(aes(x = date, y = Taux.de.passages.aux.urgences.pour.grippe, color = Région)) +
  geom_line() +
  labs (title = "Passage aux urgences pour grippe par région",
        x = "Date", 
        y = "Taux pour 100 000") +
  theme(legend.position = "none")
national |> 
  filter(! Région %in% c("Guadeloupe", "Martinique", "Guyane", "Réunion", "Mayotte")) |> 
  ggplot(aes(x = date, y = Taux.de.passages.aux.urgences.pour.grippe, color = Région)) +
  geom_line() + 
  labs ( title = "Passage aux urgences pour grippe - Métropole",
         x = "Date",
         y = "Taux pour 100 000") + 
  theme(legend.position = "bottom")
national |>
  filter(! Région %in% c("Guadeloupe", "Martinique", "Mayotte", "Réunion", "Guyane")) |>
  ggplot(aes(x = date, y = Taux.de.passages.aux.urgences.pour.grippe)) +
  geom_line(color = "steelblue") +
  facet_wrap(~Région) +
  labs (title = "Passages aux urgences pour grippe - Métropole",
        x = "Date", 
        y = "Taux pour 100 000") + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 6))
