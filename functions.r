get.data.all <- function(expr_index){
  data.all <- eval(data_all_expr[[expr_index[1]]])
  if(length(expr_index)>1)
  {
    for(i in 2:length(expr_index))
    {
      data.all <- rbind(data.all,eval(data_all_expr[[expr_index[i]]]))
    }
  }
  return(data.all)
}

get.data.plot <- function(expr_index,n){
  data_all <- get.data.all(expr_index)
  data_list = list()
  for(i in 1:length(coun)){
    data_list[[coun[i]]]=matrix(c(data_all[,i]),n,13)
  }
  
  data_all_plot_3 = matrix(0,length(coun),13)
  colnames(data_all_plot_3)=seq(1,13,1)
  rownames(data_all_plot_3)=coun
  for (j in 1:length(coun)) {
    # change the "n" to define the end point
    for (k in 1:n){
      data_all_plot_3[j,] = data_all_plot_3[j,] + data_list[[j]][k,]
    }
    # data_all_plot_3[j,] = data_all_plot_3[j,] / i
  }
  return(data_all_plot_3)
}

clusters=function(HD){
  n=dim(HD)[1]
  SHP0=Hpath(1,n,HD)
  karate <-graph.edgelist(SHP0, directed=F)
  ii=sort(which(degree(karate)==1))[1]
  ie=ini=sort(which(degree(karate)==1))[2]
  path=all_simple_paths(karate,from=ii,to=ie)
  path=as.vector(path[[1]])
  dist.path=NULL
  for(j in 1:(n-1))
    dist.path=c(dist.path,HD[sort(path[j:(j+1)])[1],sort(path[j:(j+1)])[2]])
  
  #boxplot(dist.path)
  #outliers <- boxplot(dist.path, plot=FALSE)$out
  #dist.path
  #path
  #outliers
  #Out=which(dist.path>=min(outliers))
  T=n-1
  Clusters=list()
  Clusters[[1]]=c(1:n)
  BIC.all=NULL
  BIC.all[1]=log(var(dist.path))+2*log(T)/T
  #theta=min(outliers)
  ALL=sort(dist.path,TRUE)
  k=0
  for(ell in 1:length(ALL)){
    theta=ALL[ell]
    #for 2.5, see equation (6) in
    #https://wis.kuleuven.be/stat/robust/papers/2011/rousseeuwhubert-robuststatisticsforoutlierdetectio.pdf
    
    #     adjm=matrix(0,n,n)
    #     for(j in 1:(n-1))
    #       if(HD[SHP0[j,1],SHP0[j,2]]<theta)
    #         adjm[SHP0[j,1],SHP0[j,2]]=adjm[SHP0[j,2],SHP0[j,1]]=1
    #     
    #     g1 <- graph_from_adjacency_matrix( adjm )
    #     Clusters[[ell+1]]=groups(components(g1))
    #     N=dim(Clusters[[ell+1]])
    #     dist.path.c=dist.path[dist.path<theta]
    #     BIC.all[ell+1]=log(var(dist.path.c))+2*N*log(T)/T
    #     if(BIC.all[ell+1]>BIC.all[ell]) break;
    #   }
    #   
    #   RE=Clusters[[ell]]
    #   return(list(path=path,groups=RE))
    # }
    
    adjm=matrix(0,n,n)
    for(j in 1:(n-1))
      if(HD[SHP0[j,1],SHP0[j,2]]<theta)
        adjm[SHP0[j,1],SHP0[j,2]]=adjm[SHP0[j,2],SHP0[j,1]]=1
    
    g1 <- graph_from_adjacency_matrix( adjm )
    Clusters[[ell+1]]=igraph::groups(components(g1))
    N=dim(Clusters[[ell+1]])
    # cat('this is theta:',theta,'\n')
    # cat('this is N:',N,'\n')
    # cat('this is dist.path:',dist.path,'\n')
    dist.path.c=dist.path[dist.path<theta]
    # cat('this is dist.path.c:',dist.path.c,'\n')
    if(length(dist.path.c)==0){
      k = 1
      break
    }
    # BIC.all[ell+1]=log(var(dist.path.c))+2*N*log(T)/T
    if(length(dist.path.c)==1){
      BIC.all[ell+1]=2*N*log(T)/T
    }else{
      BIC.all[ell+1]=log(var(dist.path.c))+2*N*log(T)/T
    }
    # cat(BIC.all[ell+1],'\n')
    if(BIC.all[ell+1]>BIC.all[ell]) break;
  }
  if(k==0){
    
    RE=Clusters[[ell]]
  }else{
    cat('now is one cluster',is.null(dim(Clusters[[1]])), '\n')
    RE=list(`1`=Clusters[[1]])
  }
  
  return(list(path=path,groups=RE))
}


PLOT=function(theta1,theta2,delta,COL,NAME,zoom.in,zoom.out,SHIFT){ 
  xy1=c(radius*cos(theta1),radius*sin(theta1))
  xy2=c(radius*cos(theta2),radius*sin(theta2))
  newcenter=c((xy1[1]+xy2[1])/2,(xy1[2]+xy2[2])/2)
  dist.xy=sqrt(sum((xy1-xy2)^2))
  x.center=seq(center[1]-dist.xy/2,center[1]+dist.xy/2,0.01)
  y.center=dnorm(x.center,mean=0,sd=delta)
  v.center=c(x.center[which.max(y.center)],max(y.center)+1)###
  shift=newcenter-center
  x1=0;y1=1;x2=newcenter[1]-center[1];y2=newcenter[2]-center[2]
  dot = x1*x2 + y1*y2      # dot product between [x1, y1] and [x2, y2]
  det = x1*y2 - y1*x2      # determinant
  angle = 2*pi-atan2(det, dot) # atan2(y, x) or atan2(sin, cos)
  #theta <- acos( sum(a*b) / ( sqrt(sum(a * a)) * sqrt(sum(b * b)) ) )
  rotate.theta=angle
  #atan((xy2[2]-xy1[2])/(xy2[1]-xy1[1]))
  #theta2-theta1
  xy.center=matrix(c(cos(rotate.theta),sin(rotate.theta),
                     -sin((rotate.theta)),cos(rotate.theta)),2,2,byrow=T)
  xy.shift=NULL
  for(j in 1:length(x.center)){
    xy.rotate=xy.center%*%matrix(c(x.center[j],y.center[j]),
                                 2,1)
    xy.shift=cbind(xy.shift,xy.rotate+shift)
  }
  v.shift.center=xy.center%*%matrix(v.center,2,1)+shift
  points(xy.shift[1,]-SHIFT,xy.shift[2,],type = "l",col="black")
  #points(v.shift.center[1,],v.shift.center[2,],pch=16,col=COL,cex=1)
  rr=sqrt(sum((v.shift.center-center)^2))
  x1=1;y1=0;x2=v.shift.center[1,];y2=v.shift.center[2,]
  dot = x1*x2 + y1*y2      # dot product between [x1, y1] and [x2, y2]
  det = x1*y2 - y1*x2      # determinant
  angle2 = atan2(det, dot) # atan2(y, x) or atan2(sin, cos)
  points((rr-zoom.in)*cos(angle2)-SHIFT,(rr-zoom.in)*sin(angle2),pch=16,col=COL,cex=1.5)
  text((rr+zoom.out)*cos(angle2)-SHIFT,(rr+zoom.out)*sin(angle2),NAME)
  #lines(c(center[1],newcenter[1]),c(center[2],newcenter[2]),col="green")
}

#the defination of three distance
#Euclidean distance
Lnorm = function(x) sqrt(sum(t(x)*x))# Euclidean distance, but reader can define different distance such as max(abs(x)) and sum(abs(x)) 
#mean distance
Distance2.data=function(n1,n2,d,Data){
  n0=n2-n1+1
  hd=matrix(NA,nrow=n0,ncol=n0,dimnames = list(coun,coun))
  for(i in n1:(n2-1))
    for(j in (i+1):(n2))
      hd[i-n1+1,j-n1+1]= abs(sum(Data[i,]-Data[j,]))/d 
  
  return(list(hd=hd))
}
#var distance
Distance3.data=function(n1,n2,d,Data){
  n0=n2-n1+1
  hd=matrix(NA,nrow=n0,ncol=n0,dimnames = list(coun,coun))
  for(i in n1:(n2-1))
    for(j in (i+1):(n2))
      hd[i-n1+1,j-n1+1]=  sqrt(abs(sum((Data[i,])^2-(Data[j,])^2))/d)
  
  return(list(hd=hd))
}



equal.re.c <- function(rec1,rec2)
{
  group1 <- rec1$groups
  group2 <- rec2$groups
  if(length(group1)!=length(group2))
  {
    return(FALSE)
  }else
  {
    for(i in 1:length(group1))
      for(j in group1[[i]])
      {
        if(all(group2[[i]]!=j)) return(FALSE)
      }
  }
  return(TRUE)
}
  