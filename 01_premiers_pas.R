# -- Données -- 
#Mon premier script R - Formation SP 
#Alexis Texier - 2026-11-03
#Donnees fictives inspirées de Predict-R 
#10 patients ayant passé l'autoquestionnaire 
patient_id <- c(1,2,3,4,5,6,7,8,9,10)
sexe<- c("F","M","F","M","F","M","F","M","F","M")
dfg<-c(92,45,78,31,88,62,55,103,41,70)
risque_pr <- c("green","red","green","red","orange","green","red","orange","red","orange")
age<-c(52,67,43,71,58,35,82,61,45,73)
patients<-data.frame(patient_id,age,sexe,dfg,risque_pr)
glimpse(patients)
patients|>count(risque_pr)
patients|>count(risque_pr, sexe)
patients|> mutate(stade_mrc=case_when(dfg>=90~"G1 - Normal", dfg >= 60 ~ "G2 - Légère", dfg >= 30 ~ "G3 - Modérée", dfg < 30 ~ "G4-G5 - Sévère"))
patients <- patients |> mutate(stade_mrc = case_when(dfg >= 90 ~ "G1 - Normal", dfg >= 60 ~ "G2 - Légère", dfg >= 30 ~ "G3 - Modérée", dfg < 30  ~ "G4-G5 - Sévère" ))
#-- Graphiques --
#Histogramme DFFG 
ggplot(patients, aes(x=dfg))+ geom_histogram(bins = 7, fill = "purple", color = "white")
#Barplot risque 
ggplot(patients, aes(x = risque_pr, fill=risque_pr))+ geom_bar()+scale_fill_manual(values=c("green"="green", "orange"="orange", "red"="red"))
#boxplor dfg par risqie 
ggplot(patients, aes(x=risque_pr , y=dfg, fill = risque_pr)) + geom_boxplot() + scale_fill_manual( values = c("green"="green3", "orange"="orange", "red"="red3"))
#scatter age vs DFG (pointblot)
ggplot(patients, aes(x=age , y = dfg, color = risque_pr)) + geom_point(size = 3) + scale_color_manual(values = c("green"="green3", "orange"="orange", "red"="red3")) + labs(title = "DFG selon l'âge et le risque Predict-R" , x = "Âge (années)" , y = "DFG estimé (mL/min/1.73m²)", color="Niveau de risque" ) + theme_minimal()


