 install.packages("RCurl")
# install.packages("XML")
library(RCurl)
library(XML)


#네이버 개발자등록 ID/PW필요   쇼셜분석  감성 분석  
# 블로그 검색 API ####
# searchUrl <- "https://openapi.naver.com/v1/search/blog.xml"
 
searchUrl <- "https://openapi.naver.com/v1/search/blog.xml"

#
#Client ID : QuXvRyP4NkIBzebrT_Hs
#Client Secret : nuRjoOrM_H

# 클라이언트 ID와 시크릿
# 본인의 ID/Secret 입력
#Client_ID <- "본인 ID 입력"
#Client_Secret <- "본인 Secret 입력"

Client_ID <- "QuXvRyP4NkIBzebrT_Hs"
Client_Secret <- "nuRjoOrM_H"


# 검색어 
query <- URLencode(iconv("국세청","euc-kr","UTF-8"))
query <- URLencode(iconv("비트코인","euc-kr","UTF-8"))
query <- URLencode(iconv("봄맞이","euc-kr","UTF-8"))

# 블로그 검색
# &display 최대값 100   #paste  붙이기  검색해서 보여주는 것이 100개 
url <- paste(searchUrl, "?query=", query, "&display=100", sep="")

doc <- getURL(url, 
              httpheader = c('Content-Type' = "application/xml",
                             'X-Naver-Client-Id' = Client_ID,
                             'X-Naver-Client-Secret' = Client_Secret))

# 블로그 내용에 대한 리스트 만들기		
doc2 <- htmlParse(doc, encoding="UTF-8")
text <- xpathSApply(doc2, "//item/description", xmlValue) 
text








# install.packages("RCurl")
# install.packages("XML")
library(RCurl)
library(XML)


# 뉴스 검색 API ####

searchNrl <- "https://openapi.naver.com/v1/search/news.xml"

# 클라이언트 ID와 시크릿
# 본인의 ID/Secret 입력
Client_ID <- "본인 ID 입력"
Client_Secret <- "본인 Secret 입력"

# 검색어 
query <- URLencode(iconv("국세청","euc-kr","UTF-8"))
query <- URLencode(iconv("금리인상","euc-kr","UTF-8"))

# 뉴스 검색
# &display 최대값 100
nrl <- paste(searchNrl, "?query=", query, "&display=100", sep="")

ndoc <- getURL(nrl, 
              httpheader = c('Content-Type' = "application/xml",
                             'X-Naver-Client-Id' = Client_ID,
                             'X-Naver-Client-Secret' = Client_Secret))

# 뉴스 내용에 대한 리스트 만들기		
ndoc2 <- htmlParse(ndoc, encoding="UTF-8")
ntext <- xpathSApply(ndoc2, "//item/description", xmlValue) 
ntext









# install.packages("RCurl")
# install.packages("XML")
library(RCurl)
library(XML)


# 카페 검색 API ####

searchCrl <- "https://openapi.naver.com/v1/search/cafearticle.xml"

# 클라이언트 ID와 시크릿
# 본인의 ID/Secret 입력
Client_ID <- "본인 ID 입력"
Client_Secret <- "본인 Secret 입력"

# 검색어 
query <- URLencode(iconv("국세청","euc-kr","UTF-8"))
query <- URLencode(iconv("코뉴어","euc-kr","UTF-8"))
query <- URLencode(iconv("빅데이터","euc-kr","UTF-8"))

# 카페글 검색
# &display 최대값 100
crl <- paste(searchCrl, "?query=", query, "&display=100", sep="")

cdoc <- getURL(crl, 
               httpheader = c('Content-Type' = "application/xml",
                              'X-Naver-Client-Id' = Client_ID,
                              'X-Naver-Client-Secret' = Client_Secret))

# 카페글 내용에 대한 리스트 만들기		
cdoc2 <- htmlParse(cdoc, encoding="UTF-8")
ctext <- xpathSApply(cdoc2, "//item/description", xmlValue) 
ctext










