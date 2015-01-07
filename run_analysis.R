run_analysis<-function(){
    test_labels<-read.table("UCI HAR Dataset/test/y_test.txt")
    test_data<-read.table("UCI HAR Dataset/test/x_test.txt")
    train_data<-read.table("UCI HAR Dataset/train/x_train.txt")
    train_labels<-read.table("UCI HAR Dataset/train/y_train.txt")
    features<-read.table("UCI HAR Dataset/features.txt")
    activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt")
    
    #Merge datasets
    total_data<-rbind(train_data,test_data)
    total_labels<-rbind(train_labels,test_labels)
    colnames(total_data)<-features$V2
    colnames(total_labels)<-"Activity"
    final_table<-cbind(total_labels,total_data)
    
    #Extract means/sd measurements
    just_means<-final_table[,grepl("mean\\(|std|Activity", colnames(final_table))]
    
    #Rename activities
    labeled_table<-inner_join(just_means,activity_labels,by=c("Activity" = "V1"))
    reordered_table<-select(labeled_table,"Activity"=68,2:67)
    
    #Produce second summary dataset
    summary_data<-reordered_table%>%
        group_by(Activity)%>%
        summarise_each(funs(mean))
}
