#내문서가 기본 작업디렉토리리   명령어는 consol창에서 실행한다.
#작업창과 console창 구분하여실
#ctrl+엔터   작업창의 명령이 console창에서 실행  alt+enter 구분 사용
#ctrl+1,  ctrl+2 로 창 이동 단축키(Tools)

# R configurations ####
# 디스크에 패키지 설치
install.packages("ggplot2")


# 메모리에 패키지 올리기
library(ggplot2)


# 특정 패키지 업데이트
update.packages("ggplot2")


# 모든 패키지 업데이트  , 영역잡은후 실행해도된다.  p41
# update.packages()


# 패키지 설치 위치
.libPaths()


# 설치된 패키지 확인
installed.packages()
installed.packages()[,c("Package","Version")]


# 패키지정보 메모리에서 제거
search()
library(KoNLP)
detach("package:KoNLP")

detach("package:ggplot2")
search()


# 패키지 디스크에서 제거
remove.packages("ggplot2")


# CRAN으로부터 설치가능한 패키지 확인
available.packages()


