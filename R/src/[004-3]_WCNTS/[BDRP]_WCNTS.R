# 작업디렉토리 설정
getwd()
setwd("~/[004-3]_WCNTS")
getwd()






library(KoNLP)  
library(wordcloud)


# 파일 읽기
(txt <- readLines("data/NTS_678.txt"))


# 날짜정보제거 ####
(txt <- gsub("2017\\.0[678]\\.[0123][0-9]", 
             "", 
             txt))

#뽀개기 전에 날자 제거 
txt

# 명사 추출
nouns <- sapply(txt, 
                extractNoun, 
                USE.NAMES = F)

head(unlist(nouns), 30)


# 두글자 이상 단어만 추출 ####
nouns <- Filter(function(x) {nchar(x) >= 2}, 
                unlist(nouns))

head(unlist(nouns), 30)


# 불필요한 단어 삭제
nouns <- gsub("\\.", "", nouns)
head(unlist(nouns), 30)


# 파일로 중간저장
nouns <- unlist(nouns)
length(nouns)   


# 빈도수 ####
wordcount <- table(nouns)  
head(sort(wordcount, decreasing = T), 30)


# 팔레트 지정
library(RColorBrewer)
palete <- brewer.pal(8, "Dark2") 


# wordcloud 출력 ####
wordcloud(names(wordcount),
          freq = wordcount,
          scale = c(5, 0.5),
          rot.per = 0.25, 
          min.freq = 2,
          random.order = F,
          random.color = T,
          colors = palete)


# wordcloud2 출력 ####
library(wordcloud2)

wordcloud2(wordcount,
           fontWeight = NULL, 
           shape = "star")

wordcloud2(wordcount,
           size = 7,
           fontWeight = NULL,
           figPath = "data/NTS.png")

letterCloud(wordcount,
            size = 9,
            fontWeight = NULL,
            word = "NTS", 
            color="random-dark")

letterCloud(wordcount,
            size = 4,
            fontWeight = NULL,
            word = "국세청",
            color = "random-light",
            backgroundColor="black")






# 작업디렉토리 복원
getwd()
setwd("~")
getwd()
