# spongecake


## Installation


```R
# from CRAN
install.packages("spongecake")


# from Github
if (!require(devtools)){install.packages("devtools")}
devtools::install_github("ThinkRstat/spongecake")
```


## Usage
```R
library(spongecake)
library(magrittr)
#options(ffmpeg = "C:/ffmpeg-3.1.4-win64-static/bin/ffmpeg.exe") # windows user
library(magrittr)
gen_screenshot(movie = "D:/mymovie.avi") %>%
draw()
```


totally inspired from <http://thecolorsofmotion.com/films>
