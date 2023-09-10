# 정규표현식 실습데이터    make vector  
retxt <- c("Sports", "SPORTS", 
           "sports", "sPORTS",
           "Baseball1", "sports",
           "baseball2")

retxt



# 정규표현식 예제 ####
grep("sports", retxt)  #
grep("spor", retxt)

grep("sports", retxt, value = TRUE)

grep("^s+", retxt, value = TRUE)

grep("^S+", retxt, value = TRUE)

grep("TS$", retxt, value = TRUE)

grep("[0-9]$", retxt, value = TRUE)

grep("[Ba]", retxt, value = TRUE)

grep("[0-9]", retxt, value = TRUE)

grep("[2-9]", retxt, value = TRUE)

grep("[[:digit:]]", retxt, value = TRUE)

grep("[[:upper:]]", retxt, value = TRUE)

grep("[[:lower:]]", retxt, value = TRUE)

grep("\\d", retxt, value = TRUE)




# 문자열 길이 확인 ####
nchar(retxt)








# 한글에 적용 ####
gregexpr(pattern = "[ㄱ-ㅎ]", 
         text = "ㅅ1서Jㅓㅂ9브Kㅡ")

gregexpr(pattern = "[ㅏ-ㅣ]", 
         text = "ㅅ1서Jㅓㅂ9브Kㅡ")

gregexpr(pattern = "[가-힣]", 
         text = "ㅅ1서Jㅓㅂ9브Kㅡ")











# 문자열 연결 ####
a <- "Baseball"
b <- "players"

paste(a,b)

paste("Lee", "Na", "Young")

paste("Lee", "Na", "Young", 
      sep=" ")

paste("Lee", "Na", "Young", 
      sep="/")

paste("Lee", "Na", "Young", 
      sep=":")

paste("Lee", "Na", "Young", 
      sep=" *** ")



# 특정 부분 골라내기 ####
substr(a, 5, 5)

substr(a, 5, 8)






# 특정 구분자 기준으로 분리 ####
strsplit("2017/06/16", 
         split = "/")

c <- paste(a, b)
c

strsplit(c, split = "\\s")  # \\s 공백의미  공백으로 나눈다.  정규식에서 공백 의미 


