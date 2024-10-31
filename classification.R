library(tidyverse)
library(VIM) 
library(e1071)
library(caret)
library(randomForest)

#Data loading and exploration

HCR <- read.csv('HepatitisCdata.csv')
summary(HCR)

HCR$Category <- factor(HCR$Category)
HCR$Sex <- factor(HCR$Sex)
summary(HCR)

nrow(HCR)

#Removing the column with the index

HCR <- HCR[, -1]
names(HCR)

#Removing the NAs 

#- Dataset with no NAs creation

HCRclean <- kNN(HCR, k=sqrt(nrow(HCR)))
summary(HCRclean)

#- Replacing the columns of the original dataset

HCR$ALB <- HCRclean$ALB
HCR$ALT <- HCRclean$ALT
HCR$ALP <- HCRclean$ALP
HCR$CHOL <- HCRclean$CHOL
HCR$PROT <- HCRclean$PROT

summary(HCR)

#Now I collapse the levels of the Category column into 2. One for Blood Donors and one for Hepatitis patients: 

HCR[HCR$Category=='0s=suspect Blood Donor',]$Category <- '0=Blood Donor'
HCR[HCR$Category=='2=Fibrosis',]$Category <- '1=Hepatitis'
HCR[HCR$Category=='3=Cirrhosis',]$Category <- '1=Hepatitis'
summary(HCR)

#I delete the previous levels by using the factor function

HCR$Category <- factor(HCR$Category, levels = c('0=Blood Donor', '1=Hepatitis'))
summary(HCR)


#I Divided the dataset in training and testing sets

set.seed(1000)

index <- sample(nrow(HCR),0.75*nrow(HCR))
train <- HCR[index,] #75% Training data 
test <- HCR[-index,] #25% Testing Data

#Machine Learning model with Support Vector Machine

svmHCR <- svm(Category~., data=train, kernel='linear', scale=F )
svmHCR

predictionHCR <- predict(svmHCR,test)

confusionMatrix(predictionHCR, test$Category)


#Machine Learning model with Random Forest - 10 trees

set.seed(1000)

rfHCR <- randomForest(Category~.,data=train,ntree=10) 
rfHCR

prediction <- predict(rfHCR, test)
confusionMatrix(prediction, test$Category)

# - 20 trees

set.seed(1000)

rfHCR2 <- randomForest(Category~.,data=train,ntree=20) 
rfHCR2

prediction2 <- predict(rfHCR2, test)
confusionMatrix(prediction2, test$Category)

# - 8 trees

set.seed(1000)

rfHCR3 <- randomForest(Category~.,data=train,ntree=8) 
rfHCR3

prediction3 <- predict(rfHCR3, test)
confusionMatrix(prediction3, test$Category)

  #- 7 trees
set.seed(1000)

rfHCR4 <- randomForest(Category~.,data=train,ntree=7) 
rfHCR4

prediction4 <- predict(rfHCR4, test)
confusionMatrix(prediction4, test$Category)


#- 15 trees
set.seed(1000)
rfHCR5 <- randomForest(Category~.,data=train,ntree=15) 
rfHCR5

prediction5 <- predict(rfHCR5, test)
confusionMatrix(prediction5, test$Category)
