library(readxl)
library(ggplot2)
library(ggpubr)
brad <- read_excel("Patrones Bradford.xlsx")
g<-ggplot(brad,aes(x=BSA, y=absorbancia, color=BSA))
p<-g+geom_point(aes(size = 1),show.legend = FALSE)+geom_smooth(method="lm", lwd=1.5)+stat_regline_equation()+stat_cor(label.y = 0.205)
p+xlab("μg/mL of BSA")+ylab("Relative Absorbance")+ggtitle("Linear Regression Bradford")

