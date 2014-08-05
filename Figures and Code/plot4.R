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

png("./plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot(househ$newTime,househ$Globalactivepower,type='l',ylab='Global Active Power',xlab='')
plot(househ$newTime,househ$Voltage,type='l',ylab='Voltage',xlab='datetime')
plot(househ$newTime,househ$Submetering1,type='l',ylab='Energy sub metering',xlab='')
lines(househ$newTime,househ$Submetering2,col='red')
lines(househ$newTime,househ$Submetering3,col='blue')
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1),bty='n')
plot(househ$newTime,househ$Globalreactivepower,type='l',ylab='Global_reactive_Power',xlab='datetime')
dev.off()