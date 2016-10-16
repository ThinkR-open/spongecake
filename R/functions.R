# -*- coding: utf-8 -*-
#' @encoding UTF-8
#' @title average_color
#' @description return the average color from an image
#' @param img the image (a array)
#' @importFrom grDevices rgb
#' @export


average_color <- function(img) {
  if (is.null(dim(img))) {
    val <- img

  } else {
    val <- colMeans(img, dims = 2)

  }
  list(rgb = val, html = rgb(val[1], val[2], val[3]))
}


# -*- coding: utf-8 -*-
#' @encoding UTF-8
#' @title folder_average_color
#' @description return the average color from all folder's images
#' @param folder the path of the folder
#' @importFrom jpeg readJPEG
#' @importFrom magrittr %>%
#' @export


folder_average_color <- function(folder){

  list.files(folder,pattern = "*.jpeg$",full.names = TRUE) %>%
    # magrittr::extract(1:3) %>%
    lapply(.,FUN=readJPEG) %>%
    lapply(.,FUN=average_color) %>%
    lapply(.,FUN=function(x){x$html}) %>%
    unlist()
}

# -*- coding: utf-8 -*-
#' @encoding UTF-8
#' @title gen_screenshot
#' @description transform a movie into lot of screenshot
#' @param movie the path of the movie
#' @param folder the path of the folder
#' @param every timbe between each screenshot in seconds
#' @examples
#' \dontrun{
#' gen_screenshot(movie = "D:/mymovie.avi") %>%
#' browseURL()
#' }
#' @export


gen_screenshot <- function(movie,folder=tempfile(),every=30,stdout=""){
  try(dir.create(folder))
cat(folder,"\n\n\n")
    td <- paste0(options()$ffmpeg," -i ",movie," -vf fps=1/",every,"  ",folder,"/image-%04d.jpeg")
  td
cat(system.time(system(td,stdout=stdout)))
return(folder)
}



# -*- coding: utf-8 -*-
#' @encoding UTF-8
#' @title draw
#' @description transform a folder of scrennshot into a synthetical picture
#' @param folder the path of the folder
#' @importFrom ggplot2 ggplot aes geom_bar coord_flip theme_void
#' @examples
#' \dontrun{
#' #options(ffmpeg = "C:/ffmpeg-3.1.4-win64-static/bin/ffmpeg.exe") # windows user
#' library(magrittr)
#' gen_screenshot(movie = "D:/mymovie.avi") %>%
#' draw()
#' }
#' @export



draw <- function(folder){
  jj <- folder_average_color(folder)
  data.frame(trt = jj, outcome = rep(1,length(jj))) %>%
    ggplot(., aes(trt, outcome)) +
    geom_bar(stat = "identity", position = "fill",fill=jj,width=1)+
    coord_flip()+ theme_void()
}
