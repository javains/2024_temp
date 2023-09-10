# 작업디렉토리 지정
getwd()
setwd("~/[007]_PLOT")
getwd()






# 메모리에 데이터프레임 지정 ####
# 확인
search()
# detach(DF)

# 파일에서 읽어오기
DF <- read.csv("data/PII.csv")

# 경로지정
attach(DF)

# 확인
search()

# 데이터 프레임 구조확인
str(DF)




# (고수준) 산점도 출력
# 벡터 사용 ####
plot(Age)

plot(DF$Age)

plot(Height, Weight)

plot(Weight ~ Height)

plot(Height, Gender)

plot(Gender, Height)







# (고수준) 데이터 프레임 ####
DF2 <- data.frame(DF$Height, DF$Weight)

class(DF2)

plot(DF2)




DF3 <- cbind(DF2, DF$Age)

class(DF3)

plot(DF3)

plot(DF)



# (고수준) 산점도 점모양 지정 ####
plot(Weight ~ Height, 
     pch = as.integer(Gender))

# (저수준) 범례출력 ####
legend("topleft",
       c("남", "여"),
       pch = DF$Gender)

# (고수준) 명목변수로 구분
coplot(Weight ~ Height | Gender)









# (고수준) 레이블 출력 안함
plot(Weight ~ Height, 
     ann = FALSE)

# (저수준) 레이블 출력
title(main = "몸무게와 키의 상관관계")
title(xlab = "키")
title(ylab = "몸무게")

# (저수준) 그리드 출력
grid()

# (저수준) 평균선 출력
heightMean <- mean(Height)
abline(v = heightMean, col = "red")





# 교차빈도표 작성
(FreqBlood <- table(DF$BloodType))

# (고수준) 막대그래프 출력 ####
barplot(FreqBlood)
plot(BloodType)

# (저수준) 레이블 출력
title(main = "혈액형별 빈도수")
title(xlab = "혈액형")
title(ylab = "빈도수")









# 혈액형별 평균키
(HEIGHT <- tapply(DF$Height, 
                  DF$BloodType, 
                  mean))

# (고수준) 막대그래프 출력
barplot(HEIGHT, ylim = c(0, 200))


# (고수준) 박스플롯 출력
boxplot(Height)
boxplot(Height ~ BloodType)
plot(BloodType, Height)







# (고수준) 히스토그램 출력 ####
hist(Height)

hist(Height, 
     breaks = 10)

hist(Height, 
     breaks = 10, 
     prob = TRUE)

# (저수준) 밀도함수
lines(density(Height))


BreakPoint <- seq(min(Height), 
                  max(Height) + 7, by = 7)
hist(Height, breaks = BreakPoint)


DiffPoint <- c(min(Height), 
               165, 170, 180, 185, 190)
hist(Height, breaks = DiffPoint)








# plot창 분할 ####
par(mfrow = c(2,3))

plot(Weight, Height)
plot(Gender, Height)
barplot(table(BloodType))
boxplot(Height)
boxplot(Height ~ BloodType)
hist(Height, breaks = 10)

par(mfrow = c(1,1))









# (고수준) 다수의 독립변수 ####
plot(Weight ~ Height + 
       Age + 
       Grade + 
       Picture + 
       Gender)




# 두개의 자료 비교 ####
# (고수준) + (저수준)
(TS1 <- c(round(runif(30) * 100)))

(TS2 <- c(round(runif(30) * 100)))

(TS1 <- sort(TS1, decreasing = FALSE))
(TS2 <- sort(TS2, decreasing = FALSE))

# (고수준)
plot(TS1, 
     type = "l")

# (저수준)
lines(TS2, 
      lty = "dashed", 
      col = "red")



# plot() 함수 옵션 ####
v1 <- seq(-10, 10, 1)
v2 <- v1 ^ 2

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
     main = "Graph-6", sub = "수직선")

plot(v1, v2, type = "s",
     main = "Graph-7", sub = "계단형")


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
plot(v1, v2, type = "p", pch = "$")


# 선모양 지정 ####
plot(v1, v2, type = "l", col = "red")
plot(v1, v2, type = "l", col = "red", lwd = 4)
plot(v1, v2, type = "l", col = "red", lwd = 4, lty = 1)
plot(v1, v2, type = "l", col = "red", lwd = 4, lty = 2)
plot(v1, v2, type = "l", col = "red", lwd = 4, lty = 3)
plot(v1, v2, type = "l", col = "red", lwd = 4, lty = 4)
plot(v1, v2, type = "l", col = "red", lwd = 4, lty = 5)







# pie() 그래프 출력 ####
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







# 3D 파일차트 ####
install.packages("plotrix")
library(plotrix)

pie3D(x, 
      labels = label, 
      explode = 0.1, 
      labelcex = 0.8, 
      main="부서별 영업 실적")











# 3D 그래프
library(lattice)

colnames(iris)
cloud(Petal.Length~Sepal.Length + 
        Sepal.Width, 
      data = iris)



# plot3d()
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


