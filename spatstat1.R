library(spatstat)
library("readxl")
library('pracma')
#https://www.rdocumentation.org/packages/spatstat/versions/1.64-1/topics/Gcross



data=read_excel('/Users/simonburgermeister/Desktop/distance_analysis/Tonsil_F1.xlsx')

coords <- data[, c("X", "Y")]
xx=data$X
yy=data$Y

pp <- ppp(xx, yy, marks = factor(data$KM_label), window=owin(c(min(xx)-200,max(xx))+200,c(min(yy)-200,max(yy)+200)))

G01 <- Gcross(pp, correction='r')



plot(G01)
polygon(c(G01$r, rev(G01$r)), c(G01$theo,  rev(G01$km)),
        col = "gray")
#dev.off()
dev.print(pdf, file="/Users/simonburgermeister/Desktop/distance_analysis/img/cross_GF1.pdf");

areax <- polyarea(G01$theo, G01$km)
print(areax, digits=4)   

