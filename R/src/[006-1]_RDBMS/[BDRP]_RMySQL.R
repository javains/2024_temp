# install.packages("RODBC")
# library(RODBC)


# RMySQL 패키지 설치 및 호출
install.packages("RMySQL")
library(RMySQL)


#도커 ip   id pw
# DB 연결설정
con <- dbConnect(MySQL(), 
                 user="root", 
                 password="rootpwd", 
                 host="192.168.99.100",
                 dbname="bigdata_db",
                 client.flag=CLIENT_MULTI_RESULTS)



# SQL구문 설정
sql <- "SELECT * from rclass_tb"


# 쿼리 요청
rows <- dbGetQuery(con, sql)

# 결과 확인
rows
