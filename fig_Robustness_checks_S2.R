library(readr)
stringth<- read.csv('data/stringency_index.csv')
source("R_function/DEswan.r")
source("R_function/nsignif.DEswan.r")
source("R_function/q.DEswan.r")
source("R_function/reshape.DEswan.r")
source("R_function/utility.script.r")



#window=10 days
Date<- as.character(seq.Date(from = as.Date("2020/01/01",format = "%Y/%m/%d"), to= as.Date("2021/09/15",format = "%Y/%m/%d"), by = "day"))
n=length(Date)
coun<-stringth[,2]
score_data = matrix(0,n,length(coun))
colnames(score_data)=stringth[,2]
rownames(score_data)=Date


for (j in 1:length(stringth[,2])){
  for (k in 1:length(coun)){
    if (stringth[j,2]==coun[k]){
      score_data[,k]=as.numeric(t(stringth[j,4:627]))
    }
  }
}
for (m in 1:length(coun)){
  if (is.na(score_data[1,m])){
    score_data[1,m]=0
  }
  for (h in 2:n){
    if (is.na(score_data[h,m])){
      score_data[h,m]=score_data[(h-1),m]
    }
  }
}

score_data<-as.data.frame(score_data)
score_data[['index']]<-seq(1,n)

res.DEswan=DEswan(data.df = score_data[,-c(187)],
                  # res.DEswan=DEswan(data.df = agingplasmaproteome[,3+c(which(colnames(x) %in% colnames(x)[abs(x)>.5]))],
                  qt = score_data[['index']],
                  window.center = seq(1,n,1),
                  buckets.size = 5)

# Reshape DEswan results
# DEswan outputs are in long format. Reshaping the results to wide format helps the exploration of the statistics produces by DEswan
res.DEswan.wide.p=reshape.DEswan(res.DEswan,parameter = 1,factor = "qt")
head(res.DEswan.wide.p[,1:5])

# Pvalues adjustment
res.DEswan.wide.q=q.DEswan(res.DEswan.wide.p,method="BH")
head(res.DEswan.wide.q[,1:5])

# Calculate and plot the number of significant variables
# One simple way to visualize DEswan results is to count the number of significant variables for each window.center tested.
# head(res.DEswan.wide.p[,1:5])
res.DEswan.wide.q.signif=nsignif.DEswan(res.DEswan.wide.q)
toPlot=res.DEswan.wide.q.signif[1:3,-c(1:4,619:622)]
colnames(toPlot)=Date[6:619]


#window=20 days

res.DEswan=DEswan(data.df = score_data[,-c(187)],
                  # res.DEswan=DEswan(data.df = agingplasmaproteome[,3+c(which(colnames(x) %in% colnames(x)[abs(x)>.5]))],
                  qt = score_data[['index']],
                  window.center = seq(1,n,1),
                  buckets.size = 10)

# Reshape DEswan results
# DEswan outputs are in long format. Reshaping the results to wide format helps the exploration of the statistics produces by DEswan
res.DEswan.wide.p=reshape.DEswan(res.DEswan,parameter = 1,factor = "qt")
head(res.DEswan.wide.p[,1:5])

# Pvalues adjustment
res.DEswan.wide.q=q.DEswan(res.DEswan.wide.p,method="BH")
head(res.DEswan.wide.q[,1:5])

# Calculate and plot the number of significant variables
# One simple way to visualize DEswan results is to count the number of significant variables for each window.center tested.
# head(res.DEswan.wide.p[,1:5])
res.DEswan.wide.q.signif=nsignif.DEswan(res.DEswan.wide.q)
toPlot1=res.DEswan.wide.q.signif[1:3,-c(1:9,614:622)]
colnames(toPlot1)=Date[11:614]


#window=30 days
res.DEswan=DEswan(data.df = score_data[,-c(187)],
                  # res.DEswan=DEswan(data.df = agingplasmaproteome[,3+c(which(colnames(x) %in% colnames(x)[abs(x)>.5]))],
                  qt = score_data[['index']],
                  window.center = seq(1,n,1),
                  buckets.size = 15)

# Reshape DEswan results
# DEswan outputs are in long format. Reshaping the results to wide format helps the exploration of the statistics produces by DEswan
res.DEswan.wide.p=reshape.DEswan(res.DEswan,parameter = 1,factor = "qt")
head(res.DEswan.wide.p[,1:5])

# Pvalues adjustment
res.DEswan.wide.q=q.DEswan(res.DEswan.wide.p,method="BH")
head(res.DEswan.wide.q[,1:5])

# Calculate and plot the number of significant variables
# One simple way to visualize DEswan results is to count the number of significant variables for each window.center tested.
# head(res.DEswan.wide.p[,1:5])
res.DEswan.wide.q.signif=nsignif.DEswan(res.DEswan.wide.q)
toPlot2=res.DEswan.wide.q.signif[1:3,-c(1:14,609:622)]
colnames(toPlot2)=Date[16:609]


toPlot=as.data.frame(t(toPlot))
Date <- as.Date(Date,"%Y-%m-%d")
toPlot[['index']] <- Date[6:619]
colnames(toPlot)=c('q-value<0.05','q-value<0.01','q-value<0.001','index')
toPlot<- melt(toPlot,'index')


toPlot1=as.data.frame(t(toPlot1))
Date <- as.Date(Date,"%Y-%m-%d")
toPlot1[['index']] <- Date[11:614]
colnames(toPlot1)=c('q-value<0.05','q-value<0.01','q-value<0.001','index')
toPlot1<- melt(toPlot1,'index')


toPlot2=as.data.frame(t(toPlot2))
Date <- as.Date(Date,"%Y-%m-%d")
toPlot2[['index']] <- Date[16:609]
colnames(toPlot2)=c('q-value<0.05','q-value<0.01','q-value<0.001','index')
toPlot2<- melt(toPlot2,'index')





#------------------------------------------------------------------------------------------------------
#plot_figure
library(reshape2)
library(ggplot2)
library(RColorBrewer)
Date<- as.character(seq.Date(from = as.Date("2020/01/01",format = "%Y/%m/%d"), to= as.Date("2021/09/15",format = "%Y/%m/%d"), by = "day"))
n=length(Date)
mytheme <- theme(panel.grid.major = element_blank(),
                 panel.grid.minor = element_blank(),
                 plot.title = element_text(hjust = 0.5, size = 20),
                 axis.text.x = element_text(size = 9,color='black'),
                 axis.text.y = element_text(size = 11,color='black'),
                 axis.title.x=element_text(size=15,face="bold"),
                 axis.title.y=element_text(size=13,face="bold"),
                 plot.margin=unit(c(1,2,1,2), 'lines')
)
palette<-brewer.pal(5,"Set1")[c(2,3,5)]

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
  annotate(geom='text',x=as.Date(c("2020-07-01")),y=222,label="Data: stringency index",size=4)+
  annotate(geom='text',x=as.Date(c("2020-07-01")),y=199,label="Time window: 10 days",size=4)
fig1




#-----------------------------------------------------------------

library(reshape2)
library(ggplot2)
library(RColorBrewer)
Date<- as.character(seq.Date(from = as.Date("2020/01/01",format = "%Y/%m/%d"), to= as.Date("2021/09/15",format = "%Y/%m/%d"), by = "day"))
n=length(Date)
mytheme <- theme(panel.grid.major = element_blank(),
                 panel.grid.minor = element_blank(),
                 plot.title = element_text(hjust = 0.5, size = 20),
                 axis.text.x = element_text(size = 9,color='black'),
                 axis.text.y = element_text(size = 11,color='black'),
                 axis.title.x=element_text(size=15,face="bold"),
                 axis.title.y=element_text(size=13,face="bold"),
                 plot.margin=unit(c(1,2,1,2), 'lines')
)
palette<-brewer.pal(5,"Set1")[c(2,3,5)]



fig2 <- ggplot(data=toPlot1,aes(index)) + 
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
  annotate(geom='text',x=as.Date(c("2020-07-01")),y=222,label="Data: stringency index",size=4)+
  annotate(geom='text',x=as.Date(c("2020-07-01")),y=199,label="Time window: 20 days",size=4)
fig2




#-----------------------------------------------------------------
library(reshape2)
library(ggplot2)
library(RColorBrewer)
Date<- as.character(seq.Date(from = as.Date("2020/01/01",format = "%Y/%m/%d"), to= as.Date("2021/09/15",format = "%Y/%m/%d"), by = "day"))
n=length(Date)
mytheme <- theme(panel.grid.major = element_blank(),
                 panel.grid.minor = element_blank(),
                 plot.title = element_text(hjust = 0.5, size = 20),
                 axis.text.x = element_text(size = 9,color='black'),
                 axis.text.y = element_text(size = 11,color='black'),
                 axis.title.x=element_text(size=15,face="bold"),
                 axis.title.y=element_text(size=13,face="bold"),
                 plot.margin=unit(c(1,2,1,2), 'lines')
)
palette<-brewer.pal(5,"Set1")[c(2,3,5)]



fig3 <- ggplot(data=toPlot2,aes(index)) + 
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
  annotate(geom='text',x=as.Date(c("2020-07-01")),y=222,label="Data: stringency index",size=4)+
  annotate(geom='text',x=as.Date(c("2020-07-01")),y=199,label="Time window: 30 days",size=4)
fig3

library(cowplot)
plot_grid(fig1,fig2,fig3, labels = c("A", "B", "C"),label_size=18,ncol = 1)

