# spongecake


## Installation


```R
if (!require(devtools)){install.packages("devtools")}
devtools::install_github("ThinkRstat/spongecake")
library(spongecake)
library(magrittr)
#options(ffmpeg = "C:/ffmpeg-3.1.4-win64-static/bin/ffmpeg.exe") # windows user
library(magrittr)
gen_screenshot(movie = "D:/mymovie.avi") %>%
draw()
```


totally inspired from <http://thecolorsofmotion.com/films>
