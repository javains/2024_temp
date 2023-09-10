# 작업디렉토리 설정
getwd()
setwd("~/[004-1]_WC")
getwd()






# 001-[노무현대통령취임사] ####
# install.packages("KoNLP") 
# install.packages("wordcloud") 
library(KoNLP)  
library(wordcloud)


# 대통령기록관 사이트에서 자료 다운로드
# http://pa.go.kr/index.jsp
# 파일에서 읽어오기
txt <- readLines("data/noh.txt")
txt


# 단어 추출
nouns <- sapply(txt, 
                extractNoun, 
                USE.NAMES = F)

head(unlist(nouns), 30)


# 두글자 이상 단어만 추출
nouns <- Filter(function(x) {nchar(x) >= 2}, 
                unlist(nouns))

head(unlist(nouns), 30)


# 벡터로 재지정
nouns <- unlist(nouns)
length(nouns)   


# 빈도수
wordcount <- table(nouns)  
head(sort(wordcount, decreasing = T), 30)


# 팔레트 지정
library(RColorBrewer)
palete <- brewer.pal(8, "Dark2") 


# 결과 출력
wordcloud(names(wordcount),
          freq = wordcount,
          scale = c(5, 0.5),
          rot.per = 0.25,
          min.freq = 1,
          random.order = F,
          random.color = T,
          colors = palete)







# 002-[오라클 로그분석] ####
# install.packages("wordcloud") 
# install.packages("RColorBrewer")
# library(wordcloud)

alert <- readLines("data/oracle.log") 


# 로그 메시지 공백을 "_"으로 변경
alert <- gsub(" ", "_", alert)

head(unlist(alert), 20)


# 필터링을 위해 unlist 작업 수행
alert <- unlist(alert)


# 5글자 이상만 필터링
alert <- Filter(function(x) {nchar(x) >= 5}, 
                alert)


# 정규표현식을 통하여 패턴매칭
alert <- grep("^ORA-+", alert, value = T)


# 에러코드 숫자만 잘라내기
alert <- substr(alert, 5, 9)

head(unlist(alert), 20)

alert <- unlist(alert)
length(alert) 


# 반복되는 에러별로 집계하여 errorcount에 저장
errorcount <- table(alert)  
head(sort(errorcount, decreasing = T), 20)


library(RColorBrewer)
palete <- brewer.pal(8, "Dark2")


wordcloud(names(errorcount), 
          freq = errorcount,
          scale = c(10, 2), 
          rot.per = 0.25, 
          min.freq = 10,
          random.order = F, 
          random.color = T, 
          colors = palete)







# wordcloud TEST ####
# library(wordcloud)
wordcloud(c(letters, LETTERS, 0:9),
          seq(1, 1000, len = 62))


# library(RColorBrewer)
palete <- brewer.pal(9, "Set1")

wordcloud(c(letters, LETTERS, 0:9),
          seq(1, 1000, len = 62),
          colors = palete)








# 작업디렉토리 초기화
getwd()
setwd("~")
getwd()
