library(readr)
load('data/variates(HDI).RData')
load('data/activity_level_zscore.RData')

tem=matrix(ncol = 2, nrow = dim(mat)[1])
tem[,1]=mat$country
tem[,2]=mat$`Human Development Index (UNDP)`

for (i in 1:dim(all_number)[1]){
  all_number[i,8]=tem[which(tem[,1]==all_number[i,1]),2]
}

colnames(all_number)=c(colnames(all_number)[1:7],'human_develop_index')
all_number=na.omit(all_number)
all_number[,8]=scale(as.numeric(all_number[,8]), center=T,scale=T)



for (i in 1: dim(all_number)[1]){
  if (all_number[i,4]<=1 & all_number[i,4]>=-1){
    all_number[i,9]=1
  }
  else{
    all_number[i,9]=2
  }
}
colnames(all_number)=c(colnames(all_number)[1:8],'group')
all_number$group <- factor(all_number$group)




rownames(all_number)=all_number[,1]
palette2=c(brewer.pal(4,"Set2")[c(4)],'#5CACEE')


mytheme <- theme(plot.title = element_text(hjust = 0.5, size = 22),
                 panel.grid.major = element_blank(),
                 panel.grid.minor = element_blank(),
                 panel.border = element_rect(fill='transparent',color = 'transparent'),
                 axis.line = element_line(color='black'),
                 axis.text.x = element_text(size = 10,color='black'),
                 axis.text.y = element_text(size = 10,color='black'),
                 axis.title.x=element_text(size=12),
                 axis.title.y=element_text(size=12),
                 plot.margin=unit(c(0.5,1.5,0.5,1), 'lines'))

library(reshape2)
library(ggthemes)
library(ggplot2)
fig2=ggplot(all_number) +
  geom_point(data=all_number,aes(x=zscore_prevent_vs_confirm, y=human_develop_index,color=group),size=2.4,alpha=0.7) +
  geom_smooth(aes(x=zscore_prevent_vs_confirm, y=human_develop_index),method =loess,color='black')+
  geom_text(aes(zscore_prevent_vs_confirm, human_develop_index, color=group,label = rownames(all_number)),size = 1.5,hjust = 0, nudge_x = -0.09, nudge_y = -0.12) +
  geom_line(data=data.frame(x=c(-3,1.9),y=c(0,0)),aes(x=x,y=y),linetype='dashed',size=0.5,colour='#000000')+ # longdash
  scale_colour_manual(values=palette2) +
  theme_classic(base_size = 15)+
  labs(x='Policy activity levels (z-scored)',y='Scores of HDI (z-scored)') +
  theme_bw() +
  mytheme+
  theme(text=element_text("Helvetica"))+
  theme(axis.line.x=element_line(linetype=1,color="black",size=0.6))+
  theme(axis.line.y=element_line(linetype=1,color="black",size=0.6))+
  theme(legend.position = 'none')
fig2

