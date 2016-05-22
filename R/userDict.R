#' Load user defined dictionary
#'
#' @description   Load user defined dictionary by dictionary path.
#'
#' @param path charater, file path of the dictionary, or folder path to load all
#' the .dic files. The suffix of the dictionary should be ".dic". There should be
#' only one word per line. Every line should be formated like "Word\tabPOS\tabFrequency".
#'
#' @return No results.
#' @examples
#' \dontrun{
#' dic.path = system.file("library/default.dic", package = "ransj")
#' loadDict(dic.path)
#' }

loadDict = function(path){
  .jcall("org/jtansj/util/UserLibrary","V","set",path)
  tryout = try(.jcall("org/jtansj/util/UserLibrary","V","load"), silent = TRUE)
  if (inherits(tryout, "try-error")){
    warning(paste("Fail to load the user defined dictionary:\n", as.character(tryout)))
  }
}

#' Clear up user defined dictionary
#'
#' @description  Clear up user defined dictionary.
#'
#' @examples
#' \dontrun{
#' clearDict()
#' }
#'
clearDict = function(){
  tryout = try(.jcall("org/jtansj/util/UserLibrary","V","clear"), silent = TRUE)
  if (inherits(tryout, "try-error")){
    warning(paste("Fail to clear up the user defined dictionary:\n", as.character(tryout)))
  }
}
