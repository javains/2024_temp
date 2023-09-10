# 작업디렉토리 설정
getwd()
setwd("~/[005-1]_PLYR")
getwd()



#R에서 전처리함수 / 패키지  1. 함수(내장): *apply()
#                           2. 패키지    :   plyr  => 이안에 함수들   **ply()
#


# *apply() 함수 사용 ####
# => 데이터를 전처리 하는 함수 
# lapply() & sapply()

# 리스트 만들기
(v1 <- 1:12)      #벡터
(v2 <- 40:55)     #벡터 
(Test_List <- list(v1, v2))


Test_List
Test_List[1]    #key / value
Test_List[[1]]  #값만


# 리스트 구성항목별 "중앙값"   리스트에 벡터가 2개 들어 있음 ,  아주 많다면 ? 
median(Test_List[[1]])
median(Test_List[[2]])







# lapply() ####
# 리스트로 반환     , lapply는 출력 결과가 리스트이다. 
lapply(Test_List, median)







# sapply() 적용 ####
#벡터로 반환   sapply는  출력 결과가 벡터이다.
sapply(Test_List, median)







# sapply() : simplify = FALSE
# 입력받은 데이터형으로 반환
# lapply()와 같은 결과  , 벡터가 들어가면 벡터가 리턴 , 리스트가 들어가면 리스트가 반환된다. 
sapply(Test_List, median,
       simplify = FALSE)





# 데이터프레임 ####
DF <- read.csv("data/PII.csv")

#mapply = > matrix에 사용 거의 사용 X 
# 평균키, 몸무게  7번 8번 컬럼  ,Data 가 연속형 이기 때문에 가능 
lapply(DF[,7:8], mean)

sapply(DF[,7:8], mean)


# subset => 뽑아낸다. 
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

#BT.O  => data frame
# 혈액형별 평균키
mean(BT.O$Height)

mean(BT.A$Height)

mean(BT.B$Height)

mean(BT.AB$Height)






#위의 4줄이 한줄로 처리 가능     DB의 집계함수 처럼 동작 
# aggregate() ####
aggregate(Height~BloodType, DF, mean)
#Height(연속형)을 BloodType(명목형)을 기준으로 처리   ~ => 종속변ㅅ  ~독립변수







# 동일한 결과 반환 ####
# 입력데이터형 : 출력데이터형

# 데이터프레임 : 데이터프레임
aggregate(Height~BloodType, DF, mean)

# 벡터 : 벡터     ,혈액형을 기준으로 평균키
tapply(DF$Height, DF$BloodType, mean)



# 데이터프레임 : 리스트
by(DF$Height, DF$BloodType, mean)

# 리스트 : 리스트
lapply(split(DF$Height, DF$BloodType), mean)






# 데이터프레임형 반환
aggregate(Height~BloodType+Gender+Grade, DF, mean)




# 적용대상 데이터 추가  키랑 몸무게의 평균을 한번에 처리 
aggregate(cbind(Height,Weight)~BloodType, DF, mean)

#데이터의 사이즈가 작다면 excel이 편하다.
#excel로 3만정도 처리 가능 ,    부천시80만,용인100만
#데이터의 사이즈에 따라 툴선택   excel -> R -> Hadoop


# 위의 집계 함수는 그냥 R에 있으므로 사용하면 된다.
# 위 보다 편 하게 사용 할 수 있는것이 plyr 패키지이다.  








# plyr 패키지 ####
#ply r 
library(plyr)


# 혈액형별 정렬(데이터프레임 -> 데이터프레임) dd의 의미 
ddply(DF, "BloodType")


# dl  =>  데이터프레임 -> 리스트  , input output
dlply(DF, "BloodType")


# 함수 적용하기
# 단일함수
ddply(DF, "BloodType", nrow)


# 함수 여러개 적용하기
ddply(DF, "BloodType", c("nrow", "ncol"))
#BloodType에 따라 카운팅 한다.  










# summarise() 함수 사용하기(heightMean은 summarise의 인자)
ddply(DF, "BloodType", summarise, heightMean=mean(Height))
# summarise(DF, heightMean=mean(height))
                                                # DF$Height



# 산술연산 적용
ddply(DF, "BloodType", summarise, heightMean=mean(Height)*2)
                   #summarise 함수가 적용

# 리스트형식 다중그룹
ddply(DF, .(BloodType), summarise, heightMean=mean(Height))
ddply(DF, .(BloodType, Gender), summarise, heightMean=mean(Height))
ddply(DF, .(BloodType, Gender), summarise, height_Mean=mean(Height))




#DAta가 많아지면 Hadoop 사용 해야 한다.



# 작업디렉토리 복원
getwd()
setwd("~")
getwd()
