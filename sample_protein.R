library(readxl)
library(writexl)
library(ggplot2)
library(ggpubr)
library(dplyr)
#Create Plot
sample<-read_excel("muestra bradford.xlsx")
sample<-mutate(sample, conc=(absorbance*100-0.14)/0.0035)
g<-ggplot(sample,aes(y=conc,color=culture))
p<-g+geom_boxplot(aes(type))+facet_grid(.~culture)+stat_summary(fun=mean, geom="point", shape=20, size=8, color="red", fill="red",aes(type))
p+ylab("μg/mL of Protein")+xlab("Culture type")
#Export means
mean_data<-sample %>%
        group_by(culture, type) %>%
        summarise(mean = mean(conc), n = n())
mean_data
write_xlsx(mean_data,"C:/Users/andre/OneDrive - unizar.es/Trabajos/Tercero/Cultivos/Esferoides Caco 3D/sample_means.xlsx")                  
