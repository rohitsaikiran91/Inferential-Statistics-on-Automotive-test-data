rm(list=ls(all.names = T))
setwd("C:\\Users\\Aerow\\Desktop\\QFL")
V1_Engine_Mode-1_ACOFF<-read.csv("V1_Engine_Mode-1_AC_OFF.csv")
V1_Engine_Mode-2_ACOFF<-read.csv("V1_Engine_Mode-2_AC_OFF.csv")

V1_Engine_Mode_1_ACON<-read.csv("V1_Engine_Mode_2_AC_ON.csv")
V1_Engine_Mode_2_ACON<-read.csv("V1_Engine_Mode_1_AC_ON.csv")

V1_Engine_Mode_2_ACOFF<-na.omit(V1_Engine_Mode_2_ACOFF)
V1_Engine_Mode_2_ACON<-na.omit(V1_Engine_Mode_2_ACON)
V1_Engine_Mode_1_ACOFF<-na.omit(V1_Engine_Mode_1_ACOFF)
V1_Engine_Mode_1_ACON<-na.omit(V1_Engine_Mode_1_ACON)



V1_Engine_Mode_2_ACOFF["Bin"]<-as.numeric(cut(V1_Engine_Mode_2_ACOFF$Avg.Spd,breaks = c(seq(0,40,5),seq(50,90,10),150)))

V1_Engine_Mode_1_ACOFF["Bin"]<-as.numeric(cut(V1_Engine_Mode_1_ACOFF$Avg.Spd,breaks = c(seq(0,40,5),seq(50,90,10),150)))

Bins<- c("0-5"  ,  "5-10" ,  "10-15" , "15-20"  ,"20-25",  "25-30" , "30-35" , "35-40" , "40-50" , "50-60"  ,"60-70",  "70-80" , "80-90" , ">90")

V1_Engine_Mode_2_ACOFF["Bin_level"]<-factor(V1_Engine_Mode_2_ACOFF$Bin,levels = seq(1,14,1),labels = Bins)
V1_Engine_Mode_1_ACOFF["Bin_level"]<-factor(V1_Engine_Mode_1_ACOFF$Bin,levels = seq(1,14,1),labels = Bins)


V1_Engine_Mode_2_ACOFF%>%group_by(Bin_level)%>%summarise(len=length(FE),mean=mean(FE),q2=mean(FE)-sd(FE)*qt(0.95,length(FE))/sqrt(length(FE)),q3=mean(FE)+sd(FE)*qt(0.95,length(FE))/sqrt(length(FE)))->U_PACOFF
V1_Engine_Mode_1_ACOFF%>%group_by(Bin_level)%>%summarise(len=length(FE),mean=mean(FE),q2=mean(FE)-sd(FE)*qt(0.95,length(FE))/sqrt(length(FE)),q3=mean(FE)+sd(FE)*qt(0.95,length(FE))/sqrt(length(FE)))->U_EACOFF

V1_Engine_Mode_2_ACON["Bin"]<-as.numeric(cut(V1_Engine_Mode_2_ACON$Avg.Spd,breaks = c(seq(0,40,5),seq(50,90,10),150)))

V1_Engine_Mode_1_ACON["Bin"]<-as.numeric(cut(V1_Engine_Mode_1_ACON$Avg.Spd,breaks = c(seq(0,40,5),seq(50,90,10),150)))

Bins<- c("0-5"  ,  "5-10" ,  "10-15" , "15-20"  ,"20-25",  "25-30" , "30-35" , "35-40" , "40-50" , "50-60"  ,"60-70",  "70-80" , "80-90" , ">90")

V1_Engine_Mode_2_ACON["Bin_level"]<-factor(V1_Engine_Mode_2_ACON$Bin,levels = seq(1,14,1),labels = Bins)
V1_Engine_Mode_1_ACON ["Bin_level"]<-factor(V1_Engine_Mode_1_ACON$Bin,levels = seq(1,14,1),labels = Bins)


V1_Engine_Mode_2_ACON%>%group_by(Bin_level)%>%summarise(len=length(FE),mean=mean(FE),q2=mean(FE)-sd(FE)*qt(0.95,length(FE))/sqrt(length(FE)),q3=mean(FE)+sd(FE)*qt(0.95,length(FE))/sqrt(length(FE)))->U_EACON
V1_Engine_Mode_1_ACON%>%group_by(Bin_level)%>%summarise(len=length(FE),mean=mean(FE),q2=mean(FE)-sd(FE)*qt(0.95,length(FE))/sqrt(length(FE)),q3=mean(FE)+sd(FE)*qt(0.95,length(FE))/sqrt(length(FE)))->U_PACON

W2_Fixed<-read.csv("W207 Fixed .csv")
W2_Var<-read.csv("W207 Variable .csv")

W2_Fixed["Bin"]<-as.numeric(cut(W2_Fixed$Avg.Spd,breaks = c(seq(0,40,5),seq(50,90,10),150)))

W2_Var["Bin"]<-as.numeric(cut(W2_Var$Avg.Spd,breaks = c(seq(0,40,5),seq(50,90,10),150)))

Bins<- c("0-5"  ,  "5-10" ,  "10-15" , "15-20"  ,"20-25",  "25-30" , "30-35" , "35-40" , "40-50" , "50-60"  ,"60-70",  "70-80" , "80-90" , ">90")

W2_Fixed["Bin_level"]<-factor(W2_Fixed$Bin,levels = seq(1,14,1),labels = Bins)
W2_Var["Bin_level"]<-factor(W2_Var$Bin,levels = seq(1,14,1),labels = Bins)

W2_Fixed%>%group_by(Bin_level)%>%summarise(len=length(FE),mean=mean(FE),q2=mean(FE)-sd(FE)*qt(0.95,length(FE))/sqrt(length(FE)),q3=mean(FE)+sd(FE)*qt(0.95,length(FE))/sqrt(length(FE)))->W2_F
W2_Var%>%group_by(Bin_level)%>%summarise(len=length(FE),mean=mean(FE),q2=mean(FE)-sd(FE)*qt(0.95,length(FE))/sqrt(length(FE)),q3=mean(FE)+sd(FE)*qt(0.95,length(FE))/sqrt(length(FE)))->W2_V

write.csv(x = U_EACOFF,file = "V1_Engine_Mode_2_ACOFF.csv")
write.csv(x = U_PACOFF,file = "V1_Engine_Mode_1_ACOFF.csv")

write.csv(x = U_EACON,file = "V1_Engine_Mode_2_ACON.csv")
write.csv(x = U_PACON,file = "V1_Engine_Mode_1_ACON.csv")


ggplot(V1_Engine_Mode_1_ACON, aes(x = Bin_level, y = FE)) +
  geom_boxplot(outlier.colour ="Blue")+facet_grid(.~Bin_level,scales = "free",drop = T,switch = "x")+xlab("Average Speed(Kmph)")+ylab("FE(Kmpl)")+ggtitle("V1 EngineMode1 ACON")+theme(plot.title = element_text(hjust = 0.5))




