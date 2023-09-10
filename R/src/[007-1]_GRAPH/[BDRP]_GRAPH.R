# 작업디렉토리 지정
getwd()
setwd("~/[007-1]_GRAPH")
getwd()






# 001-[비정형데이터분석] ####
alert1 <- readLines("data/oracle.log")
alert1

# ORA-12345 형식만 선택
alert2 <- grep("^ORA-+", 
               alert1, 
               value = TRUE)  
alert2

# ORA-12345 에서 숫자부분만 잘라냄
alert3 <- substr(alert2, 5, 9)
alert3


# 영어부분을 제거후 숫자만 남김
alert4 <- gsub("[A-z]", "", alert3)
head(unlist(alert4), 20)


# 파일로 중간결과 저장
write(unlist(alert4), "data2/alert_2.txt") 
alert5 <- read.table("data2/alert_2.txt")
alert5

# 발생 빈도별 정렬
wordcount <- table(alert5)
head(sort(wordcount, decreasing = T), 10)

final <- head(sort(wordcount, decreasing = T),
              10)


# 막대그래프출력-01
bp <- barplot(final,
              main = "에러 코드-건별 출력", 
              col = rainbow(10), 
              cex.names = 0.7, 
              las = 2,
              ylim = c(0,4000))


text(x = bp, 
     y = final * 1.05, 
     labels = paste(final, "건"), 
     col = "black", 
     cex = 0.7)





# 막대그래프출력-02
dev.new( )
bp <- barplot(final,  
              main = "에러 코드-비율별 출력", 
              col = rainbow(10), 
              cex.names = 0.7,  
              las = 2, 
              ylim = c(0,4000))


pct <- round(final/sum(final) * 100 , 1)


text(x = bp, 
     y = final*1.05, 
     labels = paste(pct, "%"), 
     col = "black", 
     cex = 0.8)










# 002-[비정형데이터분석] ####
# 30대 창업키워드 분석
# install.packages("KoNLP") 
# install.packages("stringr")
library(KoNLP)
library(stringr)

data1 <- readLines("data/job30.txt")

data2 <- sapply(data1, 
                extractNoun, 
                USE.NAMES = F)


head(unlist(data2), 30) 
data3 <- unlist(data2) 


data3 <- str_replace_all(data3, 
                         "[^[:alpha:]]", 
                         "")

data3 <- gsub("프렌차이즈", 
              "프랜차이즈", 
              data3)

data3 <- gsub("음식", "요식업", data3)

data3 <- gsub("커피숍", "카페", data3)


# 제거하고 싶은 단어 목록
txt <- readLines("data/30gsub.txt")
cnt_txt <- length(txt)
cnt_txt


# 제거목록 반복 작업
for( i in 1:cnt_txt) {
  data3 <- gsub((txt[i]), "", data3)     
}


# 두글자 이상만 선택
data3 <- Filter(function(x) {nchar(x) >= 2} , data3)


# 파일로 저장
write(unlist(data3), "data2/job_3.txt") 
data4 <- read.table("data2/job_3.txt")


# 빈도수로 정렬
wordcount <- table(data4) 
head(sort(wordcount, decreasing = T), 20)


# 상위 10개 선택
bchart <- head(sort(wordcount, decreasing=T), 10)


# 막대그래프 출력
bplot <- barplot(bchart, 
                 main = "30대 창업키워드 분석", 
                 col = rainbow(10), 
                 cex.names = 0.7, 
                 las = 2, 
                 ylim = c(0, 80))


# 추가정보 출력
pct <- round(bchart/sum(bchart) * 100 , 1)

text(x = bplot, 
     y = bchart * 1.05, 
     labels = paste("(",pct,"%",")"), 
     col = "black", 
     cex = 0.7)

text(x = bplot, 
     y = bchart * 0.85, 
     labels = paste(bchart, "건"), 
     col = "black", 
     cex = 0.7)






# 003-[비정형데이터분석] ####
# 40대 창업키워드 분석
# install.packages("KoNLP") 
# install.packages("stringr")
library(KoNLP)
library(stringr)

data1 <- readLines("data/job40.txt")
data2 <- sapply(data1, 
                extractNoun, 
                USE.NAMES = F)

head(unlist(data2), 30)
data3 <- unlist(data2)

data3 <- str_replace_all(data3, 
                         "[^[:alpha:]]", 
                         "")

data3 <- gsub("남자", "남성", data3)


txt <- readLines("data/40gsub.txt")
cnt_txt <- length(txt)
cnt_txt


for( i in 1:cnt_txt) {
  data3 <- gsub((txt[i]), "", data3)     
}


data3 <- Filter(function(x) {nchar(x) >= 2}, data3)


write(unlist(data3), "data2/job_4.txt") 
data4 <- read.table("data2/job_4.txt")


wordcount <- table(data4) 
head(sort(wordcount, decreasing = T), 20)


bchart <- head(sort(wordcount, decreasing=T), 
               10)


bplot <- barplot(bchart,  
                 main = "40대 창업키워드 분석",
                 col = rainbow(10), 
                 cex.names = 0.7, 
                 las = 2, 
                 ylim=c(0, 100))


pct <- round(bchart/sum(bchart) * 100 , 1)


text(x = bplot, 
     y = bchart * 1.05, 
     labels = paste("(",pct,"%",")"), 
     col = "black", 
     cex = 0.7)


text(x = bplot, 
     y = bchart * 0.85, 
     labels = paste(bchart,"건"), 
     col = "black", 
     cex = 0.7)










# 004-[비정형데이터분석] ####
# 50대 창업키워드 분석
# install.packages("KoNLP") 
# install.packages("stringr")
library(KoNLP)  
library(stringr)

data1 <- readLines("data/job50.txt")
data2 <- sapply(data1, 
                extractNoun, 
                USE.NAMES = F)


head(unlist(data2), 30)
data3 <- unlist(data2)


data3 <- str_replace_all(data3, 
                         "[^[:alpha:]]", 
                         "")

data3 <- gsub("남자", "남성", data3)
data3 <- gsub("pc", "PC방", data3)
data3 <- gsub("PC", "PC방", data3)
data3 <- gsub("컴퓨터", "PC방", data3)
data3 <- gsub("피시방", "PC방", data3)
data3 <- gsub("PC방방", "PC방", data3)


txt <- readLines("data/50gsub.txt")
cnt_txt <- length(txt)

for( i in 1:cnt_txt) {
  data3 <- gsub((txt[i]), "", data3)     
}


data3 <- Filter(function(x) {nchar(x) >= 2}, data3)


write(unlist(data3), "data2/job_5.txt") 
data4 <- read.table("data2/job_5.txt")


wordcount <- table(data4) 
bchart <- head(sort(wordcount, decreasing = T), 10)


bplot <- barplot(bchart,  
                 main = "50대 창업키워드 분석",
                 col = rainbow(10), 
                 cex.names = 0.7, 
                 las = 2, 
                 ylim = c(0, 150))


pct <- round(bchart/sum(bchart) * 100 , 1)


text(x = bplot, 
     y = bchart * 1.05, 
     labels = paste("(",pct,"%",")"), 
     col = "black", 
     cex = 0.7)


text(x = bplot, 
     y = bchart * 0.85, 
     labels = paste(bchart,"건"), 
     col = "black", 
     cex = 0.7)









# 005-[정형데이터분석] ####
# http://www.hira.or.kr 접속
# 정보공개 -> 공데이터 개방 
# -> 공공데이터 이용안내
# 보건의빅데이개방시스템 
# -> 공공데이터 목록
# "시군구별 표시과목별 의원현황"으로 
# 검색하여 파일 다운로드
# "시군구별 표시과목별 의원현황(분기별2009~2013).xls" 
# 파일을 분석
data1 <- read.csv("data/Seoul_HSPT.csv", 
                  header=TRUE)
data1


barplot(as.matrix(data1[1:9, 2:11]),
        main=paste("서울시 주요 구별 과목별 병원현황-2013년",
                   "\n", "출처[국민건강보험공단]"), 
        ylab = "병원수", 
        beside = TRUE, 
        col = rainbow(8), 
        ylim = c(0,350))


abline(h = seq(0, 350, 10), 
       lty = 3, 
       lwd = 0.2)


name <- data1$표시과목


legend(75, 
       350, 
       name, 
       cex = 0.8, 
       fill = rainbow(8), 
       bg = "white")


# 작업디렉토리 복원
getwd()
setwd("~")
getwd()


