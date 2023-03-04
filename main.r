library(zoo)
library(stringr)
##  Data preparation
data<-read.table("A2_sales.txt",sep="",header=TRUE)

# Formatting the "Quarter" column into a usable date format
quarters<-str_split_fixed(data$Quarter,"K",n=2)
years<-quarters[,1]
quarters<-quarters[,2]
dates<-as.Date(paste0(years,"-",
                        ifelse(quarters=="1","01-01",
                               ifelse(quarters=="2","04-01",
                                      ifelse(quarters=="3","07-01",
                                             ifelse(quarters=="4","10-01",NA))))))

# Creating a dataframe and extracting the usable variables
data<-data.frame(Quarter=dates,Sales=data$Sales)
quarters<-data$Quarter
sales<-data$sales

plot(data$Quarter,data$Sales)
print(quarters,sales)
print("This is a test")