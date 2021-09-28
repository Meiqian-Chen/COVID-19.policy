library(readr)
library(RColorBrewer)
confirm<- read.csv("data/confirmed_cases.csv")
deaths<-read.csv("data/confirmed_deaths.csv")
load('data/country(q<0.05).RData')


AR=list()
for (i in 1:length(select_country_confirmed)){
  a=select_country_prevent[[i]]
  b=intersect(select_country_prevent[[i]],select_country_confirmed[[i]])
  AR[[i]]=unique(c(a[!a %in% b],a[duplicated(a)]))
}

AR1=list()
for (i in 1:length(select_country_deaths)){
  a=select_country_prevent[[i]]
  b=intersect(select_country_prevent[[i]],select_country_deaths[[i]])
  AR1[[i]]=unique(c(a[!a %in% b],a[duplicated(a)]))
}




all_number=as.data.frame(table(unlist(AR)))
all_number[,3]=as.data.frame(table(unlist(AR1)))[,2]
tem=scale(all_number[,2], center=T,scale=T)
tem1=scale(all_number[,3], center=T,scale=T)
colnames(all_number)=c('country','times_prevent_vs_confirm','times_prevent_vs_deaths')
all_number['zscore_prevent_vs_confirm']=tem
all_number['zscore_prevent_vs_deaths']=tem1

total_confirm=scale(confirm[,627], center=T,scale=T)
total_deaths=scale(deaths[,627], center=T,scale=T)
all_number['total_confirm']=total_confirm
all_number['total_deaths']=total_deaths

all_number=na.omit(all_number)

N=all_number[,1]
Nam=matrix(0,dim(all_number)[1],1)
for (i in 1:dim(all_number)[1]){
  if (all_number[i,6]<2.5){
    N[i]=' '
  }
}


library(reshape2)
library(ggthemes)
library(ggplot2)
plot_data=all_number

palette<-c( brewer.pal(6,"Set2")[c(2,6)],brewer.pal(6,"YlGnBu")[c(6)])

mytheme <- theme(plot.title = element_text(hjust = 0.5, size = 22),
                 panel.grid.major = element_blank(),
                 panel.grid.minor = element_blank(),
                 panel.border = element_rect(fill='transparent',color = 'transparent'),
                 axis.line = element_line(color='black'),
                 axis.text.x = element_text(size = 10,color='black'),
                 axis.text.y = element_text(size = 10,color='black'),
                 axis.title.x=element_text(size=12),
                 axis.title.y=element_text(size=12),
                 plot.margin=unit(c(0.5,0.5,0.5,1.5), 'lines'))



p1=ggplot(plot_data) +
  geom_point(data=plot_data,aes(y=total_confirm,x=zscore_prevent_vs_confirm),size=3,color=palette[1],alpha=0.7 )+
  geom_smooth(aes(y=total_confirm, x=zscore_prevent_vs_confirm),method =lm,color='black')+
  geom_text(aes( zscore_prevent_vs_confirm, total_confirm,label = N),size = 3,hjust = 0, nudge_x = -0.13,nudge_y=-0.44,color='black') +
  scale_y_continuous(limits=c(-2,10.5),expand=c(0,0))+
  theme_classic(base_size = 15)+
  labs(x='Policy activity levels (z-scored)',y='Total confirmed cases (z-scored)') +
  theme_bw() +
  mytheme+
  theme(axis.line.x=element_line(linetype=1,color="black",size=0.6))+
  theme(axis.line.y=element_line(linetype=1,color="black",size=0.6))+
  theme(text=element_text("Helvetica"))+
  theme(legend.position = 'none')
p1


