
load('policy_patterns_same_country.RData')

PLOT=function(theta1,theta2,delta,COL,NAME,zoom.in,zoom.out,SHIFT){ 
  xy1=c(radius*cos(theta1),radius*sin(theta1))
  xy2=c(radius*cos(theta2),radius*sin(theta2))
  newcenter=c((xy1[1]+xy2[1])/2,(xy1[2]+xy2[2])/2)
  dist.xy=sqrt(sum((xy1-xy2)^2))
  x.center=seq(center[1]-dist.xy/2,center[1]+dist.xy/2,0.01)
  cat(x.center,delta,'\n')
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
  points((rr-zoom.in)*cos(angle2)-SHIFT,(rr-zoom.in)*sin(angle2),pch=16,col=COL,cex=3)
  text((rr+zoom.out)*cos(angle2)-SHIFT,(rr+zoom.out)*sin(angle2),NAME)
  #lines(c(center[1],newcenter[1]),c(center[2],newcenter[2]),col="green")
}


ISO_name = c()
for(i in 1:length(same_country)){
  ISO_name = c(ISO_name,same_country[[i]])
}


par(mar=c(5,2,7,2)+0.1,mai=c(1,0,1,0),xpd=TRUE)
n.c=length(same_country)
n.p=80#dim(Data_confirmed)[1]

center=c(0,0);radius=10;

plot(0,xlim=c(-1.5*radius,2*radius),ylim=2*c(-radius,radius),
     xaxt = 'n', yaxt = 'n', bty = 'n', pch = '', ylab = '', xlab = '')
# plot of circle
theta=seq(0,2*pi,0.01)
for(i in 1:length(theta))
  points(radius*cos(theta[i]),radius*sin(theta[i]),type="l")


COL=rainbow(n.c)

L=NULL
for(t1 in 1:n.c)   L=c(L,length(same_country[[t1]]))
L=unique(L)
L=sort(L)
PL=seq(0.05,0.15,length.out=length(L))
ALL=matrix(NA,n.p,4)
ALL[,1]=ISO_name # c(1:n.p)
for(t1 in 1:n.c)
  for(t2 in 1:length(same_country[[t1]])){
    temp=which(ALL[,1]==same_country[[t1]][t2])
    ALL[temp,2]=COL[t1]
    ALL[temp,3]=ISO_name[temp]
    temp.L=which(L==length(same_country[[t1]]))
    ALL[temp,4]=PL[temp.L]
  }

delta.theta=(length(theta)-n.p*10)/n.p

center=c(0,0);radius=10;
plot(0,xlim=c(-3.5*radius,4*radius),ylim=c(-1.8*radius,1.4*radius),
     xaxt = 'n', yaxt = 'n', bty = 'n', pch = '', ylab = '', xlab = '')
#plot of circle
theta=seq(0,2*pi,0.01)
for(i in 1:length(theta))
  points(radius*cos(theta[i])-radius,radius*sin(theta[i]),type="l")
text(0,0,"Global policy patterns",cex=3,font=2)  # 0-2*radius

s.theta=1
for(k in 1:n.p){
  temp1=which(ALL[,1]==ISO_name[k])
  # cat(theta[s.theta], radius,'\n')
  PLOT(theta[s.theta],theta[s.theta+7],as.numeric(ALL[temp1,4]),
       ALL[temp1,2],ALL[temp1,3],0.6,0.9,0)  # the last para 2*radius
  theta1=theta[s.theta+7]
  s.theta=s.theta+10+delta.theta
  theta2=theta[s.theta]
  seg.theta=seq(theta1,theta2,0.01)
  xy.seg=NULL
  for(ell in 1:length(seg.theta))
    xy.seg=cbind(xy.seg,matrix(c(radius*cos(seg.theta[ell]),radius*sin(seg.theta[ell])),2,1))
  points(xy.seg[1,],xy.seg[2,],type="l")  # xy.seg[1,]-2*radius
}