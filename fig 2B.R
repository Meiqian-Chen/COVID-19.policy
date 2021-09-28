library(igraph)
library(reshape)
library(ggplot2)
library(RColorBrewer)
load("data/data_selected_80_countries.RData")
load('data/policy_patterns_same_country.RData')

data_pre=matrix(NA,80,17)
colnames(data_pre)=c('country','c_one','c_two','c_three','c_four','c_fivr','c_six','c_seven','c_eight','e_one','e_two','h_one','h_two','h_three','h_six','h_seven','h_eight')
rownames(data_pre)=coun
data_pre[,1]=coun


for (i in 2:dim(data_pre)[2]){
  #data_pre[,i]=round(colMeans(data_all[[i-1]]),1)
  data_pre[,i]=data_all[[i-1]][624,]
}

for (i in 1:length(same_country)){
  for (j in 1:length(same_country[[i]])){
    data_pre[which(data_pre[,1]==same_country[[i]][j]),1]=i
  }
}

data_pre[,2:17]=as.numeric(as.character(data_pre[,2:17]))
data_pre=as.data.frame(data_pre)
data_pre$country <- factor(data_pre$country)



data_1=data_pre[which(data_pre[,1]==1),2:17]
data_2=data_pre[which(data_pre[,1]==2),2:17]
data_3=data_pre[which(data_pre[,1]==3),2:17]
data_4=data_pre[which(data_pre[,1]==4),2:17]
data_5=data_pre[which(data_pre[,1]==5),2:17]
data_6=data_pre[which(data_pre[,1]==6),2:17]

data_trans<-function(data){
  data=as.data.frame(data)
  data_new=t(data)
  data_new=as.data.frame(data_new)
  data_new[['index']]=c("C1","C2","C3","C4","C5","C6","C7","C8","E1",'E2','H1','H2','H3','H6',"h7",'H8')
  data_plot<- melt(data_new,'index')
  index_text=1:16
  coun_num=length(unique(data_plot['variable'])$variable)
  data_plot['x']=rep(index_text,coun_num)
  return(data_plot)
}
data_plot_1<-data_trans(data_1)
data_plot_2<-data_trans(data_2)
data_plot_3<-data_trans(data_3)
data_plot_4<-data_trans(data_4)
data_plot_5<-data_trans(data_5)
data_plot_6<-data_trans(data_6)

data_pre=as.data.frame(data_pre)
data_new=data_pre[,-c(1)]
data_new=t(data_new)
data_new=as.data.frame(data_new)
data_new[['index']]=c("C1","C2","C3","C4","C5","C6","C7","C8","E1",'E2','H1','H2','H3','H6',"h7",'H8')
data_plot<- melt(data_new,'index')



mytheme <- theme(panel.grid.major = element_blank(),
                 panel.grid.minor = element_blank(),
                 panel.border = element_rect(fill='transparent',color = 'transparent'),
                 axis.line = element_line(color='black'),
                 plot.title = element_text(hjust = 0.5, size = 20),
                 axis.text.x = element_text(size = 10,color='black'),
                 axis.text.y = element_text(size = 10,color='black'),
                 axis.title.x=element_text(size=12,face=),
                 axis.title.y=element_text(size=12,face=),
                 plot.margin=unit(c(1,1,1,1), 'lines')
)
palette<-brewer.pal(6,"Set1")
ple<-brewer.pal(8,"Pastel2")[3]
color=matrix(,80,2)
color[,1]=coun
for (i in 1:dim(color)[1]){
  if (color[i,1] %in% same_country[[1]]==TRUE){
    color[i,2]=ple
  }
  if (color[i,1] %in% same_country[[2]]==TRUE){
    color[i,2]=palette[2]
  }
  if (color[i,1] %in% same_country[[3]]==TRUE){
    color[i,2]=palette[3]
  }
  if (color[i,1] %in% same_country[[4]]==TRUE){
    color[i,2]=palette[4]
  }
  if (color[i,1] %in% same_country[[5]]==TRUE){
    color[i,2]=palette[5]
  }
  if (color[i,1] %in% same_country[[6]]==TRUE){
    color[i,2]=palette[6]
  }
}

fig2 <- ggplot(data=data_plot,aes(x)) + 
  geom_line(data=data_plot_1,aes(y=log(1+as.numeric(value)),color=variable),size=0.6) +
  geom_line(data=data_plot_2,aes(y=log(1+as.numeric(value)),color=variable),size=1.2) +
  geom_line(data=data_plot_3,aes(y=log(1+as.numeric(value)),color=variable),size=1.2) +
  geom_line(data=data_plot_4,aes(y=log(1+as.numeric(value)),color=variable),size=1.2) +
  geom_line(data=data_plot_5,aes(y=log(1+as.numeric(value)),color=variable),size=1.2) +
  geom_line(data=data_plot_6,aes(y=log(1+as.numeric(value)),color=variable),size=1.2) +
  # ylim(0,200)+
  scale_colour_manual(values=color[,2]) +
  scale_x_continuous(labels = c("C1","C2","C3","C4","C5","C6","C7","C8","E1",'E2','H1','H2','H3','H6',"H7",'H8'), breaks = seq(1, 16, 1))+
  labs(x='Indicators of government policies',y='Log-transformed cumulative strictness scores') +
  theme_bw() +
  mytheme +
  theme(axis.line.x=element_line(linetype=1,color="black",size=0.6))+
  theme(axis.line.y=element_line(linetype=1,color="black",size=0.6))+
  theme(text=element_text("Helvetica"))+
  theme(legend.position = 'none')
fig2



# average of the same cluster

ple1<-brewer.pal(2,"Pastel1")[2]

mytheme <- theme(
  axis.text.x = element_text(size = 6,color='black'),
  axis.text.y = element_text(size = 6,color='black'),
  axis.title.x=element_text(size=9),
  axis.title.y=element_text(size=9),
  plot.background=element_rect(I(0)),
  panel.background=element_rect(I(0)),
  panel.grid.major=element_line(colour=NA),
  panel.grid.minor=element_line(colour=NA),
  plot.margin=unit(c(0,0,0,0), 'lines')
)



for(i in 1:dim(data_1)[2]){
  data_1[,i]=as.numeric(data_1[,i])
}
data_11=data.frame(colMeans(data_1))
colnames(data_11)=c('value')
data_11['variable']=rep('Remaining 72 countries',16)
data_11['x']=1:16

# CRI,EGY,HUN,TUR
for(i in 1:dim(data_3)[2]){
  data_3[,i]=as.numeric(data_3[,i])
}
data_31=data.frame(colMeans(data_3))
colnames(data_31)=c('value')
data_31['variable']=rep('CRI,EGY,HUN,TUR',16)
data_31['x']=1:16

fig21 <- ggplot(data=data_11,aes(x)) + 
  geom_line(data=data_11,aes(y=log(1+as.numeric(value)),color=variable),size=1.2) +
  geom_line(data=data_plot_2,aes(y=log(1+as.numeric(value)),color=variable),size=0.7) +
  geom_line(data=data_31,aes(y=log(1+as.numeric(value)),color=variable),size=0.7) +
  geom_line(data=data_plot_4,aes(y=log(1+as.numeric(value)),color=variable),size=0.7) +
  geom_line(data=data_plot_5,aes(y=log(1+as.numeric(value)),color=variable),size=0.7) +
  geom_line(data=data_plot_6,aes(y=log(1+as.numeric(value)),color=variable),size=0.7) +
  scale_colour_manual(values=c(palette[2],palette[3],palette[4],palette[5],ple1,palette[6])) +
  scale_x_continuous(labels = c("C1","C2","C3","C4","C5","C6","C7","C8","E1",'E2','H1','H2','H3','H6',"H7",'H8'), breaks = seq(1, 16, 1))+
  labs(x='Indicators of government policies',y='Average of the same cluster') +
  # theme(legend.position="none") +
  theme_bw()+
  mytheme+
  theme(text=element_text("Helvetica"))+
  theme(legend.title = element_blank())+
  theme(legend.position="left")+
  theme(legend.background = element_blank())+
  theme(legend.text = element_text(size=8,face="bold"))+
  theme(legend.key.size = unit(14, "pt"),
        legend.box.background = element_rect(color=I(0), fill=I(0),size=0.2),
        legend.box.margin = margin(-4, 2, 1, 0))
fig21



