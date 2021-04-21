#dismo包用于查询物种、亚种数量，以及与物种相关的地理信息，以及下载数据、可视化
acaule = gbif("solanum", "acaule*", geo=FALSE) #下载茄属植物种及亚种(*) 
data(acaule) #加载数据
dim(acaule) #查看行列数
colnames(acaule) #查看列名称
acgeo <- subset(acaule, !is.na(lon) & !is.na(lat))
#把经纬度不是缺失值留下来，也即剔除没有经纬度记录
dim(acgeo) #查看剩下有经纬度记录数
library(maptools)#加载制图包
data(wrld_simpl)#加载空间图形数据
plot(wrld_simpl, xlim=c(-80,70), ylim=c(-60,10), axes=TRUE, col="light yellow") #绘图
box() #给图形加边框
points(acgeo$lon, acgeo$lat, col='red', cex=0.75) #在图形上添加有经纬度记录点