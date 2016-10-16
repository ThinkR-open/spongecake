.onAttach <- function(libname, pkgname) {
    # Runs when attached to search() path such as by library() or require()
    if (interactive()) {
        pdesc <- packageDescription(pkgname)
        packageStartupMessage('')
        packageStartupMessage(pdesc$Package, " ", pdesc$Version, " by Vincent Guyader")
        packageStartupMessage('->  For help type ?spongecake')
        packageStartupMessage('')
    }
  # oopts = if (.Platform$OS.type == "windows" & .Platform$r_arch == "x64") {
  #
  #   # options(ffmpeg = "D:/ThinkR/spongecake/inst/ffmpeg-3.1.4-win64-static/bin/ffmpeg.exe")
  #   options(ffmpeg = file.path( find.package("spongecake"), "ffmpeg-3.1.4-win64-static/bin/ffmpeg.exe" ))
  #
  #
  #
  #     } else{    options(ffmpeg = "ffmpeg")}
  options(ffmpeg = "ffmpeg")
}

# enleve les faux positifs du check
# globalVariables(c("code", "type_code", "effect", ".",
#                   "caract", "caract_1", "caract_2",
#                   "nom", "ID_caract", "ID",
#                   "Code.LPP",
#                   "Libelle",
#                   "nb",
#                   "UCD.7",
#                   "Libelle",
#                   "nb",
#                   "effect",
#                   "Y",
#                   "xml_code"
#                   ))
