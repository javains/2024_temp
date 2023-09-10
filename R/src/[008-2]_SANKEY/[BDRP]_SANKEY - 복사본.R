# 작업디렉토리 지정 
getwd()
setwd("~/[008-2]_SANKEY")
getwd()






# 001-예산출력 ####
# [Sankey Diagram]
# https://github.com/timelyportfolio/rCharts_d3_sankey
# rCharts_d3_sankey-gh-pages.zip 다운로드 후 
# 작업디렉토리에 압축풀기
# "libraries" 폴더 생성 후 
# "sankey"로 폴더이름 변경 후 이동



# dplyr 패키지(전처리)
install.packages("dplyr")
library(dplyr)


# 1년 예산 불러오기
DF <- read.csv("data/expenditure.csv")
str(DF)
(DF2 <- DF)


# "확정안" 변수의 이름과 단위(천원) 변경
(colnames(DF2)[6] <- "value")
(DF2["value"] <- round(DF2["value"]/1000))
(DF3 <- DF2)





# 데이터 전처리
# 모든노드 1차원표현 및 합계 저장
sum1 <- DF3 %>% 
  group_by(소관명, 회계명) %>% 
  summarise(sum(value))

sum2 <- DF3 %>% 
  group_by(회계명, 분야명) %>% 
  summarise(sum(value))

sum3 <- DF3 %>% 
  group_by(분야명, 부문명) %>% 
  summarise(sum(value))

sum4 <- DF3 %>% 
  group_by(부문명, 프로그램명) %>% 
  summarise(sum(value))



# 변수이름 영문으로 변경
colnames(sum1) <- c("source", 
                    "target", 
                    "value")

colnames(sum2) <- c("source", 
                    "target", 
                    "value")

colnames(sum3) <- c("source", 
                    "target", 
                    "value")

colnames(sum4) <- c("source", 
                    "target", 
                    "value")




# as.data.frame으로 구조변경
sum1 <- as.data.frame(sum1)
sum2 <- as.data.frame(sum2)
sum3 <- as.data.frame(sum3)
sum4 <- as.data.frame(sum4)

# DF4로 합치기
(DF4 <- rbind(sum1, sum2, sum3, sum4))


# rCharte 패키지를 github로부터 설치
# install.packages("yaml")
# library(yaml)
install.packages("devtools")
library(devtools)

install_github("saurfang/rCharts", ref="utf8-writelines")
library(rCharts)


# rCharts 객체 생성
sankeyPlot <- rCharts$new()


# sankey 라이브러지 지정
sankeyPlot$setLib("libraries/sankey")
sankeyPlot$setTemplate(script = "libraries/sankey/layouts/chart.html")



# 그래프 관련 정보 지정
sankeyPlot$set(
  data = DF4,
  nodeWidth = 15,
  nodePadding = 13,
  layout = 300,
  width = 900,
  height = 750,
  units = "천원",
  title = "Sankey Diagram"
)




# (예산)그래프 실행
sankeyPlot













# 002-영화배우 관객동원 수 ####
DF5 <- read.csv("data/movie.csv")
# DF5 <- as.data.frame(DF5)


colnames(DF5) <- c("source", "target", "value")
colnames(DF5)



# rCharts 객체 생성
sankeyPlot <- rCharts$new()


# sankey 라이브러지 지정
sankeyPlot$setLib("libraries/sankey")
sankeyPlot$setTemplate(script = "libraries/sankey/layouts/chart.html")



# 그래프 정보 지정
sankeyPlot$set(
  data = DF5,
  nodeWidth = 15,
  nodePadding = 13,
  layout = 300,
  width = 900,
  height = 750,
  units = "명",
  title = "Sankey Diagram"
)




# (관객수)그래프 실행
sankeyPlot



# 작업디렉토리 복원
getwd()
setwd("~")
getwd()


