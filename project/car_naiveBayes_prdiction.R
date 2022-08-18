install.packages("dplyr")
install.packages("naivebayes")
library(naivebayes)

car_data<-read.csv("C:\\Users\\jeeva\\Study\\SQL\\data-sets\\cars.csv",header=TRUE)
car_data
dim(car_data)
str(car_data)
summary(car_data)
car_data$Transport=as.factor(car_data$Transport)
summary(car_data)
ind<-sample(2,nrow(car_data),replace = TRUE, prob=c(0.8,0.2))
traindata<-car_data[ind==1,]
testdata<-car_data[ind==2,]
print(traindata)
print(testdata)
naive_model<- naive_bayes(Transport ~., data=traindata,type="C-classification")
print(naive_model)
plot(naive_model)
testdata1<- testdata[,-c(7)]
print(testdata1)

testpred<- predict(naive_model,newdata=testdata1)
print(testpred)

a<- data.frame(Age=30,Gender="male",Work.Exp=5,Salary=20,Distance=7,license=1)
result<- predict(naive_model , a)
print(result)
