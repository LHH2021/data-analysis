#install.packages("mapr")
library(mapr)#加载绘图包
map_leaflet(acaule) #绘图
spp <- c('Danaus plexippus', 'Accipiter striatus', 'Pinus contorta')#定义多个物种
dat<- occ(query = spp, from = 'gbif', has_coords = TRUE, limit = 50) #搜索多个物种
map_leaflet(dat, color =c ("#976AAE"," #6B944D","#BD5945")) #可视化