#a) combien de patient par niveau de risque ? 
glimpse(donnees)
nrow(donnees)
ncol(donnees)
select(donnees, risque_pr)
summarise(donnees, risque_pr)
donnees |> group_by(risque_pr)|> summarise(n=n())
donnees |>
  group_by(sexe) |>
  summarise (
    n=n(),
    dfg_moyen = mean(dfg), 
    age_moyen = mean(age)
  )
ggplot(donnees, aes (x=risque_pr,y=dfg,fill = risque_pr ))+
         geom_boxplot()+
         scale_fill_manual(values = c("green"="green3", "orange"="orange", "red"="red3"))+
         labs(title="DFG par niveau de risque Predict-R", 
              x = "risque PR",
              y = "dfg",
              fill = "Risque Predict-R")
donnees |> filter(dfg) |> select(risque_pr=="red")
filter(donnees, risque_pr == "red")       
ggplot(donnees, aes ( x=dfg, fill=risque_pr))+
  geom_histogram(bins = 7, color="white")+
  scale_fill_manual (values = c ("green"="green3" , "orange" = "orange" , "red" = "red3")) + 
  facet_wrap(~risque_pr) +
  theme_minimal()
ggplot(donnees, aes( x = sexe , fill = sexe)) + 
  geom_bar() + 
  scale_fill_manual( values = c ( "F" = "pink", "M" = "blue")) +
  facet_wrap(~risque_pr) + 
  theme_minimal()  + 
  labs ( title = "Répartition par sexe selon le risque",
         x = "sexe", 
         y = "effectif")

  