library(readr)
library(reshape2)
library(ggplot2)
library(RColorBrewer)

prevent=read.csv('data/policy_20days.csv')
confirm=read.csv('data/confirm_20days.csv')
deaths=read.csv('data/deaths_20days.csv')

prevent=as.matrix(prevent)
confirm=as.matrix(confirm)
deaths=as.matrix(deaths)
data=rbind(prevent[1,-c(1)],confirm[1,-c(1)],deaths[1,-c(1)])
rownames(data)<-c('Government policies','New confirmed cases','New deaths')
colnames(data)<-seq(1,604)

data = as.data.frame(t(data)) 
date<- as.character(seq.Date(from = as.Date("2020/01/11",format = "%Y/%m/%d"), to= as.Date("2021/09/05",format = "%Y/%m/%d"), by = "day"))
date <- as.Date(date,"%Y-%m-%d")
data[['index']] <- date
data_new <- melt(data,'index')


mytheme <- theme(panel.grid.major = element_blank(),
                 panel.grid.minor = element_blank(),
                 panel.border = element_rect(fill='transparent',color = 'transparent'),
                 axis.line = element_line(color='black'),
                 plot.title = element_text(hjust = 0.5, size = 20),
                 axis.text.x = element_text(size = 10,color='black'),
                 axis.text.y = element_text(size = 10,color='black'),
                 axis.title.x=element_text(size=12),
                 axis.title.y=element_text(size=12),
                 plot.margin=unit(c(1,2,1,1), 'lines')
)

palette<-c( brewer.pal(3,"Set2"))


fig1 <- ggplot(data=data_new,aes(index)) + 
  geom_area(aes(y=value,fill=variable,color=variable),position="identity",alpha=0.6) +
  scale_y_continuous(limits=c(0,220),expand=c(0,0))+
  geom_line(data=data.frame(x=c(date[36],date[36]),y=c(0,203)),aes(x=x,y=y),linetype='longdash',size=0.5,color='black', alpha=1)+ # longdash
  geom_line(data=data.frame(x=c(date[109],date[109]),y=c(0,185)),aes(x=x,y=y),linetype='longdash',size=0.5,color='black', alpha=1)+
  scale_color_manual(values=palette) +
  scale_fill_manual(values=palette) +
  labs(x='Date',y='The number of countries with\n significant changes') +
  theme_bw() +
  mytheme +
  theme(legend.position=c(0.8,0.9))+theme(legend.title = element_blank())+
  theme(legend.background = element_blank())+
  theme(legend.text = element_text(size=11))+
  theme(legend.key.size = unit(13, "pt"),
        legend.box.background = element_rect(color="white", size=0.2),
        legend.box.margin = margin(-4, 0, 1, 0))+
  theme(axis.text.x = element_text(angle = 345, hjust = 0.5, vjust = 0.5))+
  theme(text=element_text("Helvetica"))+
  theme(axis.line.x=element_line(linetype=1,color="black",size=0.6))+
  theme(axis.line.y=element_line(linetype=1,color="black",size=0.6))+
  scale_x_date(breaks =as.Date(c("2020-01-11","2020-03-01","2020-05-01","2020-07-01","2020-09-01","2020-11-01","2021-01-01","2021-03-01","2021-05-01",'2021-07-01','2021-09-05')),date_labels="%y/%m/%d")+
  annotate(geom='text',x=as.Date(c("2020-02-15")),y=214,label="2020/02/15",color='black',size=3.5)+
  annotate(geom='text',x=as.Date(c("2020-04-28")),y=192,label="2020/04/28",color='black',size=3.5)
fig1

