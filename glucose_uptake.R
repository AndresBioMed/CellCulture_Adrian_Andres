library(readxl)
library(writexl)
library(ggplot2)
library(ggpubr)
library(dplyr)
uptake<-read_excel("glucose uptake.xlsx")
g<-ggplot(uptake, aes(y=uptake, color=culture))
p<-g+geom_boxplot(aes(type))+facet_grid(.~culture)+stat_summary(fun=mean, geom="point", shape=20, size=8, color="red", fill="red",aes(type))
p+ylab("mg Glucose / μg protein")+xlab("Culture Type")+ggtitle("Glucose Uptake in different culture types")
#Export means
mean_data<-uptake %>%
        group_by(culture, type) %>%
        summarise(mean = mean(uptake), n = n())
mean_data
write_xlsx(mean_data,"C:/Users/andre/OneDrive - unizar.es/Trabajos/Tercero/Cultivos/Esferoides Caco 3D/uptake_means.xlsx")                  
