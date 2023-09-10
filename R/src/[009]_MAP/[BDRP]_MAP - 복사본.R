# 작업디렉토리 지정 
getwd()
setwd("~/[009]_MAP")
getwd()






# 001-[구글지도사용하기] ####
install.packages("ggmap")
# install.packages("stringr")
library(ggmap)
library(stringr)


# 위경도 읽어오기
loc <- read.csv("data/강동구주차장위경도.csv", 
                header = T)
loc


# 지도위치 가져오기
kd <- get_map("Amsa-dong", 
              zoom = 13, 
              maptype = "roadmap")


# 주차장 위치에 포인트 지정
kor.map <- ggmap(kd) + 
  geom_point(data = loc, 
             aes(x = LON, y = LAT), 
             size = 3, 
             alpha = 0.7, 
             color = "red")


# 주차장명과 함께 지도에 출력
kor.map + 
  geom_text(data = loc, 
            aes(x = LON, 
                y = LAT + 0.001, 
                label = 주차장명), 
            size = 3)

# 파일로 저장하기 ggsave("kd.png", dpi=500)













# 002-[구립/시립 구별하기] ####
# 구립(구), 시립(시) 공영 주차장
# 구립 "red", 시립 "blue" 표시

# 구립 시립 구분하여 문자열 추출
loc2 <- str_sub(loc$주차장명, 
                start = -2, 
                end = -2)
loc2

colors <- c()


# 구립과 시립별 포인트 색상변수 지정
for ( i in 1:length(loc2)) {
  if (loc2[i] == '구' ) {
    colors <- c(colors, "red") }
  else { 
    colors <- c(colors, "blue") }
}


# 지도위치 가져오기
kd <- get_map("Amsa-dong", 
              zoom = 13, 
              maptype = "roadmap")

# 포인트 위지 지정
kor.map <- ggmap(kd) + 
  geom_point(data = loc, 
             aes(x = LON, y = LAT),
             size = 3, 
             alpha = 0.7, 
             color = colors)


# 주차장명 지정하여 출력하기
kor.map + 
  geom_text(data = loc,
            aes(x = LON, 
                y = LAT + 0.001, 
                label = 주차장명), 
            size = 3)

# 파일로 저장 ggsave("kd2.png", dpi=500)















# 003-[지도에 경로 표시하기] ####
# install.packages("ggplot2")
library(ggplot2)
library(ggmap)


# 경로 읽어오기
jeju <- read.csv("data/제주도.csv",
                 header = T)
jeju


# 지도위치 가져오기
jeju1 <- get_map("Hallasan", 
                 maptype = "hybrid")


# 포인트 지정
jeju.map <- ggmap(jeju1) + 
  geom_point(data = jeju,
             aes(x = LON, y = LAT),
             size = 4, 
             alpha = 0.7,
             col = "red")


# geom_path 함수를 써서 
# 경로를 선으로 연결해서 표시
jeju.map + 
  geom_path(data = jeju, 
            aes(x = LON, y = LAT), 
            size = 1, 
            linetype = 2, 
            col = "white") +
  geom_text(data = jeju, 
            aes(x = LON, 
                y = LAT + 0.01, 
                label = 장소), 
            size = 4, 
            col = "green")


# 파일로 저장 ggsave("jeju_1.png",dpi=700)







# 작업디렉토리 복원
getwd()
setwd("~")
getwd()


