# setwd(PATH)

household<-read.table("./household_power_consumption.txt",sep=";",header=T,na.strings="?")
colnames(household)<-gsub("\\_","",names(household))


sb1<-household[household$Date=="1/2/2007",]
sb2<-household[household$Date=="2/2/2007",]

househ<-rbind(sb1,sb2)

png("./plot1.png",width=480,height=480)
hist(househ$Globalactivepower,col='red',xlab='Global Active Power (kilowatts)',main='Global Active Power')
dev.off()

