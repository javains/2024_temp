# 작업디렉토리 지정
getwd()
setwd("~/[008]_GGPLOT2")
getwd()






# ggplot2 ####
install.packages("ggplot2")
install.packages("ggthemes")  #테마적용패키지
library(ggplot2)
library(ggthemes)
library(scales)



#내장 데이터 diamonds
diamonds
# 그래프 출력 ####
ggplot(data = diamonds, 
       aes(x = carat,
           y = price,
           colour = clarity)) + 
  geom_point() + 
  theme_wsj()

#aes 미적요소 직접 적용 대신 테마를 사용 할 수도 있다.



# 객체지정 ####
g1 <- ggplot(data = diamonds, 
             aes(x = carat, 
                 y = price, 
                 colour = clarity))

# 객체지정
g2 <- geom_point()

# 객체지정
g3 <- theme_wsj()   #월스트리트 저널 테마 

# 그래프 출력
g1 + g2 + g3     #객체에 할당하면 재활용하여 사용 가능
g1 + g2 + g3 
g1 + g2

# 테마변경
g1 + g2 + theme_bw()

#구조는 심플한데  처리 속도는 느리다.  



# 
# DF 학생 17명 데이터 
# geom_point() and geom_line() ####
DF <- read.csv("data/PII.csv")

# 객체지정
g1 <- ggplot(DF, aes(x = Height, 
                     y = Weight, 
                     colour = BloodType))

# 포인트 출력
g1 + geom_point()
g1 + geom_point(size=7)


# 라인 출력
g1 + geom_line()   # => 좋은 시각화는 아니다 
g1 + geom_line(size=1)

# 포인트 + 라인 출력     레이어 개념이 들어가므로 가능  
g1 + geom_line() + geom_point()


# 사이즈 지정 ####
g1 + 
  geom_line(size = 1) + 
  geom_point(size = 5)









# geom_line() 내에서 aes() 재지정 가능
# ggplot()의 aes() 값도 상속받음
# aes 추가 가능 
g1 + 
  geom_line(aes(colour = Gender), 
            size = 1) + 
  geom_point(size = 5)












#facet_grid(종속변수~독립변수) 그래프를 x축 기준으로 나눈다. 

# facet_grid(종속변수~독립변수)  ####
# 명목형 변수를 기준으로 별도의 그래프 작성

# x축 기준
g1 + 
  geom_line(size = 1) + 
  geom_point(size = 5) + 
  facet_grid(.~Gender)


# y축 기준
g1 + 
  geom_line(size = 1) + 
  geom_point(size = 5) + 
  facet_grid(Gender~.)

#데이터의 분포가 다른데 동일한 y축 범위를 사용하면 ?  => scales = "free"


# scales = "free"를 적용하여 
# 명목변수 별 각각의 스케일을 허용
g1 + 
  geom_line(size = 1) + 
  geom_point(size = 5) + 
  facet_grid(Gender~., scales = "free")







# geom_bar() ####
ggplot(DF, aes(x = BloodType)) + 
  geom_bar()

#color  fill  구분 사용 
# fill로 색지정
ggplot(DF, aes(x = BloodType, fill = Gender)) + 
  geom_bar()
#=> 오해의 소지가 있다 

# 성별 막대그래프 분리  => 이그래프가 명확하다.
ggplot(DF, aes(x = BloodType, fill = Gender)) + 
  geom_bar(position = "dodge")


# 막대그래프는 높이만 의미가 있다.
# 막대그래프 폭 지정
ggplot(DF, aes(x = BloodType, fill = Gender)) + 
  geom_bar(position = "dodge", width = 0.3)
#폭을 줄이면 값이 높아 보인다.  











#geon_histogram 은 폭도 의미가 있다 .
# geon_histogram() ####
# 객체지정
g1 <- ggplot(diamonds, aes(x = carat))

# 그래프 출력
g1 + 
  geom_histogram(binwidth = 0.1, 
                 fill = "darkgreen")


# color 명목형 변수별 출력
g1 + 
  geom_histogram(binwidth = 0.1, 
                 fill = "darkgreen") + 
  facet_grid(color~.)


# 출력값 scale 조정
g1 + 
  geom_histogram(binwidth = 0.1, 
                 fill = "darkgreen") + 
  facet_grid(color~., scales = "free")
#동일한 분포지만 



# alpha(투명도) 적용
g1 + 
  geom_histogram(aes(fill = color), 
                 binwidth = 0.1, 
                 alpha = 0.5)
#겹치면 찐하게 처리할때 alpha 지정한다. 










# geom_point()-산점도 그리기 ####
DF <- read.csv("data/PII.csv")  #데이터 초기화 

g1 <- ggplot(DF, 
             aes(x = Weight, y = Height))

g1 + geom_point()
g1 + geom_point(size=5)


# 명목형 변수의 Level별 색상지정
g1 + 
  geom_point(aes(colour = Gender), size = 5)


# 점모양 변경
g1 + 
  geom_point(aes(colour = Gender, shape = Gender), 
                size = 5)


g1 + 
  geom_point(aes(colour = Gender, 
                 shape = BloodType),
             size = 5)
#지정되는 타입 명목형
#연속형에 지정도 가능 그때는 구간을 나누어서 적용하는것이 바람짇 



# 연속형 변수로 색상지정
g1 + 
  geom_point(aes(colour = Height, 
                 shape = BloodType),
             size = 5)


# 연속형 변수로 사이즈 지정
g1 + 
  geom_point(aes(size = Height, 
                 shape = Gender),
             colour = "red")


# alpha(투명도) 지정   기본=1
g1 + 
  geom_point(aes(colour = Gender, 
                 shape = BloodType),
             size = 5,
             alpha = 0.5)


# 휘귀선 그리기  lm 
g1 + 
  geom_point(aes(colour = Gender), size = 5) + 
  geom_smooth(method = "lm")


# 이름 표시하기   geom_text
g1 + 
  geom_point(aes(colour = Gender), size = 5) + 
  geom_text(aes(label = Name))

g1 + 
  geom_point(aes(colour = Gender), size = 5) + 
  geom_text(aes(label = Name), 
            vjust = -1.1,
            colour = "gray35")
#우리랑 방향 감각이 반대 




#필요할때 찾아서 사용 

#시간의 흐름을 가지고 자료 처리  문제 발생  ?   factor(Date) 처리 필요 검토 필요 
# 001-[시계열데이터라인] ####
# 2014/2015년도 매출정보
TS <- read.csv("data/ts.csv")
TS   #시간의 흐름에따라 매출이 증가 

# library(ggplot2)
# library(ggthemes)

# 모든값이 출력되지 않는 문제 발생
ggplot(TS, aes(x = Date, y = Sales)) + 
  geom_line()




# factor()를 사용하여 요인값으로 변경
ggplot(TS, aes(x = factor(Date), 
               y = Sales, 
               group = 1)) + 
  geom_line()


# 점추가
ggplot(TS, aes(x = factor(Date), 
               y = Sales,
               group = 1)) + 
  geom_line() + 
  geom_point()


# 테마적용    theme_light()
ggplot(TS, aes(x = factor(Date), 
               y = Sales, 
               group = 1)) + 
  geom_line() + 
  geom_point() + 
  theme_light()


# 색상지정
ggplot(TS, aes(x = factor(Date), 
               y = Sales, 
               group = 1)) + 
  geom_line(colour = "orange1", 
            size = 1) + 
  geom_point(colour = "orangered2", 
             size = 4) + 
  theme_light()


# x축, y축 이름지정
ggplot(TS, aes(x = factor(Date), 
               y = Sales, 
               group = 1)) + 
  geom_line(colour = "orange1", 
            size = 1) + 
  geom_point(colour = "orangered2", 
             size = 4) + 
  xlab("년도") +
  ylab("매출") + 
  ggtitle("월별매출") +
  theme_light() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))






# 작업디렉토리 복원
getwd()
setwd("~")
getwd()


