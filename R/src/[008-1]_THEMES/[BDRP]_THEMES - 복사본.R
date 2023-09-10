# 테마 종류
# theme_base
# theme_calc
# theme_economist
# theme_excel
# theme_few
# theme_fivethirtyeight
# theme_gdocs
# theme_hc
# theme_par
# theme_pander
# theme_solarized
# theme_stata
# theme_tufte
# theme_wsj





# 필요 패키지 호출
library("ggplot2")
library("ggthemes")
library("scales")






# 작업 디덱토리 설정
getwd()
setwd("~/[008-1]_THEMES")
getwd()

# 데이터 읽어오기
DF <- read.csv("data/PII.csv")



# 객체에 지정 ####
p1 <- ggplot(DF, aes(x = Height, y = Weight, colour = BloodType)) +
  geom_point(size = 5) +
  ggtitle("Slam Dunk 101")






# Economist theme ####
p1 + theme_economist() + scale_colour_economist() +
  scale_y_continuous(position = "right")







# Solarized theme ####
p1 + theme_solarized() +
  scale_colour_solarized("blue")

p1 + theme_solarized(light = FALSE) +
  scale_colour_solarized("red")

p1 + theme_solarized_2(light = FALSE) +
  scale_colour_solarized("blue")

# Stata theme ####
p1 + theme_stata() + scale_colour_stata()








# Excel 2003 theme ####
p1 + theme_excel() + scale_colour_excel()

ggplot(diamonds, aes(x = clarity, fill = cut)) +
  geom_bar() +
  scale_fill_excel() +
  theme_excel()



# Pander Theme ####
p1 + theme_pander() + scale_colour_pander()

ggplot(diamonds, aes(x = clarity, fill = cut)) +
  geom_bar() +
  theme_pander() +
  scale_fill_pander()



# Paul Tol Scales ####
p1 + geom_smooth(method = "lm", se = FALSE) +
  scale_color_ptol() +
  theme_minimal()

ggplot(diamonds, aes(x = clarity, fill = cut)) +
  geom_bar() +
  scale_fill_ptol() +
  theme_minimal()

# Fivethirtyeight theme ####
p1 + geom_smooth(method = "lm", se = FALSE) +
  theme_fivethirtyeight()







# Tableau Scales ####
p1 + theme_igray() + scale_colour_tableau()

p1 + theme_igray() + scale_colour_tableau("colorblind10")






# Inverse Gray Theme ####
p1 + theme_igray()








# Stephen Few's Practical Rules for Using Color ####
p1 + theme_few() + scale_colour_few()








# Wall Street Journal ####
p1 + theme_wsj() + scale_colour_wsj("colors6", "")








# Base and Par Themes ####
p1 + theme_base()








# Par theme ####
par(fg = "blue", bg = "gray", col.lab = "red", font.lab = 3)
p1 + theme_par()







# GDocs Theme ####
p1 + theme_gdocs() + scale_color_gdocs()








# Calc Theme ####
p1 + theme_calc() + scale_color_calc()








# Highcharts theme ####
p1 + theme_hc() + scale_colour_hc()

p1 + theme_hc(bgcolor = "darkunica") +
  scale_colour_hc("darkunica")





# etc ####
dtemp <- data.frame(months = factor(rep(substr(month.name,1,3), 4), levels = substr(month.name,1,3)),
                    city = rep(c("Tokyo", "New York", "Berlin", "London"), each = 12),
                    temp = c(7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6,
                             -0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5,
                             -0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0,
                             3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8))

ggplot(dtemp, aes(x = months, y = temp, group = city, color = city)) +
  geom_line() +
  geom_point(size = 2) + 
  ggtitle("Monthly Average Temperature") +
  theme_hc() +
  scale_colour_hc()

ggplot(dtemp, aes(x = months, y = temp, group = city, color = city)) +
  geom_line() + 
  geom_point(size = 3) + 
  ggtitle("Monthly Average Temperature") +
  theme_hc(bgcolor = "darkunica") +
  scale_fill_hc("darkunica")









# Maps theme ####
library("maps")

us <- fortify(map_data("state"), region = "region")

ggplot() +
  geom_map(data  =  us, map = us,
           aes(x = long, y = lat, map_id = region, group = group),
           fill = "skyblue", color = "black", size = 0.25) +
  coord_map("albers", lat0 = 39, lat1 = 45) +
  theme_map()


