trainX<-read.table("train/X_train.txt")
trainY<-read.table("train/y_train.txt")
trainSubj<-read.table("train/subject_train.txt")
testX<-read.table("test/X_test.txt")
testY<-read.table("test/y_test.txt")
testSubj<-read.table("test/subject_test.txt")

X<-rbind(testX,trainX)
Y<-rbind(testY,trainY)
S<-rbind(testSubj,trainSubj)

fnames<-read.table("features.txt")
fnames<-fnames[2]
meanCols<-grepl("mean",t(fnames))
stdCols<-grepl("std",t(fnames))

stdNames<-t(fnames)[stdCols]
meanNames<-t(fnames)[meanCols]
meanStdNames<-c(meanNames,stdNames)

meanX<-X[meanCols]
stdX<-X[stdCols]
meanStdX<-cbind(meanX,stdX)

acNames<-read.table("activity_labels.txt")
acNames<-acNames[2]
YNames<-t(acNames)[,t(Y)]

SX<-cbind(S,meanStdX)
ASX<-cbind(YNames,SX)

allColNames<-c("Activity","Subject",meanStdNames)
names(ASX)<-allColNames

write.table(ASX,"all.csv",row.name=FALSE)
summary<-aggregate(.~Activity+Subject,data=ASX,FUN=mean)
write.table(summary,"summary.csv",row.name=FALSE)

