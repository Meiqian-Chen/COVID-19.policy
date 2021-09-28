library(readr)
load('data/data_selected_80_countries.RData')
source("functions.R")
source("clustering_method/mclust.R")
source("clustering_method/k_means.R")
source("clustering_method/hclust.R")
source("clustering_method/graph_cluster.R")


#graph clustering
re.c_list_graph=list()
for (i in 61:n){
  re.c_list_graph[[i]]=block(i)
}


#kmeans 
re.c_list_kmeans=list()
for (i in 61:n){
  re.c_list_kmeans[[i]]=kmeans_block(i,coun_num=80,clust_num = 7)
}


re.c_list_kmeans=list()
for (i in 61:n){
  re.c_list_kmeans[[i]]=kmeans_block(i,coun_num=80,clust_num = 5)
}




#hclust
re.c_list_hclust=list()
for (i in 61:n){
  re.c_list_hclust[[i]]=hclust_block(i,clust_num = 7)
}



re.c_list_hclust=list()
for (i in 61:n){
  re.c_list_hclust[[i]]=hclust_block(i,clust_num = 5)
}



#mclust
re.c_list_mclust=list()
for (i in 61:n){
  re.c_list_mclust[[i]]=mclust_block(i)
}




