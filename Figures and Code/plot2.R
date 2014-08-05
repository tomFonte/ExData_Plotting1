#setwd(PATH)

household<-read.table("./household_power_consumption.txt",sep=";",header=T,na.strings="?")
colnames(household)<-gsub("\\_","",names(household))


sb1<-household[household$Date=="1/2/2007",]
sb2<-household[household$Date=="2/2/2007",]

househ<-rbind(sb1,sb2)
names(househ)

#formatting Date-Time
z<-paste(househ$Date,househ$Time)
househ$newTime<-strptime(z,"%d/%m/%Y %H:%M:%S")

png("./plot2.png",width=480,height=480)
plot(househ$newTime,househ$Globalactivepower,type='l',ylab='Global Active Power (kilowatts)',xlab='')
dev.off()