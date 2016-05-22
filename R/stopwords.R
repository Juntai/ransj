#' Insert stopwords.
#' @description Insert stopwords from a character vector.
#' @param stopwords A character vector.
#' @return No results.
#' @seealso \code{\link{showStopWords}},\code{\link{clearStopWords}}
#' @examples
#' \dontrun{
#' insertStopwords(c("of", "at"))
#' showStopwords()
#' clearStopwords()
#' }

insertStopwords = function(stopwords){
  stopwords = .jarray(stopwords)
  tryout = try(.jcall("org/jtansj/util/Filter","V","insertStopWords", stopwords), silent = TRUE)
  if (inherits(tryout, "try-error")){
    warning(paste("Fail to insert stopwords:\n",
                  as.character(tryout)))
  }
}

#' Clear up stopwords.
#' @description Clear up stopwords.
#' @return No results.
#' @seealso \code{\link{insertStopwords}},\code{\link{showStopwords}}
#' @examples
#' \dontrun{
#' insertStopwords(c("of", "at"))
#' showStopwords()
#' clearStopwords()
#' showStopwords()
#' }

clearStopwords = function(){
  tryout = try(.jcall("org/jtansj/util/Filter","V","clearStopWords"), silent = TRUE)
  if (inherits(tryout, "try-error")){
    warning(paste("Fail to clear up stopwords:\n",
                  as.character(tryout)))
  }
}

#' Show stopwords.
#' @description Show stopwords.
#' @return A character vector or character(0). Stopwords has been inserted.
#' @seealso \code{\link{insertStopwords}},\code{\link{clearStopwords}}
#' @examples
#' \dontrun{
#' insertStopwords(c("of", "at"))
#' showStopwords()
#' }

showStopwords = function(){
  tryout = try(.jcall("org/jtansj/util/Filter","[S","showStopWords"), silent = TRUE)
  if (inherits(tryout, "try-error")){
    warning(paste("Fail to clear up stopwords:\n",
                  as.character(tryout)))
  }else{
    return(tryout)
  }
}

#' Whether stopwords is empty
#' @description Whether stopwords is empty.
#' @return logical. Whether stopwords is empty.
#' @seealso \code{\link{insertStopwords}},\code{\link{clearStopwords}},\code{\link{showStopwords}}
#' @examples
#' \dontrun{
#' stopwordsIsEmpty()
#' insertStopwords(c("of", "at"))
#' stopwordsIsEmpty()
#' }

stopwordsIsEmpty = function(){
    return(.jcall("org/jtansj/util/Filter", "Z", "stopWordsIsEmpty"))
}


