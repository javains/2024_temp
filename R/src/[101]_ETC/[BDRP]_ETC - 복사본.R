# 작업디렉토리 지정 ####
getwd()
setwd("~/[101]_ETC")
getwd()






# dplyr 패키지 ####
# filter() - 조건을 주어 필터링
# select() - 데이터셋에서 특정 컬럼만 선택
# arrange() - 데이터를 오름차순, 내림차순 정렬
# mutate() - 기존의 객체를 사용, 새로운 객체 생성
# summarise(with group_by)
#   - 주어진 데이터를 집계(min, max, mean, count)



# install.packages("dplyr")
library(dplyr)



# Data read
DF1 <- read.csv("data/PII.csv")
head(DF1)


# Filter() 함수 ####
# 조건을 주어 필터링
filter(DF1, Height > 170)

filter(DF1, Height > 170 & Weight > 70)

filter(DF1, Grade %in% c("2", "4"))



# select() 함수 ####
# 데이터셋에서 특정 컬럼만 선택
select(DF1, Name, Age, BloodType) %>% head()

select(DF1, -Grade, -Picture, - Height) %>% tail()

select(DF1, Name:Grade) %>% tail(7) %>% head(5)



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


DF1 %>% 
  select(Name, BloodType, Height, Weight) %>% 
  filter(Height > 175) %>% 
  arrange(desc(Weight))








# mutate() 함수 ####
# 기존의 객체를 사용하여 새로운 객체 생성
DF1 %>% 
  select(Name, Height, Weight) %>% 
  mutate("BMI" = round(Weight/(Height/100)^2))


DF1 %>% 
  select(Name, Height, Weight) %>% 
  mutate("BMI" = round(Weight/(Height/100)^2)) %>% 
  arrange(BMI)









# summarise(), group_by() ####
# 주어진 데이터를 집계(min, max, mean, count)
DF1 %>% 
  group_by(Gender) %>% 
  summarise(average = mean(Height, na.rm = TRUE))


DF1 %>% 
  group_by(Grade) %>% 
  summarise_each(funs(mean), Height, Weight)


DF1 %>% 
  group_by(Grade) %>% 
  summarise_at(vars(Height, Weight), funs(mean),
               na.rm = TRUE)


DF1 %>% 
  group_by(Grade) %>% 
  summarise_at(vars(Height, Weight), funs(mean, n()))


DF1 %>% 
  group_by(Gender, Grade) %>% 
  summarise(average = mean(Height, na.rm = TRUE))














# 조건문(흐름제어) ####
n <- 3
# Type1
if(n == 3){
  print("n은 3입니다")
} else {
  print("n은 3이 아닙니다")
}

# Type2
ifelse(n == 3, "n은 3.", "n은 5.")




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


# 함수에서 함수 호출
myfunc3 <- function(x, y) {
  x3 <- x+1
  y3 <- y+1
  
  x4 <- myfunc2(x3, y3)
  return(x4)
}

myfunc3(10, 21)


# 함수 실행결과를 객체에 할당
myfunc4 <- function() {
  x <- 11
  y <- 22
  return(invisible(x + y))
}

myfunc4()
result <- myfunc4()
result


# 함수 외부변수 호출하여 사용
x <- 9
x
ls()

myfunc5 <- function() {
  x <<- 11
  y <- 22
  return(x + y)
}

x
myfunc5()
x










# 파일 저장 함수 ####
# 특정기능 함수 파일로 저장 후 재사용
# 다른 스크립트 실행 중에 읽어 들여서 사용

# 새로운 함수 선언
newfunc1 <- function(x) {
  return(x * x)
}

newfunc1(3)


# 함수를 파일로 저장
getwd()
save(newfunc1, file = "myfunc.Rdata")


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






# R 내장 데이터셋 사용하기 ####
# datasets
library(help = "datasets")
data("CO2")
CO2
head(CO2, n = 10)
tail(CO2, n = 10)
Names(CO2)
str(CO2)
dim(CO2)
summary(CO2)
summary(CO2$conc)


# 알파벳
letters
LETTERS
letters[1:4]
letters[2:5]











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


