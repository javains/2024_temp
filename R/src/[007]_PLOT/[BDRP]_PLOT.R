# 작업디렉토리 지정
getwd()
setwd("~/[007]_PLOT")
getwd()



#plot은 기본적으로 R에서 제공하는 함수 아주간단 excel에서도 가능  

objects()
#rm
#메모리에 올리는 방법 : 변수할당,libary
# 메모리에 데이터프레임 지정 ####
# 확인  , 메모리에 올린것 확인 
search()    #package 이름만 올라온다
# detach(DF)

# 파일에서 읽어오기
DF <- read.csv("data/PII.csv")
head(DF)
DF
DF$Height


# 경로지정  데이터 프레임에 
attach(DF)   #자바의 import처럼 메모리에 ~~
search()
DF
Height

# 확인
search()

# 데이터 프레임 구조확인
str(DF)

Age


# (고수준) 산점도 출력
# 벡터 사용 ####
plot(Age)     #빈도를 계산헤서 차트화 

plot(DF$Age)

plot(Height, Weight)

plot(Weight ~ Height)

plot(Height, Gender)

plot(Gender, Height)







# (고수준) 데이터 프레임 ####
                  #Vector      Vector   벡터 두개를 묶어서 Data Frame 만든다.
DF2 <- data.frame(DF$Height, DF$Weight)

class(DF2)

plot(DF2)




DF3 <- cbind(DF2, DF$Age)  #DF2 옆에 age 추가 
DF3
class(DF3)

plot(DF3)   #그래프 6개

plot(DF)
#R은 최선을 다한다.
#


# (고수준) 산점도 점모양 지정 ####
#키와 몸무게의 관계 그래프
plot(Weight ~ Height, 
     pch = as.integer(Gender))

# (저수준) 범례출력 ####
legend("topleft",
       c("남", "여"),
       pch = DF$Gender)
#R안에 점의 모양 25개 정의 되어 있다. 


DF
# (고수준) 명목변수로 구분  , 남자와 여자 를 구분한 그래프로 명목형 변수 필요 실제 그래프는 하나
coplot(Weight ~ Height | Gender)








#P180
# (고수준) 레이블 출력 안함
plot(Weight ~ Height, 
     ann = FALSE)

#고수준 그래프가 하나 그려지고 그위에 저수준이 처리되어 표시 
# (저수준) 레이블 출력
title(main = "몸무게와 키의 상관관계")
title(xlab = "키")
title(ylab = "몸무게")

# (저수준) 그리드 출력
grid()

# (저수준) 평균선 출력
heightMean <- mean(Height)
abline(v = heightMean, col = "red")  #세로 평균

weightMean <- mean(Weight)
abline(h = weightMean, col = "blue") #가로 평균 



#P181    barplot() 함수 
# 교차빈도표 작성   table=>빈도분석
(FreqBlood <- table(DF$BloodType))

# (고수준) 막대그래프 출력 ####
barplot(FreqBlood)
plot(BloodType)

# (저수준) 레이블 출력
title(main = "혈액형별 빈도수")
title(xlab = "혈액형")
title(ylab = "빈도수")








#tapply 전처리 함수 
# 혈액형별 평균키
(HEIGHT <- tapply(DF$Height, 
                  DF$BloodType, 
                  mean))


# (고수준) 막대그래프 출력   ylimite
barplot(HEIGHT, ylim = c(0, 200))
barplot(HEIGHT, ylim = c(0, 300))   #그래프의 함정  축의 값변경으로 시각적인 효과를 다르게 느끼게 한다.
#그래프의 함정


#p183  다섯수치요약  75%~25%  4분위수  
# (고수준) 박스플롯 출력
boxplot(Height)
boxplot(Height ~ BloodType)   #혈액형별  명목형 독립변수   이상치=> 값이 많이벗어난 데이타 통계학에서는 빼고 처리  
plot(BloodType, Height)






#막대그래프 : 높이만 의미가있고 , 히스토그램은 구간도 의미가있다.
# (고수준) 히스토그램 출력 ####
hist(Height)     #히스토그램 
barplot(Height)  #막대그래프

hist(Height, 
     breaks = 10)

hist(Height, 
     breaks = 10, 
     prob = TRUE)

# (저수준) 밀도함수  #확률의 최대값은 1이 되게 
lines(density(Height))


BreakPoint <- seq(min(Height), 
                  max(Height) + 7, by = 7)
hist(Height, breaks = BreakPoint)


DiffPoint <- c(min(Height), 
               165, 170, 180, 185, 190)
hist(Height, breaks = DiffPoint)






#창 클리어 빗자루 
#p185  창 나누기 
# plot창 여러개로 분할 ####
par(mfrow = c(2,3))       #창분할설정

plot(Weight, Height)
plot(Gender, Height)
barplot(table(BloodType))
boxplot(Height)
boxplot(Height ~ BloodType)
hist(Height, breaks = 10)

par(mfrow = c(1,1))      #창분할설정 해제 










# (고수준) 다수의 독립변수 ####
plot(Weight ~ Height + 
       Age + 
       Grade + 
       Picture + 
       Gender)
#그래프 5개를 보여주는데 콘솔창에서 엔터치면서 다음그래프로 넘어간다.


#p187
# 두개의 자료 비교 ####
# (고수준) + (저수준)
(TS1 <- c(round(runif(30) * 100)))  #정수 형태의 난수 30개 만들어 낸다 .

(TS2 <- c(round(runif(30) * 100)))

(TS1 <- sort(TS1, decreasing = FALSE))  #오름차순 정렬
(TS2 <- sort(TS2, decreasing = FALSE))

#두개의 변화량을 시각화 하기 위해 =>  고수준 +저수준으로 처리 
# (고수준)
plot(TS1, 
     type = "l")

# (저수준)  저수준으로 해야 앞에 그래프가 사라지지않는다. 
lines(TS2, 
      lty = "dashed", 
      col = "red")



# plot() 함수 옵션 ####
v1 <- seq(-10, 10, 1)
v2 <- v1 ^ 2      #그래프만들려고 데이터 만들기  

# 선, 점 지정 ####
plot(v1, v2, type = "p",
     main = "Graph-1", sub = "점타입")

plot(v1, v2, type = "l",
     main = "Graph-2", sub = "선타입")

plot(v1, v2, type = "c",
     main = "Graph-3", sub = "선 - 점")

plot(v1, v2, type = "b",
     main = "Graph-4", sub = "선과 점")

plot(v1, v2, type = "o",
     main = "Graph-5", sub = "선위에 점")

plot(v1, v2, type = "h",
     main = "Graph-6", sub = "수직선")   #h 수직선으로 표현

plot(v1, v2, type = "s",
     main = "Graph-7", sub = "계단형")   #s 계단형


# 테두리 모양 ####
plot(v1, v2, type = "p", bty = "o")
plot(v1, v2, type = "p", bty = "l")
plot(v1, v2, type = "p", bty = "7")
plot(v1, v2, type = "p", bty = "c")
plot(v1, v2, type = "p", bty = "u")
plot(v1, v2, type = "p", bty = "]")


# 색지정 ####
plot(v1, v2, type = "p", col = "blue")


# 점모양 지정(0~25) ####
plot(v1, v2, type = "p", pch = 25)
plot(v1, v2, type = "p", pch = 3)
plot(v1, v2, type = "p", pch = "$")  #임의의 문자 지정 가능 
plot(v1, v2, type = "p", pch = "*")


# 선모양 지정 ####
plot(v1, v2, type = "l", col = "red")
plot(v1, v2, type = "l", col = "red", lwd = 4)
plot(v1, v2, type = "l", col = "red", lwd = 2) #선의 굵기 지정 
plot(v1, v2, type = "l", col = "red", lwd = 4, lty = 1)
plot(v1, v2, type = "l", col = "red", lwd = 4, lty = 2)
plot(v1, v2, type = "l", col = "red", lwd = 4, lty = 3)
plot(v1, v2, type = "l", col = "red", lwd = 4, lty = 4)
plot(v1, v2, type = "l", col = "red", lwd = 4, lty = 5)

#------------------------------여기 까지는 R에서 기본으로 제공------------------------------------   





# pie() 그래프 출력 ####
#외부 패키지 필요   한가지 정보를 강하게 보이고 싶으면 pi chart 
#pi chart 의 항목이 균등하면 => 막대 차트로 바꾸는게 더 좋다 
#차트를 완성 한후 어떻게 전달할지가 스토리 텔링 
install.packages("graphics")
library(graphics)

x <- c(9, 15, 20, 16)

label <- c("영업1팀", 
           "영업2팀", 
           "영업3팀", 
           "영업4팀")


pie(x, 
    labels = label, 
    main = "부서별 영업 실적")


#pi 그래프의 시작점  12시 방향 
pie(x, 
    init.angle = 90, 
    labels = label, 
    main = "부서별 영업 실적")

pct <- round(x/sum(x) * 100)

label <- paste(label, pct)

label <- paste(label, "%", sep = " ")

pie(x, 
    init.angle = 90, 
    col = rainbow(length(x)), 
    labels = label, 
    main = "부서별 영업 실적")


#pi 그래프는 값정보를 정확히 전달하기 어렵다.




# 3D 파일차트 ####
install.packages("plotrix")
library(plotrix)

pie3D(x, 
      labels = label, 
      explode = 0.1, 
      labelcex = 0.8, 
      main="부서별 영업 실적")










#x  y 축
#x  y  z  있슴

# 3D 그래프  교재에 없음
library(lattice)
#iris 내장 객체   붓꽃의 정보 R내장 데이터   
colnames(iris)
cloud(Petal.Length~Sepal.Length + 
        Sepal.Width, 
      data = iris)



# plot3d()  다이나믹하게 처리   3D로 시각화   
install.packages("rgl")
library(rgl)

# 왼쪽마우스 클릭 : 확대
# 오른쪽마우스 클릭 : 회전
plot3d(iris$Sepal.Length,
       iris$Sepal.Width,
       iris$Petal.Length,
       xlab = "S.L",
       ylab = "S.W",
       zlab = "P.L",
       Col = rainbow(2))







# 작업디렉토리 복원
getwd()
setwd("~")
getwd()


