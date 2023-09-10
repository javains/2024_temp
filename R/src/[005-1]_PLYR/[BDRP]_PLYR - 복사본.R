# 작업디렉토리 설정
getwd()
setwd("~/[005-1]_PLYR")
getwd()






# *apply() 함수 사용 ####
# 데이터 전처리
# lapply() & sapply()

# 리스트 만들기
(v1 <- 1:12)
(v2 <- 40:55)
(Test_List <- list(v1, v2))


# 리스트 구성항목별 "중앙값"
median(Test_List[[1]])
median(Test_List[[2]])







# lapply() ####
# 리스트로 반환
lapply(Test_List, median)







# sapply() 적용 ####
#벡터로 반환
sapply(Test_List, median)







# sapply() : simplify = FALSE
# 입력받은 데이터형으로 반환
# lapply()와 같은 결과
sapply(Test_List, median,
       simplify = FALSE)





# 데이터프레임 ####
DF <- read.csv("data/PII.csv")


# 평균키, 몸무게
lapply(DF[,7:8], mean)

sapply(DF[,7:8], mean)


# subset() : 혈액형별 평균
# 혈액형별 나누기
BT.O <- subset(DF, 
                subset = (BloodType == "O"))

BT.A <- subset(DF, 
                subset = (BloodType == "A"))

BT.B <- subset(DF, 
                subset = (BloodType == "B"))

BT.AB <- subset(DF, 
                 subset = (BloodType == "AB"))


# 혈액형별 평균키
mean(BT.O$Height)

mean(BT.A$Height)

mean(BT.B$Height)

mean(BT.AB$Height)







# aggregate() ####
aggregate(Height~BloodType, DF, mean)








# 동일한 결과 반환 ####
# 입력데이터형 : 출력데이터형

# 데이터프레임 : 데이터프레임
aggregate(Height~BloodType, DF, mean)

# 벡터 : 벡터
tapply(DF$Height, DF$BloodType, mean)

# 데이터프레임 : 리스트
by(DF$Height, DF$BloodType, mean)

# 리스트 : 리스트
lapply(split(DF$Height, DF$BloodType), mean)






# 데이터프레임형 반환
aggregate(Height~BloodType+Gender+Grade, DF, mean)








# 적용대상 데이터 추가
aggregate(cbind(Height,Weight)~BloodType, DF, mean)








# plyr 패키지 ####
library(plyr)


# 혈액형별 정렬(데이터프레임 -> 데이터프레임)
ddply(DF, "BloodType")


# 데이터프레임 -> 리스트
dlply(DF, "BloodType")


# 함수 적용하기
# 단일함수
ddply(DF, "BloodType", nrow)


# 함수 여러개 적용하기
ddply(DF, "BloodType", c("nrow", "ncol"))











# summarise() 함수 사용하기(heightMean은 summarise의 인자)
ddply(DF, "BloodType", summarise, heightMean=mean(Height))
# summarise(DF, heightMean=mean(height))


# 산술연산 적용
ddply(DF, "BloodType", summarise, heightMean=mean(Height)*2)


# 리스트형식 다중그룹
ddply(DF, .(BloodType), summarise, heightMean=mean(Height))
ddply(DF, .(BloodType, Gender), summarise, heightMean=mean(Height))








# 작업디렉토리 복원
getwd()
setwd("~")
getwd()
