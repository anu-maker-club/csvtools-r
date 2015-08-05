#Config
#Filepaths, change as needed.
setwd("") # Absolute location of working directory.
memberListFilename<-"anumc_memberlist.csv"  
memberListFilenameNew<-"anumc_memberlist_clean.csv"

memberList<-read.csv(memberListFilename,header=TRUE,colClasses = "character")

#Removes extra columns on end, sometimes added during export by some programs
memberList[7]<-NULL
memberList[7]<-NULL

#Changes uIDs to lowercase (i.e. U1234567 to u1234567)
memberList$ANU.ID<-lapply(memberList$ANU.ID, tolower)

#memberList1<-memberList[duplicated(memberList$ANU.ID, fromLast=TRUE),] # for debugging
#memberList2<-memberList[duplicated(memberList$ANU.ID, fromLast=FALSE),]

#Compares uIDs, removes earlier entries for the same uID
memberList<-memberList[!duplicated(memberList$ANU.ID, fromLast=FALSE),]

rownames(memberList)<-NULL

#This allows R to see uIDs as plain text, it somehow converts it to a list in the earlier steps
memberList$ANU.ID <- vapply(memberList$ANU.ID, paste, collapse = ", ", character(1L))

write.csv(memberList,memberListFilenameNew, row.names=FALSE)