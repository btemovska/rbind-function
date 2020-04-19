install.packages("RSQLite")
library("RSQLite")
setwd("~/SQLite") #set working directory
db<-dbConnect(SQLite(), dbname="DataMining.db") #establish connection with DB

dbGetQuery(db,'select * from inventory_sales') #show me the data
df<-data.frame(dbGetQuery(db,'select * from inventory_sales')) #create data frame in R
dim(df) #[1] 937 rows and 4 variables


new_df<-rbind(df, c("1/17/2014", 0, 0, 0),  #add new rows & create new data frame
                  c("2/10/2014", 0, 0, 0),
                  c("2/11/2014", 0, 0, 0),
                  c("3/4/2014", 0, 0, 0),
                  c("3/15/2014", 0, 0, 0))

dim(new_df) #[1] 942rows   4 variables

#send it back to SQL database
dbWriteTable(db,"inventory_sales", new_df, row.names=NA, overwrite = TRUE)






