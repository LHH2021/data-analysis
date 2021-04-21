#清洗代码
#(Solanum acaule产于安第斯山脉，但在图形中，在海洋中有记录，这是一个错误记录，另外两个记录位于同一地点(-76.3,-76.3)，需要对这些数据进行清洗)

#去重
dups<-duplicated(acgeo[,c('lon','lat')])#查找重复
sum(dups)
acg<-acgeo[!dups,]#剔除重复、保留剩余

#删除或改正数据
i<-acg$lon>0 & acg$lat>0 #删除三个经度为零的点
acg$lon[i]<-1*acg$lon[i]
acg$lat[i]<-1*acg$lat[i]
acg<-acg[acg$lon<-50 & acg$lat>-50,] #更改经纬度符号

#交叉验证: 通过视觉和其它手段交叉核对坐标是很重要的,一种方法是比较国家指定的记录与国家坐标是否相符。
#在本例中，去重后，使用sp包中函数创建space alpointsdataframe,然后使用来自sp的over函数对国家多边形执行点内多边形查询。

#使用统计函数表示法制作- 一个空间点数据
library(sp)
coordinates(acg) <-~lon+lat
crs(acg) <- crs(wrld_simpl)
class(acg)

#使用坐标来对wrld Simp1中的多边形进行空间查询
class(wrld_simpl)
ovr <- over(acg, wrld_simpl)#对象“ov”对于来自于wrld_Simpl的每一点匹配
head(ovr)
cntr <- ovr$NAME#???为啥加这个？
i <- which(is.na(cntr)) #哪几个点与任何国家不匹配
i
j <- which(cntr!= acg$country)#哪些点的坐标与GBIF“国家”字段中列出的坐标不同
cbind(cntr, acg$country)[j,] #对于不匹配，绑定多边形和点的国家名称
cntr
plot(acg)
plot(wrld_simpl, add=T, border= 'blue', lwd=2)
points(acg[j,], col= 'red', pch=20, cex=2)