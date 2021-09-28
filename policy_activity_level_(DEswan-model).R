#' Calculate the number of countries with significant changes in policies, new confirmed cases and new deaths through the DEswan model

library(readr)
source("R_function/DEswan.r")
source("R_function/nsignif.DEswan.r")
source("R_function/q.DEswan.r")
source("R_function/reshape.DEswan.r")
source("R_function/utility.script.r")
load('data/data_for_DEswan.RData')
confirm<- read.csv("data/confirmed_cases.csv")
deaths<-read.csv("data/confirmed_deaths.csv")

#government policies
# ---------------------------------------------------------------------

Date<- as.character(seq.Date(from = as.Date("2020/01/01",format = "%Y/%m/%d"), to= as.Date("2021/09/15",format = "%Y/%m/%d"), by = "day"))
n=length(Date)

res.DEswan=DEswan(data.df = res_data[,-c(187,188)],
                  qt = res_data[['index']],
                  window.center = seq(1,n,1),
                  buckets.size = 15,
                  covariates = res_data[['method']]
                   )

# Reshape DEswan results
# DEswan outputs are in long format. Reshaping the results to wide format helps the exploration of the statistics produces by DEswan
res.DEswan.wide.p=reshape.DEswan(res.DEswan,parameter = 1,factor = "qt")
head(res.DEswan.wide.p[,1:5])

# Pvalues adjustment
res.DEswan.wide.q=q.DEswan(res.DEswan.wide.p,method="BH")
head(res.DEswan.wide.q[,1:5])

#countries with q-value<=0.05 at time t
country=res.DEswan.wide.q[,1]
select_country_prevent=list()
for (i in 2:dim(res.DEswan.wide.q)[2]){
  select_country_prevent[[i-1]]=res.DEswan.wide.q[which(res.DEswan.wide.q[,i]<=0.05),1]
}

res.DEswan.wide.q.signif=nsignif.DEswan(res.DEswan.wide.q)
toPlot=res.DEswan.wide.q.signif[1:3,-c(1:14,609:622)]
colnames(toPlot)=Date[16:609]



#confirmed cases
# ---------------------------------------------------------------------

Date<- as.character(seq.Date(from = as.Date("2020/01/01",format = "%Y/%m/%d"), to= as.Date("2021/09/15",format = "%Y/%m/%d"), by = "day"))
n=length(Date)
coun<-confirm[,2]
confirm_data = matrix(0,n,length(coun))
colnames(confirm_data)=confirm[,2]
rownames(confirm_data)=Date


for (j in 1:length(confirm[,2])){
  for (k in 1:length(coun)){
    if (confirm[j,2]==coun[k]){
      confirm_data[,k]=as.numeric(t(confirm[j,4:627]))
    }
  }
}
for (m in 1:length(coun)){
  if (is.na(confirm_data[1,m])){
    confirm_data[1,m]=0
  }
  for (h in 2:n){
    if (is.na(confirm_data[h,m])){
      confirm_data[h,m]=confirm_data[(h-1),m]
    }
  }
}


# diff
confirm_data_diff = matrix(0,n,length(coun))
colnames(confirm_data_diff)=confirm[,2]
rownames(confirm_data_diff)=Date

for(i in 1:dim(confirm_data)[2]){
  confirm_data_diff[,i]<-c(confirm_data[1,i],diff(confirm_data[,i]))
}
confirm_data_diff<-as.data.frame(confirm_data_diff)
confirm_data_diff[['index']]<-seq(1,n)


res.DEswan=DEswan(data.df = confirm_data_diff[,-c(187)],
                  qt = confirm_data_diff[['index']],
                  window.center = seq(1,n,1),
                  buckets.size = 15)

# Reshape DEswan results
# DEswan outputs are in long format. Reshaping the results to wide format helps the exploration of the statistics produces by DEswan
res.DEswan.wide.p=reshape.DEswan(res.DEswan,parameter = 1,factor = "qt")
head(res.DEswan.wide.p[,1:5])

# Pvalues adjustment
res.DEswan.wide.q=q.DEswan(res.DEswan.wide.p,method="BH")
head(res.DEswan.wide.q[,1:5])

country=res.DEswan.wide.q[,1]
select_country_confirmed=list()
for (i in 2:dim(res.DEswan.wide.q)[2]){
  select_country_confirmed[[i-1]]=res.DEswan.wide.q[which(res.DEswan.wide.q[,i]<=0.05),1]
}


res.DEswan.wide.q.signif=nsignif.DEswan(res.DEswan.wide.q)
toPlot_confirm=res.DEswan.wide.q.signif[1:3,-c(1:14,609:622)]
colnames(toPlot_confirm)=Date[16:609]




#deaths
# ---------------------------------------------------------------------


Date<- as.character(seq.Date(from = as.Date("2020/01/01",format = "%Y/%m/%d"), to= as.Date("2021/09/15",format = "%Y/%m/%d"), by = "day"))
n=length(Date)
coun<-deaths[,2]
deaths_data = matrix(0,n,length(coun))
colnames(deaths_data)=deaths[,2]
rownames(deaths_data)=Date


for (j in 1:length(deaths[,2])){
  for (k in 1:length(coun)){
    if (deaths[j,2]==coun[k]){
      deaths_data[,k]=as.numeric(t(deaths[j,4:627]))
    }
  }
}
for (m in 1:length(coun)){
  if (is.na(deaths_data[1,m])){
    deaths_data[1,m]=0
  }
  for (h in 2:n){
    if (is.na(deaths_data[h,m])){
      deaths_data[h,m]=deaths_data[(h-1),m]
    }
  }
}


# diff
deaths_data_diff = matrix(0,n,length(coun))
colnames(deaths_data_diff)=deaths[,2]
rownames(deaths_data_diff)=Date

for(i in 1:dim(deaths_data)[2]){
  deaths_data_diff[,i]<-c(deaths_data[1,i],diff(deaths_data[,i]))
}
deaths_data_diff<-as.data.frame(deaths_data_diff)
deaths_data_diff[['index']]<-seq(1,n)


res.DEswan=DEswan(data.df = deaths_data_diff[,-c(187)],
                  qt = deaths_data_diff[['index']],
                  window.center = seq(1,n,1),
                  buckets.size = 15)

# Reshape DEswan results
# DEswan outputs are in long format. Reshaping the results to wide format helps the exploration of the statistics produces by DEswan
res.DEswan.wide.p=reshape.DEswan(res.DEswan,parameter = 1,factor = "qt")
head(res.DEswan.wide.p[,1:5])

# Pvalues adjustment
res.DEswan.wide.q=q.DEswan(res.DEswan.wide.p,method="BH")
head(res.DEswan.wide.q[,1:5])

country=res.DEswan.wide.q[,1]
select_country_deaths=list()
for (i in 2:dim(res.DEswan.wide.q)[2]){
  select_country_deaths[[i-1]]=res.DEswan.wide.q[which(res.DEswan.wide.q[,i]<=0.05),1]
}


res.DEswan.wide.q.signif=nsignif.DEswan(res.DEswan.wide.q)
toPlot_deaths=res.DEswan.wide.q.signif[1:3,-c(1:14,609:622)]
colnames(toPlot_deaths)=Date[16:609]
