# Filepath config
setwd("") # Absolute location of working directory.
memberListFilename<-"anumc_memberlist_310715_clean.csv"
outputFile<-"data.txt"

memberList<-read.csv(memberListFilename,header=TRUE,colClasses = "character")

#cat(memberList$Preferred.Contact.Email, file=outputFile, sep=",") #Uncomment for a comma-seperated email list

#cat(memberList$ANU.ID, file=outputFile, sep=",") #Uncomment for a comma-seperated uID list

#cat(memberList$ANU.ID, file=outputFile, sep=")(uid=") #Uncomment for ldap-suitable output

#Use these commands on a Unix system to run ldap lookups for the memberlist
#Example:
#ldapsearch -h ldap.anu.edu.au -b ou=people,o=anu.edu.au -p 389 -x "(|(uid=u1234567)(uid=u1234568))" > data.txt

#Copy the first line, then the output of this script, then the second line.
#ldapsearch -h ldap.anu.edu.au -b ou=people,o=anu.edu.au -p 389 -x "(|(
#)" > data.txt