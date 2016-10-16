.onAttach <- function(libname, pkgname) {
    # Runs when attached to search() path such as by library() or require()
    if (interactive()) {
        pdesc <- packageDescription(pkgname)
        packageStartupMessage('')
        packageStartupMessage(pdesc$Package, " ", pdesc$Version, " by Vincent Guyader")
        packageStartupMessage('->  For help type ?spongecake')
        packageStartupMessage('be sure to have ffmpeg on your computer (http://ffmpeg.org)')
        packageStartupMessage('')
    }

  options(ffmpeg = "ffmpeg")
}
