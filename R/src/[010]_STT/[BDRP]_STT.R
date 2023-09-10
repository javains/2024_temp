# 작업디렉토리 지정 
getwd()
setwd("~/[010]_STT")
getwd()


# 통계 기초 P206~


# R에서 기술 통계학 실습 
# 000-[연령별 평균월급] ####
DF <- read.csv("data/salary.csv", 
               stringsAsFactors = TRUE, 
               na = "-")
head(DF, 10)


# 컬럼이름 영어로 변환    $. 영어로 변환 
colnames(DF)
(colnames(DF) <- c("age", 
                   "salary", 
                   "specialSalary",
                   "workingTime", 
                   "numberOfWorker",
                   "career", 
                   "sex"))

# 통계학의 데이터타입   명목형, 순서형  , 이산형  , 연속형 
# Factor   명목형, 순서형

# 데이터 구조 확인 및 환경설정
str(DF)
search()
detach(DF)
attach(DF)

# 평균
(Mean <- mean(salary,
              na.rm = TRUE))


# 중앙값
(Mid <- median(salary,
               na.rm = TRUE))


# 범위
(Range <- range(salary,
                na.rm = TRUE))


# 사분위 구하기
(Qnt <- quantile(salary,
                 na.rm = TRUE))


# 전체값 모아서 리스트로 담기   key/value 
(Salary <- list(평균월급 = Mean, 
                중앙값월급 = Mid,
                월급범위 = Range, 
                월급사분위 = Qnt))


# 관찰항목 위치 확인   4064286 인 정보 데이터 확인 
DF[which(DF$salary == 4064286),]


#----- 여기까지가 기술 통계 --------



# 여기서부터 추론 통계 



# p219
# 001-[상관분석] ####
# 신규 가입자 수   연속형 데이터여야 한다. 
x <- c(3, 5, 8, 11, 13)

# 프로모션 회수
y <- c(1, 2, 3, 4, 5)

# 상관계수
cor(x, y)










# p222
# 002-[회귀분석] ####
# (문제)부모IQ 117인경우 자녀 IQ?
# (과거)부모의 IQ
x <- c(110, 120, 130, 140, 150)

# (과거)자녀의 IQ
y <- c(100, 105, 128, 115, 142)

# 점으로 그래프에 표시  산점도 
plot(x, y, pch=16, col="red")

# lm() 함수를 사용하여
# 회귀식의 계수 계산
line <- lm(y ~ x)

# 결과확인 : b = -4.20, a = 0.94
line

# 회귀선 그리기
abline(line, col="blue")

# (예측)부모IQ가 117인경우 자녀 IQ?
# y = b + ax
# y = -4.20 + (0.94)*117
# 자녀의 IQ는 105.78로 추정   => 이러면 회귀선에 맞추면  점추정이 된다. 
(y = -4.20 + (0.94) * 117)









# p223~
# 현실에서는 모평균과 모표준편차를 
# 알수 없는 경우가 대부분
# 표본집단을 선택 후 
# t분포, F분포, 카이제곱분포를 적용
# 검증 후 모집단을 추측(추정)




#      T-test  이산형 연속형
# 003-[t검정] 수치형데이터 ####
# 모집단 100명의 평균을
# 표본집단 10명의 평균을 통하여 추정

# 지난 학기 평균은 75점(mu=75)

# 가설설정
# 귀무가설  H0:지난 학기와 이번 학기의 평균은 동일하다
#    (성적변동없음)
# 대립가설  H1:지난 학기와 이번 학기의 평균은 동일하지 않다
#    (성적변동있음)

# [귀무가설 채택 사례] ####
# 10명의 성적데이터 읽어오기
score <- read.csv("data/tTest1.csv",
                  header = TRUE)
score   #이번학기 10명의 표본 점수

# 비교검증값(mu=75)를 적용하여
# t검증을 수행
# 유의확률(p-value)가
# 0.05보다 크기때문에
# 귀무가설(H0)을 채택
result <- t.test(score$성적, 
                 alternative = c("greater"), 
                 mu = 75)    # 지난학기 모평균 은 75 
result        #귀무가설 채택 영역 
              #결국 95% 확률로 이번학기 평균은 75가 될것이다.



# [귀무가설 기각 사례] ####
# 10명의 성적데이터 읽어오기
score <- read.csv("data/tTest2.csv",
                  header = TRUE)
score

# 비교검증값(mu=75)를 적용하여
# t검증을 수행
# 유의확률(p-value)가
# 0.05보다 작기때문에 
# 귀무가설(H0)을 기각
# 대립가설(H1)을 채택
result <- t.test(score$성적, 
                 alternative = c("greater"), 
                 mu = 75)
result        #귀무가설 기각 영역 
              #이번학기 평균은 75가 아니다.



# p226  음수가 없다.      자유도에 따라 x2 값이 달라진다.    ,x2 카이제곱이 x축 
# 004-[카이제곱검정] 범주형데이터 ####
# 독립성검정 또는 교차분석
# 교차분석을 위해 gmodels 패키지설치
install.packages("gmodels")
library(gmodels)

# 데이터 읽어오기
OT <- read.csv("data/cross.csv")
head(OT)

# 카이제곱 검정
# p-value 및 카이제곱값 확인
CrossTable(OT$야근, 
           OT$승진, 
           chisq = TRUE)

# -> 빈도 분석표 만들기 




# 작업디렉토리 복원
getwd()
setwd("~")
getwd()


