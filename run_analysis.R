library(plyr)

# load the training and test set
X_train <- read.table('train/X_train.txt')
X_test <- read.table('test/X_test.txt')

#label the features in the two data sets
features <- read.table('features.txt', stringsAsFactors=FALSE)
names(X_train) <- features$V2
names(X_test) <- features$V2

#add a column with the subject identifier to each data set
subject_train <- read.table("train/subject_train.txt")
X_train$subject <- subject_train$V1

subject_test <- read.table("test/subject_test.txt")
X_test$subject <- subject_test$V1


#label the activities in each data set
activity_labels <- read.table('activity_labels.txt', stringsAsFactors=FALSE)

y_train <- read.table('train/y_train.txt')
y_train_labeled <- merge(y_train, activity_labels, by.x="V1", by.y="V1", all=TRUE)
X_train$activity <- y_train_labeled$V2

y_test <- read.table('test/y_test.txt')
y_test_labeled <- merge(y_test, activity_labels, by.x="V1", by.y="V1", all=TRUE)
X_test$activity <- y_test_labeled$V2


#combine training and test set
X_combined <- rbind(X_train, X_test)

#select mean and std features
X_subset<-X_combined[grepl("mean()",names(X_combined), fixed=TRUE)|grepl("std()",names(X_combined), fixed=TRUE)]
X_subset$subject<-X_combined$subject
X_subset$activity<-X_combined$activity


#compute average by subject
average_table <- ddply(X_subset, c("subject","activity"), summarize ,  
      V1 = mean(get(colnames(X_subset)[1])), 
      V2 = mean(get(colnames(X_subset)[2])), 
      V3 = mean(get(colnames(X_subset)[3])), 
      V4 = mean(get(colnames(X_subset)[4])), 
      V5 = mean(get(colnames(X_subset)[5])), 
      V6 = mean(get(colnames(X_subset)[6])), 
      V7 = mean(get(colnames(X_subset)[7])), 
      V8 = mean(get(colnames(X_subset)[8])), 
      V9 = mean(get(colnames(X_subset)[9])), 
      V10 = mean(get(colnames(X_subset)[10])), 
      V11 = mean(get(colnames(X_subset)[11])), 
      V12 = mean(get(colnames(X_subset)[12])), 
      V13 = mean(get(colnames(X_subset)[13])), 
      V14 = mean(get(colnames(X_subset)[14])), 
      V15 = mean(get(colnames(X_subset)[15])), 
      V16 = mean(get(colnames(X_subset)[16])), 
      V17 = mean(get(colnames(X_subset)[17])), 
      V18 = mean(get(colnames(X_subset)[18])), 
      V19 = mean(get(colnames(X_subset)[19])), 
      V20 = mean(get(colnames(X_subset)[20])),
      V21 = mean(get(colnames(X_subset)[21])), 
      V22 = mean(get(colnames(X_subset)[22])), 
      V23 = mean(get(colnames(X_subset)[23])), 
      V24 = mean(get(colnames(X_subset)[24])), 
      V25 = mean(get(colnames(X_subset)[25])), 
      V26 = mean(get(colnames(X_subset)[26])), 
      V27 = mean(get(colnames(X_subset)[27])), 
      V28 = mean(get(colnames(X_subset)[28])), 
      V29 = mean(get(colnames(X_subset)[29])),
      V30 = mean(get(colnames(X_subset)[30])),  
      V31 = mean(get(colnames(X_subset)[31])), 
      V32 = mean(get(colnames(X_subset)[32])), 
      V33 = mean(get(colnames(X_subset)[33])), 
      V34 = mean(get(colnames(X_subset)[34])), 
      V35 = mean(get(colnames(X_subset)[35])), 
      V36 = mean(get(colnames(X_subset)[36])), 
      V37 = mean(get(colnames(X_subset)[37])), 
      V38 = mean(get(colnames(X_subset)[38])), 
      V39 = mean(get(colnames(X_subset)[39])), 
      V40 = mean(get(colnames(X_subset)[40])),
      V41 = mean(get(colnames(X_subset)[41])), 
      V42 = mean(get(colnames(X_subset)[42])), 
      V43 = mean(get(colnames(X_subset)[43])), 
      V44 = mean(get(colnames(X_subset)[44])), 
      V45 = mean(get(colnames(X_subset)[45])), 
      V46 = mean(get(colnames(X_subset)[46])), 
      V47 = mean(get(colnames(X_subset)[47])), 
      V48 = mean(get(colnames(X_subset)[48])), 
      V49 = mean(get(colnames(X_subset)[49])), 
      V50 = mean(get(colnames(X_subset)[50])),
      V51 = mean(get(colnames(X_subset)[51])), 
      V52 = mean(get(colnames(X_subset)[52])), 
      V53 = mean(get(colnames(X_subset)[53])), 
      V54 = mean(get(colnames(X_subset)[54])), 
      V55 = mean(get(colnames(X_subset)[55])), 
      V56 = mean(get(colnames(X_subset)[56])), 
      V57 = mean(get(colnames(X_subset)[57])), 
      V58 = mean(get(colnames(X_subset)[58])), 
      V59 = mean(get(colnames(X_subset)[59])), 
      V60 = mean(get(colnames(X_subset)[60])),
      V61 = mean(get(colnames(X_subset)[61])), 
      V62 = mean(get(colnames(X_subset)[62])), 
      V63 = mean(get(colnames(X_subset)[63])), 
      V64 = mean(get(colnames(X_subset)[64])), 
      V65 = mean(get(colnames(X_subset)[65])), 
      V66 = mean(get(colnames(X_subset)[66]))
      )

#renaming the colunms to identify them as averages
new_average_table_names<-names(average_table)
for(i in c(3:length(names(average_table)))){
  new_name<-paste("average(",names(X_subset)[i-2],")", sep="")
  new_average_table_names[i]=new_name

}
names(average_table)=new_average_table_names

#save the average table as a txt file
write.table(average_table, file = "average_table.txt", row.names = FALSE)


