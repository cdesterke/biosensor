#!/usr/bin/Rscript --slave


#usage: chmod +x biosensor.r 
#usage: ./biosensor.r "name"

argv<-commandArgs(TRUE)
query<-toString(argv[1])


#query <- "name"

#get the time machine
time<-toString(Sys.time())


#treatment of acceleration file

acceleration<-read.table("acceleration.txt",h=F)
acc_rows=nrow(acceleration)
acceleration_names<-c("acceleration_time","acceleration_X","acceleration_Y","acceleration_Z","unit")
colnames(acceleration)<-acceleration_names

pdf('acceleration_x.pdf', width=10, height=4)
plot(acceleration$acceleration_time,acceleration$acceleration_X,col="seagreen2",ylab="acceleration_X",xlab="time",pch="*",main=query, sub=paste("(",acc_rows," collected data )"),cex.main=2, cex.lab=1.5, cex.sub=1.2, col.sub="seagreen4")
lines(acceleration$acceleration_time,acceleration$acceleration_X,lwd=2,col="red",cex=1.5)
abline(h=0,lty=5,col="darkorange",lwd=2)
dev.off()


pdf('acceleration_y.pdf', width=10, height=4)
plot(acceleration$acceleration_time,acceleration$acceleration_Y,col="seagreen2",ylab="acceleration_Y",xlab="time",pch="*",main=query, sub=paste("(",acc_rows," collected data )"),cex.main=2, cex.lab=1.5, cex.sub=1.2, col.sub="seagreen4")
lines(acceleration$acceleration_time,acceleration$acceleration_Y,lwd=2,col="blue")
abline(h=0,lty=5,col="darkorange",lwd=2)
dev.off()

pdf('acceleration_z.pdf', width=10, height=4)
plot(acceleration$acceleration_time,acceleration$acceleration_Z,col="seagreen2",ylab="acceleration_Z",xlab="time",pch="*",main=query, sub=paste("(",acc_rows," collected data )"),cex.main=2, cex.lab=1.5, cex.sub=1.2, col.sub="seagreen4")
lines(acceleration$acceleration_time,acceleration$acceleration_Z,lwd=2,col="darkgreen")
abline(h=0,lty=5,col="darkorange",lwd=2)

dev.off()

#graph all accelerations together
acc_minix<-min(acceleration$acceleration_X)
acc_miniy<-min(acceleration$acceleration_Y)
acc_miniz<-min(acceleration$acceleration_Z)

acc_minis<-c(acc_minix,acc_miniy,acc_miniz)

acc_extramini<-(min(acc_minis))-0.5

acc_maxx<-max(acceleration$acceleration_X)
acc_maxy<-max(acceleration$acceleration_Y)
acc_maxz<-max(acceleration$acceleration_Z)

acc_maxs<-c(acc_maxx,acc_maxy,acc_maxz)

acc_extramax<-(max(acc_maxs))+0.5

pdf('acceleration_all.pdf', width=10, height=6)
plot(acceleration$acceleration_time,acceleration$acceleration_X,col="seagreen2",ylab="acceleration_all",xlab="time",pch=".",
main=query, sub=paste("(",acc_rows," data )"),cex.main=2, cex.lab=1.5, cex.sub=1.2, col.sub="seagreen4",ylim=c(acc_extramini,acc_extramax))
lines(acceleration$acceleration_time,acceleration$acceleration_X,lwd=2,col="red")
lines(acceleration$acceleration_time,acceleration$acceleration_Y,lwd=2,col="blue")
lines(acceleration$acceleration_time,acceleration$acceleration_Z,lwd=2,col="darkgreen")
legend("topleft",legend=c("acceleration_X","acceleration_Y","acceleration_Z"), col=c("red","blue","darkgreen"),lty=1,cex=0.8)
abline(h=0,lty=5,col="darkorange",lwd=2)
print(summary(acceleration))
dev.off()

#treatment of gyroscope file
gyroscope<-read.table("gyroscope.txt",h=F)
gyro_rows=nrow(gyroscope)
gyroscope_names<-c("gyroscope_time","gyroscope_X","gyroscope_Y","gyroscope_Z","unit")
colnames(gyroscope)<-gyroscope_names

pdf('gyroscope_x.pdf', width=10, height=4)
plot(gyroscope$gyroscope_time,gyroscope$gyroscope_X,col="seagreen2",ylab="gyroscope_X",xlab="time",pch="*",main=query, sub=paste("(",gyro_rows," collected data )"),cex.main=2, cex.lab=1.5, cex.sub=1.2, col.sub="seagreen4")
lines(gyroscope$gyroscope_time,gyroscope$gyroscope_X,lwd=2,col="red")
abline(h=0,lty=5,col="darkorange",lwd=2)
dev.off()

pdf('gyroscope_y.pdf', width=10, height=4)
plot(gyroscope$gyroscope_time,gyroscope$gyroscope_Y,col="seagreen2",ylab="gyroscope_Y",xlab="time",pch="*",main=query, sub=paste("(",gyro_rows," collected data )"),cex.main=2, cex.lab=1.5, cex.sub=1.2, col.sub="seagreen4")
lines(gyroscope$gyroscope_time,gyroscope$gyroscope_Y,lwd=2,col="blue")
abline(h=0,lty=5,col="darkorange",lwd=2)
dev.off()

pdf('gyroscope_z.pdf', width=10, height=4)
plot(gyroscope$gyroscope_time,gyroscope$gyroscope_Z,col="seagreen2",ylab="gyroscope_Z",xlab="time",pch="*",main=query, sub=paste("(",gyro_rows," collected data )"),cex.main=2, cex.lab=1.5, cex.sub=1.2, col.sub="seagreen4")
lines(gyroscope$gyroscope_time,gyroscope$gyroscope_Z,lwd=2,col="darkgreen")
abline(h=0,lty=5,col="darkorange",lwd=2)
dev.off()

#graph all gyroscope together
gyro_minix<-min(gyroscope$gyroscope_X)
gyro_miniy<-min(gyroscope$gyroscope_Y)
gyro_miniz<-min(gyroscope$gyroscope_Z)

gyro_minis<-c(gyro_minix,gyro_miniy,gyro_miniz)

gyro_extramini<-(min(gyro_minis))-0.5

gyro_maxx<-max(gyroscope$gyroscope_X)
gyro_maxy<-max(gyroscope$gyroscope_Y)
gyro_maxz<-max(gyroscope$gyroscope_Z)

gyro_maxs<-c(gyro_maxx,gyro_maxy,gyro_maxz)

gyro_extramax<-(max(gyro_maxs))+0.5

pdf('gyroscope_all.pdf', width=10, height=6)
plot(gyroscope$gyroscope_time,gyroscope$gyroscope_X,col="seagreen2",ylab="gyroscope_all",xlab="time",pch=".",
main=query, sub=paste("(",gyro_rows," data )"),cex.main=2, cex.lab=1.5, cex.sub=1.2, col.sub="seagreen4",ylim=c(gyro_extramini,gyro_extramax))
lines(gyroscope$gyroscope_time,gyroscope$gyroscope_X,lwd=2,col="red")
lines(gyroscope$gyroscope_time,gyroscope$gyroscope_Y,lwd=2,col="blue")
lines(gyroscope$gyroscope_time,gyroscope$gyroscope_Z,lwd=2,col="darkgreen")
legend("topleft",legend=c("gyroscope_X","gyroscope_Y","gyroscope_Z"), col=c("red","blue","darkgreen"),lty=1,cex=0.8)
abline(h=0,lty=5,col="darkorange",lwd=2)
dev.off()





#treatment of emg file
emg<-read.table("emg.txt",h=F)
emg_rows<-nrow(emg)
emg_names<-c("EMG_time","Electrode_01","Electrode_02","Electrode_03","Electrode_04","Electrode_05","Electrode_06","Electrode_07","Electrode_08","unit")
colnames(emg)<-emg_names

attach(emg)

MA1<-filter(Electrode_01,filter=array(1/10,dim=10),method=c("convolution"),side=2, circular=F)
pdf("electrodemm01.pdf",width=12, height=6)
plot(EMG_time,Electrode_01,col="seagreen4",ylab="Electrode_01",xlab="time with mobile average 10",lwd=1,main=query,sub=paste("(",emg_rows," collected data )"),cex.main=2, cex.lab=1.5, cex.sub=1.2, col.sub="seagreen4")
lines(EMG_time,Electrode_01,col="seagreen2",lwd=2)
lines(EMG_time,MA1,col="red",lwd=2)
dev.off()

MA2<-filter(Electrode_02,filter=array(1/10,dim=10),method=c("convolution"),side=2, circular=F)
pdf("electrodemm02.pdf",width=12, height=6)
plot(EMG_time,Electrode_02,col="seagreen4",ylab="Electrode_02",xlab="time with mobile average 10",lwd=1,main=query,sub=paste("(",emg_rows," collected data )"),cex.main=2, cex.lab=1.5, cex.sub=1.2, col.sub="seagreen4")
lines(EMG_time,Electrode_02,col="seagreen2",lwd=2)
lines(EMG_time,MA2,col="red",lwd=2)
dev.off()


MA3<-filter(Electrode_03,filter=array(1/10,dim=10),method=c("convolution"),side=2, circular=F)
pdf("electrodemm03.pdf",width=12, height=6)
plot(EMG_time,Electrode_03,col="seagreen4",ylab="Electrode_03",xlab="time with mobile average 10",lwd=1,main=query,sub=paste("(",emg_rows," collected data )"),cex.main=2, cex.lab=1.5, cex.sub=1.2, col.sub="seagreen4")
lines(EMG_time,Electrode_03,col="seagreen2",lwd=2)
lines(EMG_time,MA3,col="red",lwd=2)
dev.off()

MA4<-filter(Electrode_04,filter=array(1/10,dim=10),method=c("convolution"),side=2, circular=F)
pdf("electrodemm04.pdf",width=12, height=6)
plot(EMG_time,Electrode_04,col="seagreen4",ylab="Electrode_04",xlab="time with mobile average 10",lwd=1,main=query,sub=paste("(",emg_rows," collected data )"),cex.main=2, cex.lab=1.5, cex.sub=1.2, col.sub="seagreen4")
lines(EMG_time,Electrode_04,col="seagreen2",lwd=2)
lines(EMG_time,MA4,col="red",lwd=2)
dev.off()

MA5<-filter(Electrode_05,filter=array(1/10,dim=10),method=c("convolution"),side=2, circular=F)
pdf("electrodemm05.pdf",width=12, height=6)
plot(EMG_time,Electrode_05,col="seagreen4",ylab="Electrode_05",xlab="time with mobile average 10",lwd=1,main=query,sub=paste("(",emg_rows," collected data )"),cex.main=2, cex.lab=1.5, cex.sub=1.2, col.sub="seagreen4")
lines(EMG_time,Electrode_05,col="seagreen2",lwd=2)
lines(EMG_time,MA5,col="red",lwd=2)
dev.off()

MA6<-filter(Electrode_06,filter=array(1/10,dim=10),method=c("convolution"),side=2, circular=F)
pdf("electrodemm06.pdf",width=12, height=6)
plot(EMG_time,Electrode_06,col="seagreen4",ylab="Electrode_06",xlab="time with mobile average 10",lwd=1,main=query,sub=paste("(",emg_rows," collected data )"),cex.main=2, cex.lab=1.5, cex.sub=1.2, col.sub="seagreen4")
lines(EMG_time,Electrode_06,col="seagreen2",lwd=2)
lines(EMG_time,MA6,col="red",lwd=2)
dev.off()

MA7<-filter(Electrode_07,filter=array(1/10,dim=10),method=c("convolution"),side=2, circular=F)
pdf("electrodemm07.pdf",width=12, height=6)
plot(EMG_time,Electrode_07,col="seagreen4",ylab="Electrode_07",xlab="time with mobile average 10",lwd=1,main=query,sub=paste("(",emg_rows," collected data )"),cex.main=2, cex.lab=1.5, cex.sub=1.2, col.sub="seagreen4")
lines(EMG_time,Electrode_07,col="seagreen2",lwd=2)
lines(EMG_time,MA7,col="red",lwd=2)
dev.off()


MA8<-filter(Electrode_08,filter=array(1/10,dim=10),method=c("convolution"),side=2, circular=F)
pdf("electrodemm08.pdf",width=12, height=6)
plot(EMG_time,Electrode_08,col="seagreen4",ylab="Electrode_08",xlab="time with mobile average 10",lwd=1,main=query,sub=paste("(",emg_rows," collected data )"),cex.main=2, cex.lab=1.5, cex.sub=1.2, col.sub="seagreen4")
lines(EMG_time,Electrode_08,col="seagreen2",lwd=2)
lines(EMG_time,MA8,col="red",lwd=2)
dev.off()


#treatment of orientation file
orientation<-read.table("orientation.txt",h=F)
orient_rows<-nrow(orientation)
orientation_names<-c("orientation_time","cardinal_01","cardinal_02","cardinal_03","cardinal_04","unit")
colnames(orientation)<-orientation_names

pdf('cardinal_01.pdf', width=10, height=4)
plot(orientation$orientation_time,orientation$cardinal_01,col="seagreen2",ylab="cardinal_01",xlab="time",pch="*",main=query, sub=paste("(",orient_rows," collected data )"),cex.main=2, cex.lab=1.5, cex.sub=1.2, col.sub="seagreen4")
lines(orientation$orientation_time,orientation$cardinal_01,lwd=2,col="darkgreen")
abline(h=0,lty=5,col="darkorange",lwd=2)
dev.off()

pdf('cardinal_02.pdf', width=10, height=4)
plot(orientation$orientation_time,orientation$cardinal_02,col="seagreen2",ylab="cardinal_02",xlab="time",pch="*",main=query, sub=paste("(",orient_rows," collected data )"),cex.main=2, cex.lab=1.5, cex.sub=1.2, col.sub="seagreen4")
lines(orientation$orientation_time,orientation$cardinal_02,lwd=2,col="darkblue")
abline(h=0,lty=5,col="darkorange",lwd=2)
dev.off()

pdf('cardinal_03.pdf', width=10, height=4)
plot(orientation$orientation_time,orientation$cardinal_03,col="seagreen2",ylab="cardinal_03",xlab="time",pch="*",main=query, sub=paste("(",orient_rows," collected data )"),cex.main=2, cex.lab=1.5, cex.sub=1.2, col.sub="seagreen4")
lines(orientation$orientation_time,orientation$cardinal_03,lwd=2,col="red")
abline(h=0,lty=5,col="darkorange",lwd=2)
dev.off()

pdf('cardinal_04.pdf', width=10, height=4)
plot(orientation$orientation_time,orientation$cardinal_04,col="seagreen2",ylab="cardinal_04",xlab="time",pch="*",main=query, sub=paste("(",orient_rows," collected data )"),cex.main=2, cex.lab=1.5, cex.sub=1.2, col.sub="seagreen4")
lines(orientation$orientation_time,orientation$cardinal_04,lwd=2,col="brown")
abline(h=0,lty=5,col="darkorange",lwd=2)
dev.off()


#graph all orientation together
cardinal_mini1<-min(orientation$cardinal_01)
cardinal_mini2<-min(orientation$cardinal_02)
cardinal_mini3<-min(orientation$cardinal_03)
cardinal_mini4<-min(orientation$cardinal_04)

cardinal_minis<-c(cardinal_mini1,cardinal_mini2,cardinal_mini3,cardinal_mini4)

cardinal_extramini<-(min(cardinal_minis))-0.5

cardinal_max1<-max(orientation$cardinal_01)
cardinal_max2<-max(orientation$cardinal_02)
cardinal_max3<-max(orientation$cardinal_03)
cardinal_max4<-max(orientation$cardinal_04)

cardinal_maxs<-c(cardinal_max1,cardinal_max2,cardinal_max3,cardinal_max4)

cardinal_extramax<-(max(cardinal_maxs))+0.5

pdf('cardinal_all.pdf', width=10, height=6)
plot(orientation$orientation_time,orientation$cardinal_01,col="seagreen2",ylab="orientation_all",xlab="time",pch=".",
main=query, sub=paste("(",gyro_rows," data )"),cex.main=2, cex.lab=1.5, cex.sub=1.2, col.sub="seagreen4",ylim=c(cardinal_extramini,cardinal_extramax))
lines(orientation$orientation_time,orientation$cardinal_01,lwd=2,col="darkgreen")
lines(orientation$orientation_time,orientation$cardinal_02,lwd=2,col="darkblue")
lines(orientation$orientation_time,orientation$cardinal_03,lwd=2,col="red")
lines(orientation$orientation_time,orientation$cardinal_04,lwd=2,col="brown")
legend("topleft",legend=c("cardinal_01","cardinal_02","cardinal_03","cardinal_04"), col=c("darkgreen","darkblue","red","brown"),lty=1,cex=0.8)
abline(h=0,lty=5,col="darkorange",lwd=2)
dev.off()

sink("summary_acceleration.txt")
print(summary(acceleration))
sink() 

sink("summary_orientation.txt")
print(summary(orientation))
sink() 

sink("summary_gyroscope.txt")
print(summary(gyroscope))
sink() 

sink("summary_electrodes.txt")
print(summary(emg))
sink()





