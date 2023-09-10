# Sample Project
# SPSS 형식의 한국복지패널데이터 활용하기


# 작업디렉토리 지정 
getwd()
setwd("~/[104]_SPRJ")
getwd()


# foreign 패키지 설치
install.packages("foreign")  
library(foreign)             # SPSS 파일 로드
library(dplyr)               # 전처리
library(ggplot2)             # 시각화
library(readxl)              # 엑셀 파일 불러오기




# SPSS 데이터 불러오기
raw_welfare <- read.spss(file = "data/Koweps.sav",
                         to.data.frame = T)

# 복사본 만들기
welfare <- raw_welfare




# 데이터 검토하기
head(welfare)
tail(welfare)
View(welfare)
dim(welfare)
str(welfare)
summary(welfare)



# 변수명 바꾸기
welfare <- rename(welfare,
                  sex = h10_g3,              # 성별
                  birth = h10_g4,            # 출생 연도
                  marriage = h10_g10,        # 혼인 상태
                  religion = h10_g11,        # 종교
                  income = p1002_8aq1,       # 월급
                  code_job = h10_eco9,       # 직종 코드
                  code_region = h10_reg7)    # 지역 코드











# Project-Part1
# 성별에 따른 월급 차이 비교
# 1단계 : 변수 검토 및 전처리 - 성별, 월급
# 2단계 : 변수 간 관계 분석 - 성별 월급 평균표 만들기, 그래프 만들기

# 성별 변수 검토 및 전처리
class(welfare$sex)
table(welfare$sex)    # 빈도분석 1:남자, 2:여

# 결측치 확인
table(is.na(welfare$sex))

# 성별 항목 이름 부여
welfare$sex <- ifelse(welfare$sex == 1, "male", "female")
table(welfare$sex)

# 빈도 막대 그래프 출력(집단 간 차이 표현)
qplot(welfare$sex)


# 월급 변수 검토 및 전처리
class(welfare$income)
summary(welfare$income)    # 요약통계량 확인

# 기본적으로 최대값까지 표현
qplot(welfare$income)
# 출력범위를 0 ~ 1000까지로 조정
qplot(welfare$income) + xlim(0, 1000)


# 전처리
# 이상치 확인
# 최소값 0, 최대값 2400, 결측치 12030개
summary(welfare$income)

# 이상치 결측 처리
# 월급은 1 ~ 9998까지의 값을 가짐
# 값이 0이거나 9999인 경우 결측치, 따라서 제외 시킴
welfare$income <- ifelse(welfare$income %in% c(0, 9999), NA, welfare$income)

# 결측치 확인
table(is.na(welfare$income))


# 성별에 따른 월급 차이 분석하기
# 성별 월급 평균표 만들기
sex_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(sex) %>%
  summarise(mean_income = mean(income))

sex_income

# 막대 그래프로 출력하기
ggplot(data = sex_income, aes(x = sex, y = mean_income)) + geom_col()





# Project-Part2
# 나이와 월급과의 관계 분석
# 1단계 : 변수 검토 및 전처리 - 나이, 월급
# 2단계 : 변수 간 관계 분석 - 나이 별 월급 평균표, 그래프 출력


# 나이 변수 검토 및 전처리
# 변수 검토하기
# 나이가 아닌 출생연도로 정보가 제공됨
# 출생연도 변수를 나이 변수로 전환해야 함
class(welfare$birth)
summary(welfare$birth)    # 출생연도

# 막대 그래프 출력
qplot(welfare$birth)


# 전처리
# 이상치 확인
summary(welfare$birth)

# 결측치 확인 - 결측치 없음
table(is.na(welfare$birth))


# 나이 변수 만들기
# 출생연도를 나이로 만들기
# 2015년 조사, 따라서 (2015 - 출생연도 + 1)
welfare$age <- 2015 - welfare$birth + 1
summary(welfare$age)

# 나이 막대 그래프 출력
qplot(welfare$age)


# 나이와 월급 관계 분석
# 월급변수는 Part1에서 전처리한 정보 사용
# 나이에 따른 월급 평균표 작성
age_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age) %>%
  summarise(mean_income = mean(income))

# 데이터 확인
head(age_income)


# 선 그래프 출력
ggplot(data = age_income, aes(x = age, y = mean_income)) + geom_line()











# Project-Part3
# 연령대에 따른 월급 차이
# 1단계 : 변수 검토 및 전처리 - 연령대, 월급
# 2단계 : 변수 간 관계 분석 - 연령대 월급 평균표, 그래프 출력

# Part2의 나이 변수를 활용하여 연령대 변수 생성
welfare <- welfare %>%
  mutate(ageg = ifelse(age < 30, "young",
                       ifelse(age <= 59, "middle", "old")))

# 빈도분석 - young(30세 미만), middle(30세~59세), old(60세 이상)
# 연령대별 인원구성 확인
table(welfare$ageg)

# 막대 그래프 출력
qplot(welfare$ageg)


# 연령대별 월급 차이 분석
# 연령대별 월급 평균표 작성
ageg_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(ageg) %>%
  summarise(mean_income = mean(income))

# young(163), middle(281), old(125)
ageg_income

# 연령대별 평균월급 막대 그래프 출력(기본 알파벳순)
ggplot(data = ageg_income, aes(x = ageg, y = mean_income)) + geom_col()

# 출력 순서 지정(young, middle, old)
ggplot(data = ageg_income, aes(x = ageg, y = mean_income)) +
  geom_col() +
  scale_x_discrete(limits = c("young", "middle", "old"))





# Project-Part4
# 연령대별 성별 월급 차이 분석
# 1단계 : 변수 검토 및 전처리 - 연령대, 성별, 월급
# 2단계 : 변수 간 관계 분석 - 연령대 및 성별 월급 평균표, 그래프

# 연령대 및 성별 월급 평균표
sex_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(ageg, sex) %>%
  summarise(mean_income = mean(income))

sex_income

# 막대 그래프 출력(성별에 따른 색지정)
ggplot(data = sex_income, aes(x = ageg, y = mean_income, fill = sex)) +
  geom_col() +
  scale_x_discrete(limits = c("young", "middle", "old"))

# 막대 그래프 출력(성별 막대 분리하여 출력)
ggplot(data = sex_income, aes(x = ageg, y = mean_income, fill = sex)) +
  geom_col(position = "dodge") +
  scale_x_discrete(limits = c("young", "middle", "old"))


# 나이 및 성별 월급 차이 분석
# 성별 연령별 월급 평균표 만들기
sex_age <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age, sex) %>%
  summarise(mean_income = mean(income))

head(sex_age)

# 선 그래프 출력
ggplot(data = sex_age, aes(x = age, y = mean_income, col = sex)) + geom_line()





# Project-Part5
# 직업별 월급차이
# 1단계 : 변수 검토 및 전처리 - 직업, 월급
# 2단계 : 변수 간 관계 분석 - 직업별 월급 평균표, 그래프
# 직업 변수 검토 및 전처리
class(welfare$code_job)

# 직업코드별 빈도분석
table(welfare$code_job)

# 직업코드 분류 엑셀 읽어오기
library(readxl)
list_job <- read_excel("data/JobCode.xlsx", col_names = T, sheet = 2)

# 결과 일부 확인
head(list_job)

# welfare에 직업명 결합
welfare <- left_join(welfare, list_job, id = "code_job")

welfare %>%
  filter(!is.na(code_job)) %>%
  select(code_job, job) %>%
  head(10)


# 직업별 월급 평균표 만들기
job_income <- welfare %>%
  filter(!is.na(job) & !is.na(income)) %>%
  group_by(job) %>%
  summarise(mean_income = mean(income))

head(job_income)

# 내림차순으로 상위 10개 추출
top10 <- job_income %>%
  arrange(desc(mean_income)) %>%
  head(10)

top10

# 그래프 출력
ggplot(data = top10, aes(x = reorder(job, mean_income), y = mean_income)) +
  geom_col() +
  coord_flip()


# 오름차순으로 하위 10위 추출
bottom10 <- job_income %>%
  arrange(mean_income) %>%
  head(10)

bottom10

# 그래프 출력
ggplot(data = bottom10, aes(x = reorder(job, -mean_income),
                            y = mean_income)) +
  geom_col() +
  coord_flip() +
  ylim(0, 850)










# Project-Part6
# 성별 직업 빈도
# 1단계 : 변수 검토 및 전처리 - 성별, 직업
# 2단계 : 변수 간 관계분석 - 성별 직업 빈도표, 그래프
# 성별 직업 빈도 분석
# 남성 직업 빈도 상위 10개 추출
job_male <- welfare %>%
  filter(!is.na(job) & sex == "male") %>%
  group_by(job) %>%
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  head(10)

job_male

# 그래프 출력
# 남성 직업 빈도 상위 10개 직업
ggplot(data = job_male, aes(x = reorder(job, n), y = n)) +
  geom_col() +
  coord_flip()


# 여성 직업 빈도 상위 10개 추출
job_female <- welfare %>%
  filter(!is.na(job) & sex == "female") %>%
  group_by(job) %>%
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  head(10)

job_female

# 그래프 출력
# 여성 직업 빈도 상위 10개 직업
ggplot(data = job_female, aes(x = reorder(job, n), y = n)) +
  geom_col() +
  coord_flip()



# Project-Part7
# 종교 유무와 이혼율
# 1단계 : 변수 검토 및 전처리 - 종교, 혼인상태
# 2단계 : 변수 간 관계 분석 - 종교 유무에 따른 이혼율, 그래프
# 종교 변수 검토 및 전처리하기
class(welfare$religion)

table(welfare$religion)


#전처리
# 종교 유무 이름 부여
welfare$religion <- ifelse(welfare$religion == 1, "yes", "no")

table(welfare$religion)

# 그래프 출력
qplot(welfare$religion)


# 혼인 상태 변수 검토 및 전처리
class(welfare$marriage)

# 0-18세미만, 1-혼인상태, 2-사별, 3-이혼, 4-별거, 5-미혼, 6-기타
table(welfare$marriage)

# 이혼 여부 변수 만들기
welfare$group_marriage <- ifelse(welfare$marriage == 1, "marriage",
                                 ifelse(welfare$marriage == 3, "divorce", NA))

table(welfare$group_marriage)

# 결측치(결혼상태, 이혼 둘다 속하지 않는 경우)
table(is.na(welfare$group_marriage))


# 종교 유무에 따른 이혼율 표 만들기
religion_marriage <- welfare %>%
  filter(!is.na(group_marriage)) %>%
  group_by(religion, group_marriage) %>%
  summarise(n = n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n/tot_group*100, 1))

religion_marriage

# count() 활용
religion_marriage <- welfare %>%
  filter(!is.na(group_marriage)) %>%
  count(religion, group_marriage) %>%
  group_by(religion) %>%
  mutate(pct = round(n/sum(n)*100, 1))


# 이혼율 표 작성
divorce <- religion_marriage %>%
  filter(group_marriage == "divorce") %>%
  select(religion, pct)

divorce

# 그래프 출력
ggplot(data = divorce, aes(x = religion, y = pct)) + geom_col()


# 연령대 및 종교 유무에 따른 이혼율 분석하기
# 연령대별 이혼율 표 만들기
ageg_marriage <- welfare %>%
  filter(!is.na(group_marriage)) %>%
  group_by(ageg, group_marriage) %>%
  summarise(n = n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n/tot_group*100, 1))

ageg_marriage


# count() 활용
ageg_marriage <- welfare %>%
  filter(!is.na(group_marriage)) %>%
  count(ageg, group_marriage) %>%
  group_by(ageg) %>%
  mutate(pct = round(n/sum(n)*100, 1))


# 연령대별 이혼율 그래프 만들기
# 초년 제외, 이혼 추출
ageg_divorce <- ageg_marriage %>%
  filter(ageg != "young" & group_marriage == "divorce") %>%
  select(ageg, pct)

ageg_divorce

# 그래프 출력
ggplot(data = ageg_divorce, aes(x = ageg, y = pct)) + geom_col()


# 연령대 및 종교 유무에 따른 이혼율 표 만들기
# 연령대, 종교유무, 결혼상태별 비율표 만들기
ageg_religion_marriage <- welfare %>%
  filter(!is.na(group_marriage) & ageg != "young") %>%
  group_by(ageg, religion, group_marriage) %>%
  summarise(n = n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n/tot_group*100, 1))

ageg_religion_marriage


# count() 활용
ageg_religion_marriage <- welfare %>%
  filter(!is.na(group_marriage) & ageg != "young") %>%
  count(ageg, religion, group_marriage) %>%
  group_by(ageg, religion) %>%
  mutate(pct = round(n/sum(n)*100, 1))

# 연령대 및 종교 유무별 이혼율 표 만들기
df_divorce <- ageg_religion_marriage %>%
  filter(group_marriage == "divorce") %>%
  select(ageg, religion, pct)

df_divorce

# 연령대 및 종교 유무에 따른 이혼율 그래프 만들기
ggplot(data = df_divorce, aes(x = ageg, y = pct, fill = religion )) +
  geom_col(position = "dodge")




# Project-Part8
# 지역별 연령대 비율
# 1단계 : 변수 검토 및 전처리 - 지역, 연령대
# 2단계 : 변수 간 관계 분석 - 지역별 연령대 비율표, 그래프
# 지역 변수 검토 및 전처리
# 변수 검토하기
class(welfare$code_region)

table(welfare$code_region)

# 전처리
# 지역 코드 목록 만들기
list_region <- data.frame(code_region = c(1:7),
                          region = c("서울",
                                     "수도권(인천/경기)",
                                     "부산/경남/울산",
                                     "대구/경북",
                                     "대전/충남",
                                     "강원/충북",
                                     "광주/전남/전북/제주도"))

list_region

# welfare에 지역명 변수 추가
welfare <- left_join(welfare, list_region, id = "code_region")

welfare %>%
  select(code_region, region) %>%
  head


#지역별 연령대 비율 분석하기
# 지역별 연령대 비율표 만들기
region_ageg <- welfare %>%
  group_by(region, ageg) %>%
  summarise(n = n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n/tot_group*100, 2))

head(region_ageg)


# count() 활용
region_ageg <- welfare %>%
  count(region, ageg) %>%
  group_by(region) %>%
  mutate(pct = round(n/sum(n)*100, 2))


# 그래프 출력
ggplot(data = region_ageg, aes(x = region, y = pct, fill = ageg)) +
  geom_col() +
  coord_flip()


# 막대 정렬하기 - 노년층 비율 높은 순
# 노년층 비율 내림차순 정렬
list_order_old <- region_ageg %>%
  filter(ageg == "old") %>%
  arrange(pct)

list_order_old


# 지역명 순서 변수 만들기
order <- list_order_old$region

order

# 노년층이 많은 순서로 그래프 정렬
ggplot(data = region_ageg, aes(x = region,  y = pct, fill = ageg)) +
  geom_col() +
  coord_flip() +
  scale_x_discrete(limits = order)


# 연령대 순으로 막대 색깔 나열하기
class(region_ageg$ageg)

levels(region_ageg$ageg)

region_ageg$ageg <- factor(region_ageg$ageg,
                           level = c("old", "middle", "young"))
class(region_ageg$ageg)

levels(region_ageg$ageg)

ggplot(data = region_ageg, aes(x = region,  y = pct, fill = ageg)) +
  geom_col() +
  coord_flip() +
  scale_x_discrete(limits = order)
