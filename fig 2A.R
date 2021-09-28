library(readr)
library(flexclust)
load('data/clustering_ensemble_timeseries_results.RData')


coun = c()
n=length(re.c_list)
res_test=re.c_list[[61]]
for(i in 1:length(res_test)){
  coun = c(coun,res_test[[i]])
}
cluster2group_index<-function(K,res,coun){
  group = rep(1,K)
  for(i in 1:length(coun)){
    item = coun[i]
    # cat(item,'\n')
    for(j in 1:length(res)){
      clu = res[[j]]
      if(item %in% clu){
        group[i] = j
      }
    }
  }
  names(group)=coun
  return(group)
}
re.c_list_new=list()
for(i in 61:n){
  cluster_res=re.c_list[[i]]
  group_=group2=cluster2group_index(length(coun),cluster_res,coun)
  
  re.c_list_new[[i]]=list(cluster=cluster_res,group=group_)
}




# rand index 
dist_vect_1=c()
for(i in 61:(n-1)){
  dist_vect_1[i-60]=comPart(re.c_list_new[[i]]$group,re.c_list_new[[i+1]]$group)['RI']
}

dist_vect_7=c()
for(i in 61:(n-7)){
  dist_vect_7[i-60]=comPart(re.c_list_new[[i]]$group,re.c_list_new[[i+7]]$group)['RI']
}

dist_vect_15=c()
for(i in 61:(n-15)){
  dist_vect_15[i-60]=comPart(re.c_list_new[[i]]$group,re.c_list_new[[i+15]]$group)['RI']
}

date<- as.character(seq.Date(from = as.Date("2020/03/01",format = "%Y/%m/%d"), to= as.Date("2021/09/14",format = "%Y/%m/%d"), by = "day"))
date <- as.Date(date,"%Y-%m-%d")
plot_data=matrix(nrow=length(date[62:n-1]),ncol=3)
plot_data[,1]=t(dist_vect_1)
plot_data[1:557,2]=t(dist_vect_7)
plot_data[1:549,3]=t(dist_vect_15)
plot_data=as.data.frame(plot_data)
colnames(plot_data)=c('1 days','7 days','15 days')
plot_data[['index']] <- date

library(RColorBrewer)
palette<-c( brewer.pal(3,"Set2"))



# plot of the Fig.2 (Rand Index)
mytheme <- theme(panel.grid.major = element_blank(),
                 panel.grid.minor = element_blank(),
                 panel.border = element_rect(fill='transparent',color = 'transparent'),
                 axis.line = element_line(color='black'),
                 plot.title = element_text(hjust = 0.5, size = 20),
                 axis.text.x = element_text(size = 10,color='black'),
                 axis.text.y = element_text(size = 10,color='black'),
                 axis.title.x=element_text(size=12),
                 axis.title.y=element_text(size=12),
                 plot.margin=unit(c(1,1,1,1), 'lines')
)

fig1 <- ggplot(data=plot_data) + 
  geom_point(data=plot_data,aes(x=index, y=plot_data[,1]),size=2.5,shape=15,color=palette[1],alpha=0.9) +
  geom_smooth(aes(x=index, y=plot_data[,1]),method =lm,size=0.8,color='black')+
  ylim(0,1)+
  labs(x='Date',y='Similarities between the clustering \n results on adjacent days') +
  theme_bw() +
  mytheme+
  theme(text=element_text("Helvetica"))+
  theme(axis.line.x=element_line(linetype=1,color="black",size=0.6))+
  theme(axis.line.y=element_line(linetype=1,color="black",size=0.6))+
  theme(legend.position = 'none')+
  scale_x_date(breaks =as.Date(c("2020-03-01","2020-05-01","2020-07-01","2020-09-01","2020-11-01","2021-01-01","2021-03-01","2021-05-01","2021-07-01","2021-09-14")),date_labels="%y/%m/%d")+
  theme(axis.text.x = element_text(angle = 340, hjust = 0.5, vjust = 0.5))
fig1
