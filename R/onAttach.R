#' @title .onAttach
#' @importFrom utils packageDescription
.onAttach <- function(libname, pkgname) {
    # Runs when attached to search() path such as by library() or require()
    if (interactive()) {
        pdesc <- packageDescription(pkgname)
        packageStartupMessage('')
        packageStartupMessage(pdesc$Package, " ", pdesc$Version, " by Vincent Guyader")
        packageStartupMessage('->  For help type ?spongecake')

        packageStartupMessage('')
    }

  if ( (p <-Sys.which('ffmpeg'))!=""){options(ffmpeg = p)
    }


  # if (inherits(version, 'try-error')) {
  if (is.null(getOption('ffmpeg')) || getOption('ffmpeg')=="") {
    packageStartupMessage('The command "',
                          ifelse(
                            is.null(getOption('ffmpeg')) || getOption('ffmpeg')=="" ,
                            "ffmpeg",
                            getOption('ffmpeg')
                          )


                          ,'" is not available in your system. Please install FFmpeg first\n more information at : \n',
            ifelse(.Platform$OS.type == 'windows', 'https://ffmpeg.zeranoe.com/builds/',
                   'http://ffmpeg.org/download.html'))
    packageStartupMessage('if you already have installed ffmpeg use this instruction to manualy edit the path to ffmpeg :')
    packageStartupMessage(ifelse(.Platform$OS.type == 'windows', ' options(ffmpeg = "C:/path/to/bin/ffmpeg.exe")',
                                 'options(ffmpeg = "path/to/ffmpeg")'))
  }else{

    packageStartupMessage('ffmpeg found at ',getOption('ffmpeg'),' but you can edit it with :')
    packageStartupMessage(ifelse(.Platform$OS.type == 'windows', ' options(ffmpeg = "C:/path/to/bin/ffmpeg.exe")',
                                 'options(ffmpeg = "path/to/ffmpeg")'))
  }




}


globalVariables(".")
