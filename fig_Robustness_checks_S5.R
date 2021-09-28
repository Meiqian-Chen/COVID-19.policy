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
palette<-c( brewer.pal(2,"Dark2")[c(2,1)],brewer.pal(3,"Set1")[c(2)])

#————————————————————————————————————————————————————————————————————————————————————
# 7 days and 15 days


plot_data2=plot_data[,-c(1)]
data_new <- melt(plot_data2,'index')

mytheme <- theme(panel.grid.major = element_blank(),
                 panel.grid.minor = element_blank(),
                 plot.title = element_text(hjust = 0.5, size = 20),
                 axis.text.x = element_text(size = 10,color='black'),
                 axis.text.y = element_text(size = 10,color='black'),
                 axis.title.x=element_text(size=14,face="bold"),
                 axis.title.y=element_text(size=14,face="bold")
                 
)
library(RColorBrewer)
palette<-c( brewer.pal(2,"Dark2")[c(2,1)],brewer.pal(3,"Set1")[c(2)])



fig1 <- ggplot(data_new,aes(index)) + 
  geom_point(aes(y=value,color=variable,shape=variable),size=1.6) +
  geom_smooth(aes(y=value,color=variable),method =lm,size=0.8)+
  ylim(0,1)+
  scale_colour_manual(values=palette[c(2,3)]) +
  scale_shape_manual(values=c(16,17))+
  labs(x='Date',y='Similarities of two clustering results \n 7 (or 15) days apart') +
  theme_bw() +
  mytheme +
  theme(legend.position=c(0.8,0.2))+theme(legend.title = element_blank())+
  theme(legend.background = element_blank())+
  theme(legend.text = element_text(size=14,face="bold"))+
  theme(legend.key.size = unit(17, "pt"),
        legend.box.background = element_rect(color="black", size=0.2),
        legend.box.margin = margin(-3, 0, 1, 0))+
  theme(legend.background = element_blank())+
  theme(legend.key = element_blank())+
  theme(axis.text.x = element_text(angle = 345, hjust = 0.5, vjust = 0.5))+
  annotate(geom='text',x=as.Date(c("2020-08-01")),y=0.15,label="Use the Rand index method",color='black',size=5)+
  scale_x_date(breaks =as.Date(c("2020-03-01","2020-05-01","2020-07-01","2020-09-01","2020-11-01","2021-01-01","2021-03-01","2021-05-01","2021-07-01","2021-09-08")),date_labels="%y/%m/%d")
fig1

