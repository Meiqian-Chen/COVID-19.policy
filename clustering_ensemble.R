library(readr)
library(igraph)


# load data
load('data/hclust(5)_results.RData')
re.c_list_hclust_5=re.c_list_hclust
load('data/hclust(7)_results.RData')
re.c_list_hclust_7=re.c_list_hclust
load('data/kmeans(5)_results.RData')
re.c_list_kmeans_5=re.c_list_kmeans
load('data/kmeans(7)_results.RData')
re.c_list_kmeans_7=re.c_list_kmeans
load('data/mclust_results.RData')
load('data/graph_results.RData')


coun=read.csv('data/country_select_80.csv')[,1]

n=length(re.c_list_graph)
coun_num<-length(coun)
clu_results=list()
for(i in 61:n){
  cat('now is time ',i,'\n')
  all_clu_results=list()
  
  all_clu_results[[1]]=re.c_list_graph[[i]]$cluster
  all_clu_results[[2]]=re.c_list_hclust_5[[i]]$cluster
  all_clu_results[[3]]=re.c_list_hclust_7[[i]]$cluster
  all_clu_results[[4]]=re.c_list_kmeans_5[[i]]$cluster
  all_clu_results[[5]]=re.c_list_kmeans_7[[i]]$cluster
  all_clu_results[[6]]=re.c_list_mclust[[i]]$classification
  
  
  # cluster ensemble
  similarity_mat<-matrix(0,coun_num,coun_num)
  colnames(similarity_mat)<-coun
  rownames(similarity_mat)<-coun
  for(coun_i in 1:length(coun)){
    for(coun_j in 1:length(coun)){
      if(coun_i >= coun_j){
        next
      }else{
        for (item in all_clu_results) {
          # If you only have one cluster, add 1
          if(length(unique(item))==1){
            similarity_mat[coun_i,coun_j]=similarity_mat[coun_i,coun_j]+1
            next
          }
          if(item[coun[coun_i]]==item[coun[coun_j]]){
            similarity_mat[coun_i,coun_j]=similarity_mat[coun_i,coun_j]+1
          }
        }
        similarity_mat[coun_i,coun_j]=similarity_mat[coun_i,coun_j]
      }
    }
  }
  # Quantity statistical matrix for each time point
  clu_results[[i]]=list(similarity_mat=similarity_mat)
}

# create 
similarity_mat_list = list()
re.c_list = list()
for (i in 61:n) {
  similarity_mat_cross<-matrix(0,coun_num,coun_num)
  colnames(similarity_mat_cross)<-coun
  rownames(similarity_mat_cross)<-coun
  for(coun_i in 1:length(coun)){
    for (coun_j in 1:length(coun)) {
      if(coun_i >= coun_j){
        next
      }else{
        if(clu_results[[i]]$similarity_mat[coun_i,coun_j]>=4){
          similarity_mat_cross[coun_i,coun_j]=1
        }
      }
    }
  }
  similarity_mat_list[[i]]=similarity_mat_cross
  g1 <- graph_from_adjacency_matrix(similarity_mat_cross)
  re.c_list[[i]]=igraph::groups(components(g1))
}



#------------------------------------------------------------------------
#policy patterns
res_list_trans=function(A){
  res_list=list()
  index=1
  for(item in A){
    if(length(item)==1){
      next
    }else{
      item_1=sort(item)
      for(i in 1:(length(item_1)-1)){
        for(j in (i+1):length(item_1)){
          res_list[[index]]=c(item_1[i],item_1[j])
          index = index + 1
        }
      }
    }
    # cat(item,'\n')
  }
  return(res_list)
}

coun=c()
for(item in re.c_list[[61]]){
  coun=c(coun,item)
}
coun=sort(coun)
coun_num=1:length(coun)
names(coun_num)=coun
coun_pair=list()
index=1
for(i in 1:(length(coun)-1)){
  for(j in (i+1):length(coun)){
    coun_pair[[index]]=c(coun[i],coun[j])
    index = index + 1
  }
}
res=coun_pair
mat_calcu=matrix(0,nrow=length(coun),ncol=length(coun))
colnames(mat_calcu)=coun
rownames(mat_calcu)=coun
for(i in 62:length(re.c_list)){
  cat(i,'\n')
  res_test=intersect(res_list_trans(re.c_list[[i-1]]),res_list_trans(re.c_list[[i]]))
  for(item in res_test){
    i=which(names(coun_num)==item[1])
    j=which(names(coun_num)==item[2])
    mat_calcu[i,j]=mat_calcu[i,j] + 1
  }
  res=intersect(res,res_test)
}

#-------------------------------------------------------------------------------
#estimate the threshold of theta
threshold=c()
for (j in 1: (dim(mat_calcu)[2])){
  for (i in 1: (dim(mat_calcu)[1])){
    if (mat_calcu[i,j]!=0){
      threshold=rbind(threshold,mat_calcu[i,j])
    }
  }
}
thr=t.test(threshold,con=0.95)
thr
#-------------------------------------------------------------------------------

mat=matrix(0,nrow=length(coun),ncol=length(coun))
colnames(mat)=coun
rownames(mat)=coun
for(i in 1:length(coun)){
  for(j in 1:length(coun))
    if(mat_calcu[i,j]>=458){
      mat[i,j]=1
    }
}

g1 <- graph_from_adjacency_matrix(mat)
same_country=igraph::groups(components(g1))

