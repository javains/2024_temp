# 작업디렉토리 확인 ####
getwd()

# 작업디렉토리 지정 ####
setwd("~/[006]_FIO")
getwd()




# 작업디렉토리 내 파일 확인 ####
dir()
list.files()

list.files(recursive = TRUE)  #recursive 하위 디렉토리 내용 까지 
list.files(all.files = TRUE)  #히든 파일까지 




# scan() ####
# 파일 읽어오기
scan("data/scan_1.txt")
#rdata <-scan("data/scan_1.txt")

round(3.5) #4
round(2.5) #2   .5에 걸린경우 짝수 라운딩 처리,홀수 라운딩  나라마다 처리가 다르다. 

scan("data/scan_2.txt")
scan("data/scan_2.txt", what="")  #숫자형을 문자형으로 처리 
scan("data/scan_3.txt", what="")

scan("data/scan_4.txt", what="")



# scan() 함수로 숫자 입력받기
userinput1 <- scan()
75  #ctrl + enter 누른다.
76
77
78
  # 콘솔창에서 엔터만 입력
userinput1


# scan() 함수로 문자 입력받기
userinput2 <- scan(what="")
RProgram
Big
Data
  # 콘솔창에서 엔터만 입력
userinput2


# readline() ####
# 문자 입력받기
userinput3 <- readline()
R Program Big Data
userinput3





# readline() 함수로 문자 입력받기
userinput4 <- readline("Are you with me? : " )
YES
userinput4






# readLines() 함수로 파일 읽어오기
readLines("data/scan_4.txt")








# writeLines() ####
# 파일 저장하기
RBigData <- "R Program Big Data"
writeLines(RBigData, "data2/001_outLines.txt")
readLines("data2/001_outLines.txt")





# cat() 함수로 파일 저장하기
cat(RBigData, file="data2/002_outCat.txt")
scan("data2/002_outCat.txt", what = "")







# sink() 함수로 파일 저장하기
sink("data2/003_outSink.txt")   # ***시작
cat(RBigData)
cat(RBigData)                      # **sink에 지정된 파일로 결과가 나간다.
cat(RBigData)
sink()                          # ****종료 
scan("data2/003_outSink.txt", what = "")



# read.table() ####
read.table("data/FileIO.txt")

read.table("data/FileIO.txt", 
           header = TRUE)

read.table("data/FileIO.txt", 
           skip = 2)

read.table("data/FileIO.txt", 
           nrows = 2, 
           header = TRUE)

read.table("data/FileIO.txt", 
           skip = 2, 
           nrows = 2)

#  read.table   과 짝 write.table


# write.table() 함수로 저장하기
write.table(RBigData, "data2/004_outTable.txt", 
            col.names = FALSE, 
            row.names = FALSE)
read.table("data2/004_outTable.txt")





# read.csv() ####
read.csv("data/FileIO_1.csv")

read.csv("data/FileIO_2.csv")  # 헤더가 없는경우 벡터의 이름 Objext 이름에 영문자로시 작하게 처리 숫자시작 안됨 

read.csv("data/FileIO_2.csv", 
         header = FALSE)   #헤더가 없다면 false 처리  

#read의 결과로 데이터 프레임이 만들어진다.

#https://www.data.go.kr/

# col.names로 해더 지정하기
label <- c("NO", "MODEL", "PRICE", "DISCOUNT")

(CSV <- read.csv("data/FileIO_2.csv", 
                header = FALSE, 
                col.names = label))




# write.csv() 함수로 파일 저정하기
write.csv(CSV, file = "data2/005_outCSV.csv", 
          row.names = FALSE)
#file 구조에서 확인 마치 테이

read.csv("data2/005_outCSV.csv")




# XML 읽는 패키지"xml" ,쓰는 패키지"kulife"가 분리 되어 있다.
# XML ####
install.packages("XML")
library(XML)

(XMLtext <- xmlTreeParse("data/ListPrice.xml", 
                       useInternal = TRUE))

(RootNode <- xmlRoot(XMLtext))
#() print 함수

(Models <- xpathSApply(RootNode, 
                     "//model", 
                     xmlValue))
#model 값만 뽑아낸다

(Prices <- xpathSApply(RootNode, 
                      "//price", 
                      xmlValue))
# 값  뽑아내고 다시 Data Frame을 만드는 형태 

(DF.XML <- data.frame(Model = Models, 
                        Price = Prices))











# XML로 저장하기
install.packages("kulife")
library(kulife)

write.xml(DF.XML, file="data2/006_outXML.xml")


#웹크롤링 하다 보면 xml 많이 본다 

#엑셀과 csv 의 가장 큰 차이점은 sheet 이다.  

# 엑셀파일 읽어오기 ####
install.packages("readxl")   #sheet 처리 가능 
library(readxl)

read_xlsx(path = "data/PII.xlsx",
          sheet = "Sheet1",
          col_names = TRUE)


df2<- read_xlsx(path = "data/PII.xlsx",
                sheet = "Sheet1",
                col_names = TRUE)

df2


# 윈도우즈에서 엑셀실행 후 
# 복사할 내용  Ctrl+C 한 후에 진행
PII_List <- read.delim("clipboard")
#엑셀에서 범위지정후 ctrl+c 한후 위의 명령을 실행하면 clipboard의 내용을 읽어온다.



# 복사된 데이터 확인(필수)
PII_List




# xlsl로 저장하기
install.packages("xlsx")
install.packages("rJava")
library(xlsx)
library(rJava)





# Sheet 이름 지정 안함
write.xlsx(DF.XML, 
           file = "data2/007_outXLSX.xlsx")


read_xlsx(path = "data2/007_outXLSX.xlsx", 
           sheet = "Sheet1", 
           col_names = TRUE)


# Sheet 이름 지정함
write.xlsx(PII_List,
           file = "data2/007_outXLSX.xlsx",
           sheetName = "PII_list",
           col.names = TRUE,
           row.names = FALSE,
           append = TRUE)
#append = TRUE sheet 추가 옵션 이미 있는 엑셀파일에 sheet가 추가되는 형태 

#헤더 네임을 R에서 처리시 숫자앞에는 X처리됨 나중에 Object 이름 규칙 숫자 안됨 때문 

read_xlsx(path = "data2/007_outXLSX.xlsx", 
          sheet = "PII_list", 
          col_names = TRUE)







# 작업디렉토리 초기화
getwd()
setwd("~")
getwd()

