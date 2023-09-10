# 작업디렉토리 지정 ####
getwd()
setwd("~/[101]_ETC")
getwd()


#5st 중요 
# 작업디렉토리 지정 ####
# library 설정 

# dplyr 패키지 => 전처리에서 가장 많이 사용하는 패키지 중요 ***

# dplyr 패키지 ####
# filter() - 조건을 주어 필터링
# select() - 데이터셋에서 특정 컬럼만 선택
# arrange() - 데이터를 오름차순, 내림차순 정렬
# mutate() - 기존의 객체를 사용하여 새로운 객체를  생성
# summarise(with group_by)                           => group_by랑 같이 사용하여 합친다. 
#   - 주어진 데이터를 집계(min, max, mean, count)

# dplyr %>%  앞에 함수의 실행 결과를 뒤에함수에 집어 넣어주는 연산자   fn %> % fn

# install.packages("dplyr")
library(dplyr)



# Data read
DF1 <- read.csv("data/PII.csv")
head(DF1)


# Filter() 함수 ####
# 조건을 주어 필터링
filter(DF1, Height > 170)

filter(DF1, Height > 170 & Weight > 70)  # 키가 170 이사잉면서 몸무게도 70 이상

filter(DF1, Grade %in% c("2", "4"))    # 학년니 2 4 학년인 데이터만 추출 


# select 컬럼 기준으로 뽑아내고  filter는 레코드 단위로 뽑아낸다 .
# select() 함수 ####
# 데이터셋에서 특정 컬럼만 선택
select(DF1, Name, Age, BloodType)
select(DF1, Name, Age, BloodType) %>% head()  # select(DF1, Name, Age, BloodType) 결과를 head() 함수에 넘긴다.   %>%

select(DF1, -Grade, -Picture, - Height) %>% tail()

select(DF1, Name:Grade)
select(DF1, Name:Grade) %>% tail(7) %>% head(5)  #중간것 뽑아내는것 


# dplyr 패키지사용하니 간단 
# select 컬럼 기준으로 뽑아내고  filter는 레코드 단위로 뽑아낸다 .
# 여러문장을 조합 %>% ####
DF1 %>% 
  select(Name, BloodType, Height, Weight) %>% 
  filter(Height > 175)






# arrange() 함수 ####
# 데이터를 오름차순 또는 내림차순 정렬
DF1 %>% 
  select(Name, BloodType, Height, Weight) %>% 
  filter(Height > 175) %>% 
  arrange(Weight)
# ->   arrange(Weight)  몸무게 기준 오름 차순 


DF1 %>% 
  select(Name, BloodType, Height, Weight) %>% 
  filter(Height > 175) %>% 
  arrange(desc(Weight))
# ->   arrange(desc(Weight)  몸무게 기준 내림 차순   R은 함수 기반의 언어  




DF1


# mutate() 함수  없던 컬럼이 생성된다. 
# mutate() 함수 ####
# 기존의 객체를 사용하여 새로운 객체 생성
DF1 %>% 
  select(Name, Height, Weight) %>% 
  mutate("BMI" = round(Weight/(Height/100)^2))
# BMI 컬럼이 추가 


DF1 %>% 
  select(Name, Height, Weight) %>% 
  mutate("BMI" = round(Weight/(Height/100)^2)) %>% 
  arrange(BMI)
#기본 오름차순 







# 주석처리 
# summarise(), group_by() ####
# summarise(), group_by() 함수를 이용하여 주어진 데이터를 집계(min, max, mean, count)
DF1 %>% 
  group_by(Gender) %>% 
  summarise(average = mean(Height, na.rm = TRUE))
                       #평균키     결측 na 없에고 계산 

koo <- c(100,222,333,222,3,NA,55)
mean(koo,na.rm = TRUE) #결측치 제거 옵션 

DF1 %>% 
  group_by(Grade) %>% 
  summarise_each(funs(mean), Height, Weight)
# => 학년별로 평균키 평균 몸무게 


DF1 %>% 
  group_by(Grade) %>% 
  summarise_at(vars(Height, Weight), funs(mean),
               na.rm = TRUE)
# 적용 사용 하는 방법이 다양하다 


DF1 %>% 
  group_by(Grade) %>% 
  summarise_at(vars(Height, Weight), funs(mean, n()))
                                      # 평균  카운팅함수 

#mean()
#dplyr::n()


DF1 %>% 
  group_by(Gender, Grade) %>% 
  summarise(average = mean(Height, na.rm = TRUE))



# R의 전처리 기능 

#   *apply()

#   plyr  패키지     **ply

#   dplyr 패키지   함수가 많음 



#쥬피터노트북  파이선설치후 쥬피터노트북 







# 조건문(흐름제어) ####
n <- 3
# Type1
if(n == 3){
  print("n은 3입니다")
} else {
  print("n은 3이 아닙니다")
}

# Type2   삼항연산자 
ifelse(n == 3, "n은 3.", "n은 5.")

# 어떤게 빨라요 ?   파이선이 빠르다 .  R은 파이선보다는 느리다. 


n <- 5
# Type1
if(n == 3){
  print("n은 3입니다")
} else {
  print("n은 3이 아닙니다")
}

# Type2
ifelse(n == 3, "n은 3.", "n은 5.")





# 반복문(반복수행) ####
# for()
for(num in 1:10){ 
  print(num) 
  }


for(num in c(1,3,9)){
  print(num)
  }


for(num in 3:7){
  print(num * num)
  }


#연속적인범위는 : 시퀀스 , 비연속은 c 함수  컴바인 사용 


# while()
koo <- 1
while(koo < 10){
  print(koo)
  koo <- koo + 1  
}




# repeat()
koo <- 1
repeat{
  print(koo)
  if(koo == 9){ break }
  koo <- koo +1
}



# 데이터프레임에 적용
DF1 <- data.frame(aa = c("A", "B", "C", "D"), 
                  bb = 1:4)
DF1

for(num in 1:4){ 
  DF1[num, "new_column"] = num * 2 
  }
DF1






# 반복문 + 조건문 ####
# 데이터프레임에 적용
DF2 = data.frame( aa = c("A", "B", "C", "D"), 
                  bb = 1:4)
DF2


for(n in 1:4){
  if(n >= 3){
    print(DF2[n, "bb"])
  } else {
    print("???")
  }
}











# 사용자 지정함수 ####
# 함수[특정 기능 반복 사용]
# 인수 없는 함수선언
myfunc1 <- function() {
  x <- 11
  y <- 22
  return(x + y)
}

myfunc1()


# 인수 있는 함수선언
myfunc2 <- function(x, y) {
  XX <- x
  YY <- y
  return(sum(XX, YY))
}

myfunc2(11, 22)

#앞의 Filter nouns 참조 
#함수도 결국 메모리에 선언  이름 중복 주의

# 함수에서 함수 호출
myfunc3 <- function(x, y) {
  x3 <- x+1
  y3 <- y+1
          # devtools::f() 정의 되어 있지 않은 경우 사용 하는 방법 
          # x4<- f()
  x4 <- myfunc2(x3, y3)   #이 함수는 정의 되어 있어야 한다.
  return(x4)
}

myfunc3(10, 21)


# 함수 실행결과를 객체에 할당
myfunc4 <- function() {
  x <- 11
  y <- 22
  return(invisible(x + y))     #invisible return함수와 사용   화면 밖으로 안나감 ,실행 결과값이 안보이고 변수에 할당하여 사용 
}

myfunc4()

result <- myfunc4()
result




# 함수 외부변수 호출하여 사용
x <- 9
x
ls()   #x=9

# R은 변수의 scope가 기본으로 없다. 
# x <<- 11      x <- 11
myfunc5 <- function() {
  x <<- 11      #x <<- 11 밖의 x member x       #x <- 11  local x   전역 지역의 개념은 없지만 
  y <- 22
  return(x + y)
}

x
myfunc5()
x









ls()
# 파일 저장 함수 ####
# 특정기능 함수 파일로 저장 후 재사용
# 다른 스크립트 실행 중에 읽어 들여서 사용

# 함수를 파일로 저장후 마치 lib처럼 사용 =>   매번 정의 안하는 방법
# 새로운 함수 선언
newfunc1 <- function(x) {
  return(x * x)
}

newfunc1(3)


# 함수를 파일로 저장
getwd()
save(newfunc1, file = "myfunc.Rdata")

dir()

ls()
# 메모리에서 함수 삭제(에러발생)
rm("newfunc1")
newfunc1(3)


# 파일로부터 지정된 함수 읽어들이기
load("myfunc.Rdata")
newfunc1(3)


# 여러개의 함수 파일에 저장하기
newfunc2 <- function(x) {
  return(x + x)
  }

newfunc2(3)

save(newfunc1, newfunc2, file = "myfunc.Rdata")

# 최종 Test
rm("newfunc1")
rm("newfunc2")
newfunc1(3)
newfunc2(3)
load("myfunc.Rdata")
newfunc1(3)
newfunc2(3)

#데이터 전처리시 함수로 정의해서 많이 사용한다.




#File IO 확장 
# R 내장 데이터셋 사용하기 ####
# datasets
library(help = "datasets")  # R 내장 객체 확인 
data("CO2")
CO2
head(CO2, n = 10)
tail(CO2, n = 10)
Names(CO2)
str(CO2)
dim(CO2)
summary(CO2)
summary(CO2$conc)

#숫자라고 모두 연속형 이산형은 아니다.  주의  

# 알파벳
letters
LETTERS
letters[1:4]
letters[2:5]









# 동적 데이터들은 URL로 접근 
# 데이터 분석 연습용  오른쪽  속성   url 주소 복사한다
# URL로 부터 데이터 읽어오기 ####
# website data
# https://vincentarelbundock.github.io/Rdatasets/datasets.html
url <- "https://vincentarelbundock.github.io/Rdatasets/csv/Stat2Data/ThreeCars.csv"
cars <- read.csv(url)
cars




# 작업디렉토리 복원 ####
getwd()
setwd("~")
getwd()


