# 작업디렉토리 확인 ####
getwd()

# 작업디렉토리 지정 ####
setwd("~/[006]_FIO")
getwd()




# 작업디렉토리 내 파일 확인 ####
dir()
list.files()

list.files(recursive = TRUE)
list.files(all.files = TRUE)




# scan() ####
# 파일 읽어오기
scan("data/scan_1.txt")
scan("data/scan_2.txt")
scan("data/scan_2.txt", what="")
scan("data/scan_3.txt", what="")
scan("data/scan_4.txt", what="")



# scan() 함수로 숫자 입력받기
userinput1 <- scan()
75
76
77
78
  # 콘솔창에서 엔터만 입력
userinput1


# scan() 함수로 문자 입력받기
userinput2 <- scan(what="")
R
Program
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
sink("data2/003_outSink.txt")
cat(RBigData)
cat(RBigData)
cat(RBigData)
sink()
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




# write.table() 함수로 저장하기
write.table(RBigData, "data2/004_outTable.txt", 
            col.names = FALSE, 
            row.names = FALSE)
read.table("data2/004_outTable.txt")





# read.csv() ####
read.csv("data/FileIO_1.csv")

read.csv("data/FileIO_2.csv")

read.csv("data/FileIO_2.csv", 
         header = FALSE)



# col.names로 해더 지정하기
label <- c("NO", "MODEL", "PRICE", "DISCOUNT")

(CSV <- read.csv("data/FileIO_2.csv", 
                header = FALSE, 
                col.names = label))




# write.csv() 함수로 파일 저정하기
write.csv(CSV, file = "data2/005_outCSV.csv", 
          row.names = FALSE)

read.csv("data2/005_outCSV.csv")





# XML ####
install.packages("XML")
library(XML)

(XMLtext <- xmlTreeParse("data/ListPrice.xml", 
                       useInternal = TRUE))

(RootNode <- xmlRoot(XMLtext))

(Models <- xpathSApply(RootNode, 
                     "//model", 
                     xmlValue))

(Prices <- xpathSApply(RootNode, 
                      "//price", 
                      xmlValue))

(DF.XML <- data.frame(Model = Models, 
                        Price = Prices))











# XML로 저장하기
install.packages("kulife")
library(kulife)

write.xml(DF.XML, file="data2/006_outXML.xml")





# 엑셀파일 읽어오기 ####
install.packages("readxl")
library(readxl)

read_xlsx(path = "data/PII.xlsx",
          sheet = "Sheet1",
          col_names = TRUE)



# 윈도우즈에서 엑셀실행 후 
# 복사할 내용  Ctrl+C 한 후에 진행
PII_List <- read.delim("clipboard")

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



read_xlsx(path = "data2/007_outXLSX.xlsx", 
          sheet = "PII_list", 
          col_names = TRUE)







# 작업디렉토리 초기화
getwd()
setwd("~")
getwd()

