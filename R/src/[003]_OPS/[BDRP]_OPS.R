# Operations ####
print("Hello World")
"Hello World"   #print 함수 생략


print(pi)
print(pi, 3)  #아규먼트이름생략 
print(pi, digits = 3)
print(digits = 3 ,pi) #도 가능  


# 에러발생   두번째거는 길이 
print("Hello", "World")
# 정상출력
cat("Hello", "World")




#print 생략
pi
# 에러발생
koo

# 객체 지정
koo <- "Hello World"

# 객체 출력
print(koo)
koo

cat("Hello World", pi, koo)

"Hello World" ; pi ; koo

cat("Hello World", "\n", pi, "\n", koo)





# 산술연산 ####
10 + 3
10 - 3
10 * 3

10 / 3

10 %/% 3
10 %% 3
10 ^ 2

9 ** 2
3 ** 4








# 연산 우선순위
7 + 8 * 9
(7 + 8) * 9







# R내장 수학함수
# sin(), cos(), tan()
sin(45)
cos(45)
tan(45)


# root
sqrt(8)
sqrt(16)
sqrt(225)


# log()
log(100, base = 10)
log(100, base = 5)
log(100)


# 절대값
abs(-3.14)
abs(-2.14)
abs(1.14)


# factorial()
factorial(5)
factorial(7)
factorial(9)


# Combination(조합)
choose(5, 2)
choose(7, 3)
choose(9, 5)




#'8' + '9' Error

# 데이터 타입 변환
"8" + "9"
as.numeric("8") + as.numeric("9")

# 데이터 타입 변환 함수
# as.list()
# as.vector()
# as.factor()
# as.integer()
# as.numeric()
# as.character()
# as.data.frame()








# 데이테형 확인
class(as.integer(8))

class(8)
class("8")
class(c(8, 9))
class(data.frame(x = c(7, 8), 
                 y = c(8, 9)))
class(list(c(8, 9)))

# 데이터 타입 판별 함수
# is.list()
# is.vector()
# is.factor()
# is.integer()
# is.numeric()
# is.character()
# is.data.frame()




# 반올림연산
round(24.47)
round(24.56)
round(24.56, digit = 0)
round(24.99, -1)
round(25.51, -1)
round(24.35, 1)



# 반올림, 올림, 내림, 버림
koo <- c(3.54, -3.14, 2.14, -2.54)
koo
class(koo)

# 반올림
round(koo)


# 올림
ceiling(koo)


# 내림
floor(koo)


# 버림
trunc(koo)













# 논리연산 ####
88 > 99
88 < 99
"오이" == "호박"
"오이" != "호박"
88 == 99
88 <= 99

# 버그 발생  true로 처리   
"당근" <= "당근"
"당근" >= "당근"









# 논리연산
x <- TRUE ; y <- FALSE
x & y
x && y

x | y
!x
isTRUE(x)
z <- TRUE
(x || y) && (z && y)










# 객체지정 ####
# Object1에 9 할당
(Object1 <- 9)
Object1

# Object2에 3 할당
(Object2 <- 3)

# Object2의 값을 Object1에 할당
(Object1 <- Object2)

# Object2에 9 할당
(Object2 <- 9)

# Object1 vs Object2
Object1 ; Object2

# sum() 함수의 실행결과를 Object3에 할당
(Object3 <- sum(1, 3, 5, 7, 9))


# 메모리 상의 Object3 지정 취소
rm(Object3)
Object3







# 메모리 상에 지정된 객체 확인
objects()
objects(all.names = TRUE)

#파일시스템에서 사용하던 명령어가 R에서 사용 
#ls() = objects() 은 같은것이다.
# 메모리 상에 모든 객체 지정 취소
rm(list = ls( ))
objects()


#R 스크립트 파일을 종료한다고 메모리에 올라갔던 객체가 사라지는 것은 아니다.










# 벡터 ####
# R의 최소 데이터 단위
(a <- c(1, 3, 5, 7, 9))
a
mean(a)
is.vector(a)

(b <- 1:9)
is.vector(b)
  
(c <- 9)
is.vector(c)
class(a)

(d <- c(1, "삼", 5, "칠", 9))
is.vector(d)
class(d)





# seq() 함수 사용하기
seq(1, 5)
seq(2, -2)

seq(1, 10, 2)
seq(from = 1, to = 10, by = 2)

seq(from = 1, to = 9, by = 0.5)
seq(from = 1, to = 9, by = 1.2)

#균등간격으로 나눔  히스토그램처리때 필요 
seq(from = 1, to = 9, length.out = 8)
seq(from = 1, to = 9, length.out = 3)

1:5
1.5:5
1.5:6
9:1


# rep() 함수 사용하기
(koo <- rep(3:5, times = 2))
(koo <- rep(3:5, each = 2))

length(koo)

4 %in% koo
7 %in% koo


# 벡터값 제어
(koo <- c(3, 7))

(koo <- c(koo, 9))

(koo <- c(1, koo))

(koo <- append(koo, 5, after = 2))

(koo <- koo[-2])

(koo <- koo[1:(length(koo) - 1)])

koo[3] <- 9

(koo <- c(1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3))

koo[koo == 3] <- 999
koo

# 벡터 연산
# 신체질량지수 계산
(Height <- c(163, 177, 156, 183, 188))
(Weight <- c(69, 80, 43, 78, 95))
#조건 벡터의 길이가 같아야한다. 혹은 반복대입가능하도록 배수갯ㅅ
Height + Weight
(BMI <- Weight/(Height/100)^2)
print(BMI)
print(BMI,3)




# 벡터의 재사용
(p <- 1:10)
(q <- c(1, -1))

p + q





# 벡터의 집합연산
# 벡터 전체값 비교
identical(1:5, 1:5)

identical(1:5, 2:6)


# 두 벡터의 할당된 값 비교  => 몇번째 값이 다른지 알수 있다 
c(1,3,5,7,9) == c(1,2,5,8,9)


# 합집합
union(1:5, 3:7)

union(c(1,3,5), c(2,4,6,6,6))


# 교집합
intersect(2:8, c(1,3,5,7,9))

intersect(1:3, 4:6)


# 차집합 
setdiff(1:9, c(2,4,6,8))



letters


# 집합간 비교
# setequal() vs identical()
setequal(letters[1:5], c("a", "b", "c"))
identical(letters[1:5], c("a", "b", "c"))

setequal(1:3, c(1, 1, 2, 3, 3))
identical(1:3, c(1, 1, 2, 3, 3))



# 벡터 이름 지정
(cars <- c(24000, 17000, 23000))
cars
names(cars) <- c("Renault", "Picasso", "Peugeot")
cars



#R의 데이터 단위는 벡터 

# 데이터프레임 ####
(v1 <- c(1, 3, 5, 7, 9))
is(v1)

(v1 <- c(1L, 2L, 3L))
(v1 <- as.integer(v1))
is(v1)

(v2 <- c(3.14, 2.34, 4.56789))
is(v2)

(v3 <- c("남자", "여자", "여자", "남자", "남자"))
is(v3)







# factor() 사용하여 명목형, 순서형 지정하기
# 명목형 levels 미지정
(v4 <- as.factor(v3))
is(v4)
nlevels(v4)
levels(v4)

# 명목형 levles 미지정
(v5 <- factor(c("동메달", "은메달", "금메달", "은메달")))
is(v5)
nlevels(v5)
levels(v5)


# 명목형 levels 지정
(v6 <- factor(c("동메달", "은메달", "금메달", "은메달"), 
             levels=c("동메달", "은메달", "금메달")))
is(v6)
nlevels(v6)
levels(v6)


# 순서형
(v7 <- factor(v6, ordered = TRUE))
is(v7)
nlevels(v7)
levels(v7)


a<-9
a<-as.integer(9)
class(a)

installed.packages()[,c("Package","Version")]


# 데이터프레임 만들기
(v1 <- c("Renault", "Picasso", "Peugeot", "Focus", "Fiesta"))
(v2 <- c(24000, 17000, 23000, 15000, 12000))
(v3 <- c(3, 5, 2, 2, 3))

DF1 <- data.frame(v1, v2, v3)
DF1
DF1[,2]
DF1[3,2]




(DF1 <- data.frame(Model = v1,
                   Price = v2,
                   Count = v3))

DF1

# 데이터프레임 사용하기
DF1$Model
DF1[, 1]

DF1[3, 1]

DF1[1, ]

DF1[ ,3]

DF1[c(3, 5), ]

DF1[ ,c(1, 3)]

DF1[c(2:4), ]

DF1[ ,c(1:3)]




# subset() 함수 사용하기
subset(DF1, Count > 2)
subset(DF1, Model == "Focus")
subset(DF1, Price >= 20000)






# cbind(), rbind() 함수 사용하기
No <- c(1, 2, 3)
Model <- c("Renault", "Picasso", "Peugeot")
Price <- c(24000, 17000, 23000)
(DF1 <- data.frame(NO = No, 
                   MODEL = Model, 
                   PRICE = Price))


No <- c(101, 102, 103)
Model <- c("HPE", "IBM", "ORACLE")
Price <- c(9000, 8000, 7000)
(DF2 <- data.frame(NO = No, 
                   MODEL = Model, 
                   PRICE = Price))

cbind(DF1, DF2)

rbind(DF1, DF2)











# merge() 함수 사용하기
(DF1 <- data.frame(Server = c("HPE", 
                            "IBM", 
                            "ORACLE"), 
                  Memory = c(4096, 
                            2048, 
                            1024)))


(DF2 <- data.frame(Server = c("HPE", 
                            "DELL", 
                            "IBM"), 
                  CPU = c(64, 
                          32, 
                          16)))

cbind(DF1, DF2)
#rbind(DF1, DF2)  error

merge(DF1, DF2)
merge(DF1, DF2, all = TRUE)


cbind(DF1, DF2)

# 에러발생
rbind(DF1, DF2)





# rbind()로 행추가
(New <- data.frame(Server = "Dell",
                   Memory = 2048))
DF1
(DF1 <- rbind(DF1, New))

(DF1 <- rbind(DF1, 
              data.frame(Server = "EMC", 
                         Memory = 4096)))

# cbind()로 열추가
(DF1 <- cbind(DF1, 
              data.frame(CPU = c(64,
                                 32,
                                 16,
                                 32,
                                 64))))



# 데이터프레임 실습
(no <- c(1, 2, 3, 4, 5))

(name <- c("유재석", 
           "박명수", 
           "정준하", 
           "양세형", 
           "조인성"))

(address <- c("서울", 
              "용인", 
              "창원", 
              "광주", 
              "부산"))

(tel <- c("02", 
          "031", 
          "055", 
          "062", 
          "051"))

(hobby <- c("농구", 
            "독서", 
            "영화", 
            "맛집", 
            "수영"))

(Member <- data.frame(NO = no,
                      NAME = name,
                      ADDRESS = address,
                      TEL = tel,
                      HOBBY = hobby))

Member
subset(Member, 
       select = c(NO, NAME, TEL))

subset(Member, 
       select = -TEL)

(colnames(Member) <- c("번호", 
                       "이름", 
                       "주소", 
                       "전화", 
                       "취미"))

ncol(Member)

nrow(Member)

names(Member)

colnames(Member)

rownames(Member)

Member[c(1, 3, 5),]
Member[1:3]
Member[1:3,]











# 리스트 ####
list_1 <- list(name = "Lee Na Young",
               email = "abc@abc.com",
               mobile = "010-1234-5678",
               height = 183)
list_1


list_1$name

list_1[2:4]

(list_1$birth <- "12-25")

(list_1$name <- c("Lee Na Young", "qoo"))

(list_1$birth <- NULL)

list_1

# 실습용 벡터 생성
# 숫자형 벡터
v_i <- c(1:15)


# 문자형 벡터
v_c <- c("축구", 
         "야구", 
         "농구", 
         "배구", 
         "족구")


# 논리형 벡터
v_l <- c(F, T, F, F, T, T)





# 리스트, 데이터 프레임, 벡터들로
# 새로운 리스트 생성
# 이름 지정 안함
New_List <- list(list_1, Member, v_i, v_c, v_l)
New_List
New_List[2]


# 실습용 리스트 생성
# 이름 지정
(Test_List <- list(LIST = list_1, 
                   DataFrame = Member, 
                   Integer = v_i, 
                   Character = v_c, 
                   Logic = v_l))


# 리스트의 첫번째 값 확인
Test_List[1]


# 리스트의 첫번째 값 삭제
Test_List[1] <- NULL


# 두번째 값이 첫번째로 이동
Test_List[1]


# 리스트 이름으로 호출
Test_List["Integer"]


# 데이터 타입 확인
class(Test_List[2])
class(Test_List[[2]])


# 두번째, 네번째 값 확인
Test_List[c(2, 4)]


# 이름으로 호출
Test_List$Character


# 데이터 타입 확인
class(Test_List$Character)


# 리스트 이름 지정
names(Test_List)[2] <- "Number"


# 두번째 리스트 확인
Test_List[2]
Test_List$Number












# 행렬(Matrix) ####
# 동작원리
matrix(1:16, nrow = 4)
matrix(1:16)
matrix(1:16, nrow = 2)
matrix(1:16, ncol = 2)


# byrow
matrix(1:16, nrow = 4, byrow = TRUE)
matrix(1:16, byrow = TRUE)
matrix(1:16, ncol = 16)
matrix(1:16, nrow = 4)


# 영문자
matrix(letters[1:16], nrow = 4)
matrix(LETTERS[1:16], nrow = 4, byrow = TRUE)


# 행이름, 열이름 지정
matrix(1:16, nrow = 4,
       dimnames = list(c("R1", "R2", "R3", "R4"),
                       c("C1", "C2", "C3", "C4")))


(MX <- matrix(1:16, nrow = 4))
dimnames(MX) = list(c("R1", "R2", "R3", "R4"),
                    c("C1", "C2", "C3", "C4"))
MX


# 행이름 확인
rownames(MX)

# 열이름 확인
colnames(MX)



# 행렬값 접근
MX[1, 3]
MX[2, 4]
MX[2:3, ]
MX[ , c(2, 4)]
MX[-2, ]  #두번째 행 만 빼고 다 보자
MX[c(1, 3), c(-2, -4)]



# 연산을 위한 행렬 생성
(MX1 <- matrix(1:16, nrow = 4))

(MX2 <- matrix(16:1, nrow = 4))

# 행렬과 스칼라 연산
MX1 + 3
MX2 - 3
MX1 * 3
MX2 / 3

# 행렬과 행렬 연산
MX1 + MX2
MX1 - MX2
MX1 %*% MX2

# 행렬의 차원
dim(MX1)












# 배열(Array) ####
# 동작원리
array(1:16)
array(1:16, dim = c(3, 4))
array(1:16, dim = c(2, 2, 4))





# 배열값 접근
(AR <- array(1:16, dim = c(2, 2, 4)))
AR[1, 2, 3]
AR[,,4]

# 배열의 차원
dim(AR)













# 개별실습(필수) ####
# 작업디렉토리 지정
getwd()
setwd("~/[003]_OPS")
getwd()





# 파일을 읽어서
# 데이터프레임으로 할당
DF1 <- read.csv("data/PII.csv")
DF1

is(DF1)

is.vector(DF1$Height)

str(DF1)

DF1$Height

mean(DF1$Height)


DF1[[7]]
DF1[7]

class(DF1[[7]])
class(DF1[7])

DF1[c(6, 7)]
DF1[c("BloodType", "Height")]

DF1[ ,c(6, 7)]
DF1[ ,7]
DF1[ ,"Height"]

DF1[2, ]
DF1[2, 1]


attach(DF1)
Height
ls(DF1)
search()

attach(DF1, pos = 5)
search()

detach(DF1)
search()

detach(DF1)






subset(DF1, 
       subset = (Height > 168))

subset(DF1, 
       select = c(Name, Height), 
       subset = (Height > 175))

subset(DF1, 
       select = -Height)

subset(DF1, 
       select = c(-Height, -Weight))








colnames(DF1)
colnames(DF1)[6] <- "Blood"

head(DF1)

Oldlist <- colnames(DF1)

Collist <- c("Na", "Ge", "Ag", "Gr", 
             "Pi", "Bl", "He", "We")

colnames(DF1) <- Collist

head(DF1, 3)







DF1 <- read.csv("data/PII.csv")
BMI <- DF1$Weight/DF1$Height^2
BMI
DF1 <- cbind(DF1, BMI)
tail(DF1)





DF1 <- read.csv("data/PII.csv")
Omit <- read.csv("data/nas.csv")
Omit   #NA 처
merge(DF1, Omit, by = "Name")






DF1 <- read.csv("data/PII.csv")
AddCol <- data.frame(Name = "이나영", 
                     Gender = "여자", 
                     Age = "33", 
                     Grade = "2", 
                     Picture = "유", 
                     BloodType = "B", 
                     Height = 177.7, 
                     Weight = 51)

rbind(DF1, AddCol)








# 작업디렉토리 초기화
getwd()
setwd("~")
getwd()



#통계 : 통계 : 데이터의 특징(차이)를 확인
#                      수학 -  산술
       #                    -  논리

# 통계변수
# 명목형
# 순서형
# 이산형
# 연속형

# Data Type   =>  숫자형  , 문자형 , 논리형

# Data Structure
#      . Vector , Data Frame  => 정형 데이터
#      . List( key / value) => NoSQL , 비정형 데이

# *************   전 처 리  **************





