library(readr)
A=read.csv('policy_10days.csv')
B=read.csv('policy_20days.csv')
C=read.csv('policy_30days.csv')
D=read.csv('confirm_10days.csv')
E=read.csv('confirm_20days.csv')
F1=read.csv('confirm_30days.csv')
G=read.csv('deaths_10days.csv')
H=read.csv('deaths_20days.csv')
I=read.csv('deaths_30days.csv')

Date<- as.character(seq.Date(from = as.Date("2020/01/01",format = "%Y/%m/%d"), to= as.Date("2021/09/15",format = "%Y/%m/%d"), by = "day"))
n=length(Date)



toPlot=A[,-c(1)]
library(reshape2)
library(ggplot2)
library(RColorBrewer)
toPlot=as.data.frame(t(toPlot))
Date <- as.Date(Date,"%Y-%m-%d")
toPlot[['index']] <- Date[6:619]
colnames(toPlot)=c('q-value<0.05','q-value<0.01','q-value<0.001','index')
toPlot<- melt(toPlot,'index')
mytheme <- theme(panel.grid.major = element_blank(),
                 panel.grid.minor = element_blank(),
                 plot.title = element_text(hjust = 0.5, size = 20),
                 axis.text.x = element_text(size = 9,color='black'),
                 axis.text.y = element_text(size = 11,color='black'),
                 axis.title.x=element_text(size=15,face="bold"),
                 axis.title.y=element_text(size=13,face="bold"),
                 plot.margin=unit(c(1,2,1,2), 'lines')
)
palette<-brewer.pal(11,"Spectral")[c(9,5,3)]

fig1 <- ggplot(data=toPlot,aes(index)) + 
  geom_line(aes(y=value,color=variable,size=variable)) +
  scale_colour_manual(values=palette) +
  scale_size_manual(values = c(1,0.6,0.4))+
  labs(x='Date',y='The number of countries with \n significant changes') +
  ylim(0,240)+
  theme_bw() +
  mytheme +
  theme(legend.position=c(0.82,0.82))+theme(legend.title = element_blank())+
  theme(legend.background = element_blank())+
  theme(legend.text = element_text(size=9,face="bold"))+
  theme(legend.key.size = unit(10, "pt"),
        legend.box.background = element_rect(color="black", size=0.2),
        legend.box.margin = margin(-3, -2, 2, -2))+
  scale_x_date(breaks =as.Date(c("2020-01-06","2020-03-01","2020-05-01","2020-07-01","2020-09-01","2020-11-01","2021-01-01","2021-03-01","2021-05-01","2021-07-01","2021-09-10")),date_labels="%y/%m/%d")+
  theme(axis.text.x = element_text(angle = 342, hjust = 0.5, vjust = 0.5))+
  annotate(geom='text',x=as.Date(c("2020-07-25")),y=222,label="Data: government policies",size=4)+
  annotate(geom='text',x=as.Date(c("2020-07-25")),y=199,label="Time window: 10 days",size=4)
fig1


Date<- as.character(seq.Date(from = as.Date("2020/01/01",format = "%Y/%m/%d"), to= as.Date("2021/09/15",format = "%Y/%m/%d"), by = "day"))
n=length(Date)
toPlot=B[,-c(1)]
library(reshape2)
library(ggplot2)
library(RColorBrewer)
toPlot=as.data.frame(t(toPlot))
Date <- as.Date(Date,"%Y-%m-%d")
toPlot[['index']] <- Date[11:614]
colnames(toPlot)=c('q-value<0.05','q-value<0.01','q-value<0.001','index')
toPlot<- melt(toPlot,'index')

palette<-brewer.pal(11,"Spectral")[c(9,5,3)]

fig2 <- ggplot(data=toPlot,aes(index)) + 
  geom_line(aes(y=value,color=variable,size=variable)) +
  scale_colour_manual(values=palette) +
  scale_size_manual(values = c(1,0.6,0.4))+
  labs(x='Date',y='The number of countries with \n significant changes') +
  ylim(0,240)+
  theme_bw() +
  mytheme +
  theme(legend.position=c(0.82,0.82))+theme(legend.title = element_blank())+
  theme(legend.background = element_blank())+
  theme(legend.text = element_text(size=9,face="bold"))+
  theme(legend.key.size = unit(10, "pt"),
        legend.box.background = element_rect(color="black", size=0.2),
        legend.box.margin = margin(-3, -2, 2, -2))+
  scale_x_date(breaks =as.Date(c("2020-01-11","2020-03-01","2020-05-01","2020-07-01","2020-09-01","2020-11-01","2021-01-01","2021-03-01","2021-05-01","2021-07-01","2021-09-05")),date_labels="%y/%m/%d")+
  theme(axis.text.x = element_text(angle = 342, hjust = 0.5, vjust = 0.5))+
  annotate(geom='text',x=as.Date(c("2020-07-25")),y=222,label="Data: government policies",size=4)+
  annotate(geom='text',x=as.Date(c("2020-07-25")),y=199,label="Time window: 20 days",size=4)
fig2



Date<- as.character(seq.Date(from = as.Date("2020/01/01",format = "%Y/%m/%d"), to= as.Date("2021/09/15",format = "%Y/%m/%d"), by = "day"))
n=length(Date)
toPlot=C[,-c(1)]
library(reshape2)
library(ggplot2)
library(RColorBrewer)
toPlot=as.data.frame(t(toPlot))
Date <- as.Date(Date,"%Y-%m-%d")
toPlot[['index']] <- Date[16:609]
colnames(toPlot)=c('q-value<0.05','q-value<0.01','q-value<0.001','index')
toPlot<- melt(toPlot,'index')

palette<-brewer.pal(11,"Spectral")[c(9,5,3)]

fig3 <- ggplot(data=toPlot,aes(index)) + 
  geom_line(aes(y=value,color=variable,size=variable)) +
  scale_colour_manual(values=palette) +
  scale_size_manual(values = c(1,0.6,0.4))+
  labs(x='Date',y='The number of countries with \n significant changes') +
  ylim(0,240)+
  theme_bw() +
  mytheme +
  theme(legend.position=c(0.82,0.82))+theme(legend.title = element_blank())+
  theme(legend.background = element_blank())+
  theme(legend.text = element_text(size=9,face="bold"))+
  theme(legend.key.size = unit(10, "pt"),
        legend.box.background = element_rect(color="black", size=0.2),
        legend.box.margin = margin(-3, -2, 2, -2))+
  scale_x_date(breaks =as.Date(c("2020-01-16","2020-03-06","2020-05-01","2020-07-01","2020-09-01","2020-11-01","2021-01-01","2021-03-01","2021-05-01","2021-07-01","2021-08-31")),date_labels="%y/%m/%d")+
  theme(axis.text.x = element_text(angle = 342, hjust = 0.5, vjust = 0.5))+
  annotate(geom='text',x=as.Date(c("2020-07-25")),y=222,label="Data: government policies",size=4)+
  annotate(geom='text',x=as.Date(c("2020-07-25")),y=199,label="Time window: 30 days",size=4)
fig3



Date<- as.character(seq.Date(from = as.Date("2020/01/01",format = "%Y/%m/%d"), to= as.Date("2021/09/15",format = "%Y/%m/%d"), by = "day"))
n=length(Date)
toPlot_confirm=D[,-c(1)]
library(reshape2)
library(ggplot2)
library(RColorBrewer)
toPlot_confirm=as.data.frame(t(toPlot_confirm))
Date <- as.Date(Date,"%Y-%m-%d")
toPlot_confirm[['index']] <- Date[6:619]
colnames(toPlot_confirm)=c('q-value<0.05','q-value<0.01','q-value<0.001','index')
toPlot_confirm<- melt(toPlot_confirm,'index')

palette<-brewer.pal(11,"PRGn")[c(10,8,3)]

fig4 <- ggplot(data=toPlot_confirm,aes(index)) + 
  geom_line(aes(y=value,color=variable,size=variable)) +
  scale_colour_manual(values=palette) +
  scale_size_manual(values = c(1,0.6,0.4))+
  labs(x='Date',y='The number of countries with \n significant changes') +
  ylim(0,80)+
  theme_bw() +
  mytheme +
  theme(legend.position=c(0.82,0.82))+theme(legend.title = element_blank())+
  theme(legend.background = element_blank())+
  theme(legend.text = element_text(size=9,face="bold"))+
  theme(legend.key.size = unit(10, "pt"),
        legend.box.background = element_rect(color="black", size=0.2),
        legend.box.margin = margin(-3, -2, 2, -2))+
  scale_x_date(breaks =as.Date(c("2020-01-06","2020-03-01","2020-05-01","2020-07-01","2020-09-01","2020-11-01","2021-01-01","2021-03-01","2021-05-01","2021-07-01","2021-09-10")),date_labels="%y/%m/%d")+
  theme(axis.text.x = element_text(angle = 342, hjust = 0.5, vjust = 0.5))+
  annotate(geom='text',x=as.Date(c("2020-07-25")),y=73,label="Data: new confirmed cases",size=3.8)+
  annotate(geom='text',x=as.Date(c("2020-07-25")),y=65,label="Time window: 10 days",size=3.8)
fig4



Date<- as.character(seq.Date(from = as.Date("2020/01/01",format = "%Y/%m/%d"), to= as.Date("2021/09/15",format = "%Y/%m/%d"), by = "day"))
n=length(Date)
toPlot_confirm=E[,-c(1)]
library(reshape2)
library(ggplot2)
library(RColorBrewer)
toPlot_confirm=as.data.frame(t(toPlot_confirm))
Date <- as.Date(Date,"%Y-%m-%d")
toPlot_confirm[['index']] <- Date[11:614]
colnames(toPlot_confirm)=c('q-value<0.05','q-value<0.01','q-value<0.001','index')
toPlot_confirm<- melt(toPlot_confirm,'index')

palette<-brewer.pal(11,"PRGn")[c(10,8,3)]

fig5 <- ggplot(data=toPlot_confirm,aes(index)) + 
  geom_line(aes(y=value,color=variable,size=variable)) +
  scale_colour_manual(values=palette) +
  scale_size_manual(values = c(1,0.6,0.4))+
  labs(x='Date',y='The number of countries with \n significant changes') +
  ylim(0,150)+
  theme_bw() +
  mytheme +
  theme(legend.position=c(0.82,0.82))+theme(legend.title = element_blank())+
  theme(legend.background = element_blank())+
  theme(legend.text = element_text(size=9,face="bold"))+
  theme(legend.key.size = unit(10, "pt"),
        legend.box.background = element_rect(color="black", size=0.2),
        legend.box.margin = margin(-3, -2, 2, -2))+
  scale_x_date(breaks =as.Date(c("2020-01-11","2020-03-01","2020-05-01","2020-07-01","2020-09-01","2020-11-01","2021-01-01","2021-03-01","2021-05-01","2021-07-01","2021-09-05")),date_labels="%y/%m/%d")+
  theme(axis.text.x = element_text(angle = 342, hjust = 0.5, vjust = 0.5))+
  annotate(geom='text',x=as.Date(c("2020-07-25")),y=140,label="Data: new confirmed cases",size=3.8)+
  annotate(geom='text',x=as.Date(c("2020-07-25")),y=125,label="Time window: 20 days",size=3.8)
fig5




Date<- as.character(seq.Date(from = as.Date("2020/01/01",format = "%Y/%m/%d"), to= as.Date("2021/09/15",format = "%Y/%m/%d"), by = "day"))
n=length(Date)
toPlot_confirm=F1[,-c(1)]
library(reshape2)
library(ggplot2)
library(RColorBrewer)
toPlot_confirm=as.data.frame(t(toPlot_confirm))
Date <- as.Date(Date,"%Y-%m-%d")
toPlot_confirm[['index']] <- Date[16:609]
colnames(toPlot_confirm)=c('q-value<0.05','q-value<0.01','q-value<0.001','index')
toPlot_confirm<- melt(toPlot_confirm,'index')

palette<-brewer.pal(11,"PRGn")[c(10,8,3)]

fig6 <- ggplot(data=toPlot_confirm,aes(index)) + 
  geom_line(aes(y=value,color=variable,size=variable)) +
  scale_colour_manual(values=palette) +
  scale_size_manual(values = c(1,0.6,0.4))+
  labs(x='Date',y='The number of countries with \n significant changes') +
  ylim(0,150)+
  theme_bw() +
  mytheme +
  theme(legend.position=c(0.82,0.82))+theme(legend.title = element_blank())+
  theme(legend.background = element_blank())+
  theme(legend.text = element_text(size=9,face="bold"))+
  theme(legend.key.size = unit(10, "pt"),
        legend.box.background = element_rect(color="black", size=0.2),
        legend.box.margin = margin(-3, -2, 2, -2))+
  scale_x_date(breaks =as.Date(c("2020-01-16","2020-03-06","2020-05-01","2020-07-01","2020-09-01","2020-11-01","2021-01-01","2021-03-01","2021-05-01","2021-07-01","2021-08-31")),date_labels="%y/%m/%d")+
  theme(axis.text.x = element_text(angle = 342, hjust = 0.5, vjust = 0.5))+
  annotate(geom='text',x=as.Date(c("2020-07-25")),y=140,label="Data: new confirmed cases",size=3.8)+
  annotate(geom='text',x=as.Date(c("2020-07-25")),y=125,label="Time window: 30 days",size=3.8)
fig6




Date<- as.character(seq.Date(from = as.Date("2020/01/01",format = "%Y/%m/%d"), to= as.Date("2021/09/15",format = "%Y/%m/%d"), by = "day"))
n=length(Date)
toPlot_deaths=I[,-c(1)]
library(reshape2)
library(ggplot2)
library(RColorBrewer)
toPlot_deaths=as.data.frame(t(toPlot_deaths))
Date <- as.Date(Date,"%Y-%m-%d")
toPlot_deaths[['index']] <- Date[16:609]
colnames(toPlot_deaths)=c('q-value<0.05','q-value<0.01','q-value<0.001','index')
toPlot_deaths<- melt(toPlot_deaths,'index')

palette<-brewer.pal(11,"RdBu")[c(10,8,3)]

fig9 <- ggplot(data=toPlot_deaths,aes(index)) + 
  geom_line(aes(y=value,color=variable,size=variable)) +
  scale_colour_manual(values=palette) +
  scale_size_manual(values = c(1,0.6,0.4))+
  labs(x='Date',y='The number of countries with \n significant changes') +
  ylim(0,91)+
  theme_bw() +
  mytheme +
  theme(legend.position=c(0.82,0.82))+theme(legend.title = element_blank())+
  theme(legend.background = element_blank())+
  theme(legend.text = element_text(size=9,face="bold"))+
  theme(legend.key.size = unit(10, "pt"),
        legend.box.background = element_rect(color="black", size=0.2),
        legend.box.margin = margin(-3, -2, 2, -2))+
  scale_x_date(breaks =as.Date(c("2020-01-16","2020-03-06","2020-05-01","2020-07-01","2020-09-01","2020-11-01","2021-01-01","2021-03-01","2021-05-01","2021-07-01","2021-08-31")),date_labels="%y/%m/%d")+
  theme(axis.text.x = element_text(angle = 342, hjust = 0.5, vjust = 0.5))+
  annotate(geom='text',x=as.Date(c("2020-07-25")),y=82,label="Data: new deaths",size=3.8)+
  annotate(geom='text',x=as.Date(c("2020-07-25")),y=74,label="Time window: 30 days",size=3.8)
fig9




Date<- as.character(seq.Date(from = as.Date("2020/01/01",format = "%Y/%m/%d"), to= as.Date("2021/09/15",format = "%Y/%m/%d"), by = "day"))
n=length(Date)
toPlot_deaths=H[,-c(1)]
library(reshape2)
library(ggplot2)
library(RColorBrewer)
toPlot_deaths=as.data.frame(t(toPlot_deaths))
Date <- as.Date(Date,"%Y-%m-%d")
toPlot_deaths[['index']] <- Date[11:614]
colnames(toPlot_deaths)=c('q-value<0.05','q-value<0.01','q-value<0.001','index')
toPlot_deaths<- melt(toPlot_deaths,'index')

palette<-brewer.pal(11,"RdBu")[c(10,8,3)]

fig8 <- ggplot(data=toPlot_deaths,aes(index)) + 
  geom_line(aes(y=value,color=variable,size=variable)) +
  scale_colour_manual(values=palette) +
  scale_size_manual(values = c(1,0.6,0.4))+
  labs(x='Date',y='The number of countries with \n significant changes') +
  ylim(0,91)+
  theme_bw() +
  mytheme +
  theme(legend.position=c(0.82,0.82))+theme(legend.title = element_blank())+
  theme(legend.background = element_blank())+
  theme(legend.text = element_text(size=9,face="bold"))+
  theme(legend.key.size = unit(10, "pt"),
        legend.box.background = element_rect(color="black", size=0.2),
        legend.box.margin = margin(-3, -2, 2, -2))+
  scale_x_date(breaks =as.Date(c("2020-01-11","2020-03-01","2020-05-01","2020-07-01","2020-09-01","2020-11-01","2021-01-01","2021-03-01","2021-05-01","2021-07-01","2021-09-05")),date_labels="%y/%m/%d")+
  theme(axis.text.x = element_text(angle = 342, hjust = 0.5, vjust = 0.5))+
  annotate(geom='text',x=as.Date(c("2020-07-25")),y=82,label="Data: new deaths",size=3.8)+
  annotate(geom='text',x=as.Date(c("2020-07-25")),y=74,label="Time window: 20 days",size=3.8)
fig8



Date<- as.character(seq.Date(from = as.Date("2020/01/01",format = "%Y/%m/%d"), to= as.Date("2021/09/15",format = "%Y/%m/%d"), by = "day"))
n=length(Date)
toPlot_deaths=G[,-c(1)]
library(reshape2)
library(ggplot2)
library(RColorBrewer)
toPlot_deaths=as.data.frame(t(toPlot_deaths))
Date <- as.Date(Date,"%Y-%m-%d")
toPlot_deaths[['index']] <- Date[6:619]
colnames(toPlot_deaths)=c('q-value<0.05','q-value<0.01','q-value<0.001','index')
toPlot_deaths<- melt(toPlot_deaths,'index')

palette<-brewer.pal(11,"RdBu")[c(10,8,3)]

fig7 <- ggplot(data=toPlot_deaths,aes(index)) + 
  geom_line(aes(y=value,color=variable,size=variable)) +
  scale_colour_manual(values=palette) +
  scale_size_manual(values = c(1,0.6,0.4))+
  labs(x='Date',y='The number of countries with \n significant changes') +
  ylim(0,50)+
  theme_bw() +
  mytheme +
  theme(legend.position=c(0.82,0.82))+theme(legend.title = element_blank())+
  theme(legend.background = element_blank())+
  theme(legend.text = element_text(size=9,face="bold"))+
  theme(legend.key.size = unit(10, "pt"),
        legend.box.background = element_rect(color="black", size=0.2),
        legend.box.margin = margin(-3, -2, 2, -2))+
  scale_x_date(breaks =as.Date(c("2020-01-06","2020-03-01","2020-05-01","2020-07-01","2020-09-01","2020-11-01","2021-01-01","2021-03-01","2021-05-01","2021-07-01","2021-09-10")),date_labels="%y/%m/%d")+
  theme(axis.text.x = element_text(angle = 342, hjust = 0.5, vjust = 0.5))+
  annotate(geom='text',x=as.Date(c("2020-07-25")),y=45,label="Data: new deaths",size=3.8)+
  annotate(geom='text',x=as.Date(c("2020-07-25")),y=40,label="Time window: 10 days",size=3.8)
fig7





library(cowplot)
plot_grid(fig1,fig2,fig3,fig4,fig5,fig6,fig7,fig8,fig9, labels = c("A", "B", "C", "D",'E','F','G','H','I'),label_size=20,ncol = 3)
