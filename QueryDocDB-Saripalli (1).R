### Query Document Database
###
### Author: SARIPALLI, SRAVANI
### Course: CS5200
### Term: SUMMER TERM

# assumes that you have set up the database structure by running CreateFStruct.R
#install.packages("pdftools")
library(pdftools)
# Query Parameters (normally done via a user interface)
quarter <- "Q2"
year <- "2021"
customer <- "Medix"

# write code below
setLock<-function(customer, year, quarter)
{
  cwd <- getwd() #gettind working directory
  df_path <- paste(cwd,"reports", year,quarter,customer, sep="/") #setting the path
  file_lock = paste(df_path,".lock",sep="/")
  if(file.exists(file_lock))
  {
    return(-1) #error ".lock file exists"
  }
  else
  {
    file.create(file_lock)
    return(0) # ".lock" file is created
  }
}

genReportFName<-function(customer, year, quarter)
{
  fileName <- paste(customer, year, quarter,"pdf",sep=".") #creating name for pdf
  return(fileName)
}

storeReport<-function(customer, year, quarter)
{
  name<-genReportFName(customer, year, quarter)
  cwd <- getwd()
  df_path <- paste(cwd,"reports", year,quarter,customer, sep="/")
  file.copy(paste("./",name),df_path,overwrite = TRUE) #copying from the pdf file
}

relLock<-function(customer, year, quarter)
{
  cwd <- getwd()
  df_path <- paste(cwd,"reports", year,quarter,customer,".lock", sep="/")
  file.remove(df_path) #removing lock file
}


# test that all functions work

setLock(customer, year, quarter)
genReportFName(customer, year, quarter)
storeReport(customer, year, quarter)
relLock(customer, year, quarter)



