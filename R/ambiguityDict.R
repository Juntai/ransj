#' Load user defined ambiguity dictionary
#'
#' @description   Load user defined ambiguity dictionary by dictionary path.
#'
#' @param path charater, file path of the dictionary. The suffix of the
#' dictionary should be ".dic". There should be only one word per line.
#' Terms in each line should be separated by Tab, such as:
#' \tabular{lcrlcr}{
#' ChineseWords \tab FirstSegmentWord \tab POS \tab SecondSegmentWord \tab POS \tab ... \cr
#' }
#'
#' @return No results.
#' @examples
#' \dontrun{
#' dic.path = system.file("library/ambiguity.dic", package = "ransj")
#' loadAmbiguity(dic.path)
#' }

loadAmbiguity = function(path){
  .jcall("org/jtansj/util/AmbiguityLibrary","V","set",path)
  tryout = try(.jcall("org/jtansj/util/AmbiguityLibrary","V","load"), silent = TRUE)
  if (inherits(tryout, "try-error")){
    warning(paste("Fail to load the user defined ambiguity dictionary:\n",
                  as.character(tryout)))
  }
}

#' Clear up user defined ambiguity dictionary
#'
#' @description  Clear up user defined ambiguity dictionary.
#'
#' @examples
#' \dontrun{
#' clearAmbiguity()
#' }
#'
clearAmbiguity = function(){
  tryout = try(.jcall("org/jtansj/util/AmbiguityLibrary","V","clear"), silent = TRUE)
  if (inherits(tryout, "try-error")){
    warning(paste("Fail to clear up the user defined ambiguity dictionary:\n",
                  as.character(tryout)))
  }
}
