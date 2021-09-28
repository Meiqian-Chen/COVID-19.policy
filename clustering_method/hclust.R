# this function is used to generate the clustering results

library(igraph)


coun_all=coun #coun is the number of chose countries
data_all=get.data.all(c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16))
data_list = list()
for(i in 1:length(coun)){
  data_list[[coun[i]]]=matrix(c(data_all[,which(coun_all==coun[i])]),n,16)
}

fibs <- function(data_all_plot_3,num,n,num_list,sum_list){
  mat = data_all_plot_3[num,]
  sum_obj = sum(mat)
  if(sum_obj!=0 & !(num %in% num_list) & !(sum_obj %in% sum_list)){
    return(list(mat=mat,num=num,sum_obj=sum_obj))
  }else{
    if(num<=(n-10)){
      fibs(data_all_plot_3,(num+1),n,num_list,sum_list)
    }else{
      fibs(data_all_plot_3,(num-1),n,num_list,sum_list)
    }
  }
}


hclust_block<-function(n,re.c.lag=NULL,clust_num=5,dist_method="euclidean",clust_method="complete"){
  data_all_plot_3 = matrix(0,length(coun),16)
  colnames(data_all_plot_3)=seq(1,16,1)
  rownames(data_all_plot_3)=coun
  for (j in 1:length(coun)) {
    data_all_plot_3[j,] = data_list[[j]][n,]
  }
  
  out.dist=dist(data_all_plot_3,method="euclidean")
  
  out.hclust = hclust(out.dist,method="complete")
  nc = clust_num
  re.c = list()
  re.c[['cluster']] = cutree(out.hclust, k=nc)
  len = rep(0,nc)
  for (i in 1:length(coun)) {
    for (j in 1:nc) {
      if(re.c$cluster[i] == j){
        len[j] = len[j] + 1
      }
    }
  }
  re.c[["groups_len"]] = len
  coun_c = c()
  clus = c()
  groups_ = list()
  for(i in 1:nc){
    coun_c_test = c()
    for(j in 1:length(coun)){
      if(re.c$cluster[j]==i){
        coun_c = c(coun_c,coun[j])
        coun_c_test = c(coun_c_test,coun[j])
      }
    }
    groups_[[i]] = coun_c_test
    clus = c(clus,paste("Cluster-",rep(i,re.c$groups_len[[i]]),sep = ""))
  }
  re.c[["groups"]]=groups_
  re.c[["data"]] = data.frame(country=coun_c,class=clus)
  return(re.c)
}