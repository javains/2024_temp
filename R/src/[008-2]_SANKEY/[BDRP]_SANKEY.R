# 작업디렉토리 지정 
getwd()
setwd("~/[008-2]_SANKEY")
getwd()



# P199   많이 사용 하는 시각화로 반다이나믹  마우스 움직임에 동작 
# 전체적인 데이타의 흐름을 필요  
# viewer 창에 표시 

# [Sankey Diagram] => 나폴레옹 자료에 적용하면서 유명해진 그래프 


# [Sankey Diagram]  Package  

# 001-예산출력 ####
# [Sankey Diagram]  제작자의 git hub 에서 직접 다운로드 
# https://github.com/timelyportfolio/rCharts_d3_sankey
# rCharts_d3_sankey-gh-pages.zip 다운로드 후 
# 작업디렉토리에 압축풀기   우리는 내문서 
# "libraries" 폴더 생성 후 
# "sankey"로 폴더이름 변경 후 이동

.libPaths()

# dplyr 패키지(전처리)
install.packages("dplyr")
library(dplyr)    #가장 강력한 전처리 도구이다.  


#파일의 사이즈가 작으면 엑셀에서 전처리 하는 것이  편하다.  

# 1년 예산 불러오기
DF <- read.csv("data/expenditure.csv")
str(DF)  # 데이터 프레임 구조 확인 
(DF2 <- DF) #데이터 백업     
# 한글 이름  영문으로   

colnames(DF2)

# "확정안" 변수의 이름과 단위(천원) 변경
(colnames(DF2)[6] <- "value")   #6번째 이름을 value로 바꾸기 
(DF2["value"] <- round(DF2["value"]/1000))   #과감히 소수점 버리기   원 단위를 천원 단위로   
(DF3 <- DF2)




# dplyr 패키지 사용 하면 group by 가 가능해진다.   
# 데이터 전처리  dplyr  패키지 사용 
# 모든노드 1차원표현 및 합계 저장
sum1 <- DF3 %>%     
  group_by(소관명, 회계명) %>% 
  summarise(sum(value))
# => 앞에 있는 값을 뒤에것에 넘겨줌   즉 회계명별로 sum을 구하는것 을 sum1이라는 데이터 프레임으로 만들어진다.  

sum1   # 데이터 프레임 확인 

sum2 <- DF3 %>% 
  group_by(회계명, 분야명) %>% 
  summarise(sum(value))

sum2

sum3 <- DF3 %>% 
  group_by(분야명, 부문명) %>% 
  summarise(sum(value))


sum4 <- DF3 %>% 
  group_by(부문명, 프로그램명) %>% 
  summarise(sum(value))

sum4

# 변수이름 영문으로 변경   결국 헤더 변경 
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
# => 노이즈 제거  

sum1
sum2
sum3
sum4



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
library(devtools)   #git hub 쓰기위한 package  

install_github("saurfang/rCharts", ref="utf8-writelines")
library(rCharts)

#rCharts::

# rCharts 객체 생성
sankeyPlot <- rCharts$new()


# sankey 라이브러지 지정
sankeyPlot$setLib("libraries/sankey")
sankeyPlot$setTemplate(script = "libraries/sankey/layouts/chart.html")
# => chart.html 형태로 샌키 다이어 그램을 만들 것이다.  


# 그래프 관련 정보 지정  Data frame 지정 
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



# 흐름이 있는 데이터의 시각화  
# (예산)그래프 실행
sankeyPlot







#데이터들을 처리하다 보면 노이즈들이 낀다.  as 
#tibble 형태가 속도가 빠를 수도 있다. 




# 002-영화배우 관객동원 수 ####
DF5 <- read.csv("data/movie.csv")
# DF5 <- as.data.frame(DF5)

#데이터가 심플해서 전처리 없이 헤더만 영문으로 바꾸어서 시각화  
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

#관광객 분석 시 흐름을 보기 위해 많이 사용 

# (관객수)그래프 실행
sankeyPlot
#흥행 영화에 어떤 배우가 참여 했는지 파악하기가 쉽다. 



# 작업디렉토리 복원
getwd()
setwd("~")
getwd()


