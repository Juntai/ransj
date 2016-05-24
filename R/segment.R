#' Segment Chinese sentence into words.
#'
#' @description A wrapper to ansj chinese words segmentation package. This function
#' support all segmentation methods of ansj: NlpAnalysis, ToAnalysis, BaseAnalysis,
#' DicAnalysis, IndexAnalysis, FastIndexAnalysis. More details about these methods
#' refers to https://github.com/NLPchina/ansj_seg
#'
#' @param str A character of chinese sentence to be segmented.
#' @param method A chrarcter to select one segment method from:
#' \itemize{
#'  \item{"nlp": }{NlpAnalysis of ansj. The Most Accurate segment method in ansj. User can define dictionary.
#' Numbers, person names, organition names and new words recognition
#' are supported in the method.}
#'  \item{"dic": }{DicAnalysis of ansj. User defined dictionary will have a higher priority.}
#'  \item{"base":}{BaseAnalysis of ansj.Sentences will be segment into very short words.
#' User defined Dictionary will not be used by this method. Numbers recognition is
#' included in this method. Person names, organization names and new words
#' recognition are not supported in this method.}
#'  \item{"to": }{ToAnalysis of ansj. More accurate than "base" method. User defined
#' dictionary will be used by the method. Numbers and person names recognition is
#' included in this method. Organization names and new words
#' recognition are not supported in this method.}
#'  \item{"index": }{IndexAnalysis of ansj. This method aims at producing search index.}
#'  \item{"fastIndex": }{FastIndexAnalysis of ansj. Faster than "index" method.}
#' }
#' @param nature logical. Whether to tag the POS. Default = FALSE.
#' @param stopwords logical. Whether to remove stopwords from the result.
#' Default = FALSE. Use \code{\link{insertStopwords}} first before you set
#' parameter \code{stopwords=TRUE}
#' @param naturesInclude Character vector. The natures to be take back from the result.
#' Default = NULL.
#' @param naturesRemove Character vector. The natures to be removed from the result.
#' Default = NULL.Note that if naturesInclude and naturesRemove are both not null,
#' naturesRemove will be ignored.
#' @param nosymbol logical. Whether to keep symbols in the result. Default = TRUE.
#' @param returnType A character from \code{c("vector", "tm")}. "vector" means
#' that the result returned will be a vector containing the words. "tm" means
#' that the result returned will be a character in which each word is separated
#' by space.
#'
#'@return A character or character vector depends on the parameter returnType.
#'
segment = function(str, method="nlp", nature=FALSE, stopwords=FALSE,
                   naturesInclude=NULL, naturesRemove=NULL, nosymbol=TRUE, returnType="tm"){
  methods = c("nlp","dic","base","to","index","fastIndex")
  if(!(method %in% methods)){
    stop("Parameter method must be one of :", paste(methods,sep=","), "!")
  }
  # method = .jnew("java/lang/String", method)
  # str = .jnew("java/lang/String", str)
  if(stopwords && stopwordsIsEmpty()){
    warning("Stopwords is empty. Please use insertStopwords() to insert stopwords!")
    stopwords=FALSE
  }
  if(is.null(naturesInclude)){
    naturesInclude = .jarray(character(0))
  }else{
    naturesInclude = .jarray(naturesInclude)
  }
  if(is.null(naturesRemove)){
    naturesRemove = .jarray(character(0))
  }else{
    naturesRemove = .jarray(naturesRemove)
  }
  # get rawresult from ansj
  rawResult = try(.jcall("org.jtansj.analysis.JtAnalysis","[S","parse", str,
                         method, stopwords, naturesInclude, naturesRemove),
                  silent = TRUE)
  # rawResult = J("org.jtansj.analysis.JtAnalysis")$parse(str,method, stopwords,
  #                                                       naturesInclude,
  #                                                       naturesRemove)
  if (inherits(rawResult, "try-error")){
    stop(paste("Fail to segment the sentence:\n", as.character(rawResult)))
  }
  #

  words = sapply(rawResult, function(x) strsplit(x,split="/")[[1]][1])
  pos = sapply(rawResult, function(x) strsplit(x,split="/")[[1]][2])
  isSymbol = grepl("^[^\u4e00-\u9fa5a-zA-Z0-9]+$", words) # non-words
  if(nosymbol){
    words = words[!isSymbol]
    pos = pos[!isSymbol]
    if(returnType == "vector"){
      if(nature){
        names(words) = pos
        return(words)
      }else{
        names(words) = NULL
        return(words)
      }
    }else{
      if(nature){
        result = paste(words, pos, sep="/", collapse = " ")
        return(result)
      }else{
        words = paste0(words,collapse = " ")
        return(words)
      }
    }
  }else{
    if(returnType == "vector"){
      if(nature){
        names(words) = pos
        return(words)
      }else{
        names(words) = NULL
        return(words)
      }
    }else{
      if(nature){
        result = paste(words, pos, sep="/", collapse = " ")
        return(result)
      }else{
        words = paste0(words,collapse = " ")
        return(words)
      }
    }
  }
}
