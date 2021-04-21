#物种检索SPOCC包
library(spocc)
#install.packages("dismo")
library(dismo)
acaule <-occ(query = 'Solanum acaule*', from = 'gbif') #搜索,仅从gbif库搜索
acaule <-occ(query = 'Solanum acaule*',from='gbif',limit=25)#仅从gbif库搜索，限定样本数
acaule <-occ(query ='Solanum acaule*', from = c('gbif', 'ecoengine' ))
#定义从多个库中搜索，包括gbif、ecoengine、vertnet、 bison、 ebird 等
head(acaule$gbif$data$Solanum_acaule)[1:6,1:10] #查看数据