# 작업디렉토리 지정
getwd()
setwd("~/[004-2]_WC2")
getwd()




#이미지 준비후 시각화에 활용 

# 001-[wordcloud2 패키지] ####
#의존성 패키지로 이미 설치 
# install.packages("jsonlite")
# install.packages("yaml")
install.packages("wordcloud2")

# library(jsonlite)
# library(yaml)
library("wordcloud2")


# demoFreq, demoFreqC(중국어) ####
#R이 기본으로 가지고 있는 내장 객체 
demoFreq
demoFreqC
#내장객체로 분석 실습   
wordcloud2(data = demoFreq)

wordcloud2(data = head(demoFreq))
#1등부터 15등  
wordcloud2(data = head(demoFreq,15))

wordcloud2(demoFreqC)

wordcloud2(head(demoFreqC, 15))


# minSize 기본값 = 0 ####
wordcloud2(demoFreq,
           minSize = 0)

wordcloud2(data = demoFreq, 
           minSize = 15)

#시각화 결과가 viewer 창 커서가지고 가면 빈도수 확인가능  


# shape, size, backgroundColor 옵션 ####
wordcloud2(demoFreq,
           shape = "circle")

wordcloud2(demoFreq,
           size = 0.5,
           shape = "circle")

wordcloud2(demoFreqC,
           shape = "diamond")

wordcloud2(demoFreq,
           shape = "diamond")

wordcloud2(demoFreq,
           shape = "cardioid")

wordcloud2(demoFreqC,
           shape = "triangle-forward")

wordcloud2(demoFreq,
           shape = "triangle")

wordcloud2(demoFreqC,
           shape = "pentagon")

wordcloud2(demoFreq,
           shape = "star", 
           backgroundColor = "black")
#바탕그림 없이 그냥 찍힘   



# ellipticity 옵션 원의 곡선도 ####
wordcloud2(demoFreq,
           ellipticity = 1.0)

wordcloud2(demoFreq,
           ellipticity = 2.0)

wordcloud2(demoFreq,
           ellipticity = 5.0)

wordcloud2(demoFreq,
           ellipticity = 0.5)

wordcloud2(demoFreq,
           ellipticity = 0.1)



#wordclod2 윈도우 버전 느려지는 문제 있슴   빗자루 클릭 

# color 옵션 ####
wordcloud2(demoFreq,
           color = "random-dark")


wordcloud2(demoFreq,
           color = "random-light", 
           backgroundColor = "black")


wordcloud2(demoFreq,
           color = rep_len(c("green", "blue"), 
                           nrow(demoFreq)))


wordcloud2(demoFreq,
           color = rep(c("red", "skyblue"), 
                       length.out=nrow(demoFreq)), 
           fontWeight = "bold")


wordcloud2(demoFreq,
           color = ifelse(demoFreq[, 2] > 20, 
                          "red", "skyblue"))
#빈도수 20 까지는 red 나머지는 blue 

demoFreq[, 2]



# fontweight 옵션 ####
# 기본
wordcloud2(demoFreq)

# 굵은 폰트
wordcloud2(demoFreq,
           fontWeight = "bold")

# 얇은 폰트
wordcloud2(demoFreq, 
           fontWeight = "normal") 

# fontWeight 없음
wordcloud2(data = demoFreq,
           fontWeight = NULL)





# 출력각도지정 ####
wordcloud2(demoFreq)


wordcloud2(demoFreq,
           minRotation = 0,
           maxRotation = 0)

wordcloud2(demoFreq,
           minRotation = pi,
           maxRotation = pi)

wordcloud2(demoFreq,
           minRotation = -pi/2,
           maxRotation = -pi/2)

wordcloud2(demoFreq,
           minRotation = pi/2,
           maxRotation = pi/2)

wordcloud2(demoFreq, 
           minRotation = -pi/6,
           maxRotation = -pi/6)

wordcloud2(demoFreq, 
           minRotation = pi/6,
           maxRotation = pi/6,
           rotateRatio = 1)

#일반적으로 많이 사용하는 값들이다. 
wordcloud2(demoFreq,
           minRotation = pi/6,
           maxRotation = pi/6,
           rotateRatio = 0.25)

wordcloud2(demoFreq,
           minRotation = pi/6,
           maxRotation = -pi/6)



# 그림파일을 사용하여 출력 ####
wordcloud2(demoFreq, 
           figPath = "data/koo.jpg", 
           color = "skyblue")

#error 글자가 잘 안됨 
install.packages("devtools")
#library 안하고 다이렉트 사용
#git hub에서 댕겨서 직접  설치한다.
devtools::install_github("lchiffon/wordcloud2")

wordcloud2(demoFreq, 
           figPath = "data/koo.jpg", 
           color = "skyblue")

#그림에 출력하려면 데이터 글자 갯수가 충분해야 한다. 
wordcloud2(demoFreq, 
           figPath = "data/koo.jpg", 
           color = "blue")

#트위터 그림 스누피 검색 









# letterCloud() 함수  글자모양으로 찍는다  두번 실행해야 결과를 준다  빗자루 클릭  ####
letterCloud(demoFreq,
            word = "R",
            color = "random-light",
            backgroundColor="black")

letterCloud(demoFreq,
            word = "구",
            color = "random-light",
            backgroundColor="black")

#R의 호완성은 맥 리눅스 가 좋다   

letterCloud(demoFreq,
            word = "BIG",
            color = "blue",
            backgroundColor="green")

letterCloud(demoFreq, 
            word = "DATA", 
            color="random-dark")






# 002-[웹페이지에서 steve.txt 분석하기]
# "steve.txt"의 내용을 복사하여 아래 웹페이지에서 wordcloud 실행
# https://www.jasondavies.com/wordcloud/



# 작업디렉토리 복원
getwd()
setwd("~")
getwd()
