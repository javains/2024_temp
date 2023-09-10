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
class(txt)

# 단어 추출
nouns <- sapply(txt, 
                extractNoun, 
                USE.NAMES = F)
nouns
class(nouns) #vector
head(unlist(nouns), 30)


# 두글자 이상 단어만 추출 ,제거가 아니라 , 필요한것만 뽑아낸다. 
#gsub(제거) , filter(뽑아내기 )  함수 비교 
nouns <- Filter(function(x) {nchar(x) >= 2}, 
                unlist(nouns))

head(unlist(nouns), 30)


# 벡터로 재지정
nouns <- unlist(nouns)
length(nouns)   


# 빈도수
wordcount <- table(nouns)  
wordcount
wordcount[220]
class(wordcount)
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







# 002-[오라클 로그분석]  size 3m ####
# install.packages("wordcloud") 
# install.packages("RColorBrewer")
# library(wordcloud)
#오라클 로그 고유번호 추출
#readLines url 도 읽어온다 
alert <- readLines("data/oracle.log") 

alert
class(alert)
# 로그 메시지 공백을 "_"으로 변경  , 공백은 읽기 어렵다 
alert <- gsub(" ", "_", alert)

head(unlist(alert), 20)


# 필터링을 위해 unlist 작업 수행
alert <- unlist(alert)


# 5글자 이상만 필터링
alert <- Filter(function(x) {nchar(x) >= 5}, 
                alert)


# 정규표현식을 통하여 패턴매칭
#대문자로 ORA로 시작하는 애들을 뽑아낸다. value = T 문자뽑아내려고 지정 , 지정안하면 위치 인덱스가 나온다 
alert <- grep("^ORA-+", alert, value = T)
alert

# 에러코드 숫자만 잘라내기 뽑아내기
alert <- substr(alert, 5, 9)

#어떤 에러가 몇번 발생 했는지 알수 있다.  데이터의 특징을 알아야 자료를 뽑아낼수 있다.
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

#wordcloud 보다는 막대 차트가 더 시각적 
#wordcloud  정성적인 효과 처리에 알맞다.  





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
