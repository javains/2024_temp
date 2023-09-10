# 작업디렉토리 설정 
getwd()
setwd("~/[004]_BBS")
getwd()




#wordcloud를 하기위한 환ㄱ

# 한글 자연어 처리
# 워드클라우드
# 패키지 설치 및 로딩
install.packages("KoNLP") 
install.packages("wordcloud") 
library(KoNLP) 
library(wordcloud)



# 한글처리 ####
# 한글 사전 다운로드
# 최초 1회 실행     


# 여러 종류 사전
# useSejongDic()
useNIADic()  #사전지정  한번만 실행 

# 사용자 단어 추가-1
mergeUserDic(data.frame("하늘공원", "ncn")) #단어추가   ncn은 명사의미 

# 사용자 단어 추가-2
buildDictionary(ext_dic = c("sejong", "woorimalsam", "insighter"),
                user_dic = data.frame(term="버스킹", tag="ncn"),
                category_dic_nms=c("music"))

#사전을 빌드해야 사용 사능


# 파일 읽어오기  readLines R의 내장함수 ####
mapo1 <- readLines("data/mapo.txt")  #내장함수 사용 180라인정도 실업무에서는 대량 인경우  
mapo1
head(mapo1)
tail(mapo1)  #기본 6개   
tail(mapo1,10)
#class(mapo1) Character


extractNoun("자바 프로그래밍 실습 예제 ")  #명사 추출 함수 

# sapply() 함수를 사용하여 반복해서 명사추출 
# extractNoun() 함수 실행 명사 단어 뽑아내기 데이터 량에따라 시간이 처리 걸린다 ####
mapo2 <- sapply(mapo1, 
                extractNoun, 
                USE.NAMES = FALSE)
mapo2  #단어로 쪼개진것이 확인 
#class(mapo2) list
#USE.NAMES = FALSE 는 factor인 경우 라벨 제외 

head(unlist(mapo2), 30) 
mapo3 <- unlist(mapo2)   #벡터로 쪼개
mapo3
#class(mapo3) character로 구성된 vector

#불필요한것을 없애거나 필요한것을 뽑아내거나 
#불필요한것을 없애는것? 만약 숫자 없애는 경우 => 원본 데이터 왜곡 발생할수있다. 
#데이터 전처리시 데이터 왜곡 발생 문제 없애려면 정규식을 적절히 사용 필요 
#정규식 => 데이터 왜곡을 줄일수 있다.  1억개중 10개는 티도 안난다
#적당하게 데이터 전처리 작업을 하자 


# 정규표현식을 적용하여
# 불필요한 단어 처리 숫자  OO   특정 단어 패턴을 공백으로 대체 함수 gsub
mapo3 <- gsub("\\d+","", mapo3)      #숫자를 없애기 
mapo3 <- gsub("\'","", mapo3)        
mapo3 <- gsub("[\"]","", mapo3)
mapo3 <- gsub("○○","", mapo3)
mapo3 <- gsub("secret","", mapo3) 
mapo3


# 중간 결과 파일로 저장  사이즈가 크다면 중간에 백업필요 
write(unlist(mapo3), "data2/mapo_bak1.txt") 
mapo4 <- read.table("data2/mapo_bak1.txt")
mapo4
class(mapo4)  #"data.frame"
nrow(mapo4)





# table() 함수를 사용하여
# 빈도분석 수행 ####
# 교차 빈도표    같은지 비교후 count   논리연산  
wordcount <- table(mapo4)
wordcount
class(wordcount) #"table"
head(sort(wordcount, decreasing = T), 20)  #단어별 빈도수 확인 상위 20개 확인 후 불필요한 단어 제거 
#내림차순 decreasing = T , 기본은 오름차순  

mapo3
#단어별 빈도수 확인 상위 20개 확인 후 불필요한 단어 제거 
#한글자 지울때마다 문제 발생 정규식 필요 
mapo3 <- gsub("행정과","", mapo3)
mapo3 <- gsub("완료","", mapo3)
mapo3 <- gsub("관련","", mapo3)
mapo3 <- gsub("요청","", mapo3)
mapo3 <- gsub("김","", mapo3)
mapo3 <- gsub("이","", mapo3)
mapo3 <- gsub("박","", mapo3)
mapo3 <- gsub("것","", mapo3)
mapo3 <- gsub("최","", mapo3)
mapo3 <- gsub("축","", mapo3)
mapo3 <- gsub("한","", mapo3)
mapo3 <- gsub("정","", mapo3)
mapo3 <- gsub("동","", mapo3)
mapo3 <- gsub("홍","", mapo3)
mapo3

write(unlist(mapo3), "data2/mapo_bak2.txt")
mapo4 <- read.table("data2/mapo_bak2.txt")
mapo4
class(mapo4)  #"data.frame"
wordcount <- table(mapo4)
wordcount
head(sort(wordcount, decreasing = T), 20)


# 색상지정 패키지
# install.packages("RcolorBrewer")
library(RColorBrewer)

# 색상표 확인 => 이름 확인후 적절히 사용 
display.brewer.all(type = "all")
display.brewer.all(type = "div")
display.brewer.all(type = "qual")
display.brewer.all(type = "seq")

# 색지정  숫자는 색상 지원 갯수 보다 작아야 한다.####
palete <- brewer.pal(8, "Dark2") #Dark2가 지원한는 색상 8개 사용 
palete
class(palete) #vector
palete[3]  #색상 바꿀수 있다.

# 워드클라우드 출력 ####
wordcloud(names(wordcount),
          freq = wordcount,
          scale = c(5, 1),
          rot.per = 0.25,
          min.freq = 6,
          random.order = F,
          random.color = T,
          colors = palete)
#90도만 지원 , 색상표빼면 검정색으로만 





# 범례출력 ####
legend(0.38, 
       0.85, 
       "마포구민원게시판",
       cex = 0.8, 
       fill = NA, 
       border = NA,
       bg = "white", 
       text.col = "red",
       text.font = 2, 
       box.col = "red")









# 작업디렉토리 해제
getwd()
setwd("~")
getwd()
