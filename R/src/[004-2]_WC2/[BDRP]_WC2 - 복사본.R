# 작업디렉토리 지정
getwd()
setwd("~/[004-2]_WC2")
getwd()






# 001-[wordcloud2 패키지] ####
# install.packages("jsonlite")
# install.packages("yaml")
install.packages("wordcloud2")

# library(jsonlite)
# library(yaml)
library("wordcloud2")


# demoFreq, demoFreqC ####
wordcloud2(data = demoFreq)

wordcloud2(data = head(demoFreq))

wordcloud2(demoFreqC)

wordcloud2(head(demoFreqC, 15))


# minSize 기본값 = 0 ####
wordcloud2(demoFreq,
           minSize = 0)

wordcloud2(data = demoFreq, 
           minSize = 15)




# shape, size, backgroundColor 옵션 ####
wordcloud2(demoFreq,
           shape = "circle")

wordcloud2(demoFreq,
           size = 0.5,
           shape = "circle")

wordcloud2(demoFreqC,
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




# ellipticity 옵션 ####
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






# letterCloud() 함수 ####
letterCloud(demoFreq,
            word = "R",
            color = "random-light",
            backgroundColor="black")

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
