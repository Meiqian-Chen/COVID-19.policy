library(readr)
library(RColorBrewer)
setwd("/Users/mqchen/Desktop/防疫模式应用论文/code9.17")
confirm<- read.csv("data/confirmed_cases.csv")
deaths<-read.csv("data/confirmed_deaths.csv")
load('data/activity_level_zscore.RData')

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
                 axis.text.x = element_text(size = 10,color='black'),
                 axis.text.y = element_text(size = 10,color='black'),
                 axis.title.x=element_text(size=14,face="bold"),
                 axis.title.y=element_text(size=14,face="bold"),
                 plot.margin=unit(c(2,2,2,2), 'lines'))



p1=ggplot(plot_data) +
  geom_point(data=plot_data,aes(y=total_deaths,x=zscore_prevent_vs_deaths),size=3,color=palette[1],alpha=0.7) +
  geom_smooth(aes(y=total_deaths, x=zscore_prevent_vs_deaths),method =lm,color='black')+
  geom_text(aes( zscore_prevent_vs_deaths, total_deaths,label = N),size = 3,hjust = 0, nudge_x = -0.1,nudge_y=-0.4,color='black') +
  theme_classic(base_size = 15)+
  labs(x='Policy activity levels (z-scored)',y='Total deaths (z-scored)') +
  ylim(-1, 10.5)+
  theme_bw() +
  mytheme+
  theme(legend.position = 'none')
p1


