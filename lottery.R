library(httr)
library(rvest)

url = 'https://www.dhlottery.co.kr/gameResult.do?method=byWin'

num = seq(1114,1124)


data_lotto = POST(
  url, 
  body = list(
    drwNo = "1124",
    dwrNoList = "1124"
  )
)

data_lotto_html = data_lotto %>% read_html()

data_lotto_html %>%
  html_nodes('.num.win') %>%
  html_text()

library(stringr)

data_lotto_html %>%
  html_nodes('.num.win') %>%
  html_text() %>%
  str_extract_all('\\d+') %>%
  unlist()