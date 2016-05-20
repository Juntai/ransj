#' Set options of segmentation.
#'
#' Three options can be set to contol the process of the segmentation.
#' \code{isNameRec} means whether to recognize person names. Default is TRUE.
#' \code{isNumRec} means whether to recognize numbers. Default is TRUE.
#' \code{isQuantifierRec} means whether to combine the numbers and the quantifier. Default is TRUE.
#'
#' @param ... \code{isNameRec},\code{isNumRec},\code{isQuantifierRec} can be defined by the way as \code{\link{options}}.
#' @return No results.

segment.options <- function(...) {
  arglist <- list(...)
  arglist <- arglist[nzchar(names(arglist))]
  argnames <- names(arglist)
  if (length(arglist) > 0) {
    for (i in 1:length(arglist)) {
      if (argnames[i] == "isNameRecognition") {
        eval(parse(text = paste("options(", argnames[i], "=", arglist[[i]], ")")))
        if (identical(arglist[[i]], TRUE)) {
          .jcall("org.jtansj.util.AnsjOptions", "V", "setIsNameRec", TRUE)
        } else {
          .jcall("org.jtansj.util.AnsjOptions", "V", "setIsNameRec", FALSE)
        }
      }
      if (argnames[i] == "isNumRecognition") {
        eval(parse(text = paste("options(", argnames[i], "=", arglist[[i]], ")")))
        if (identical(arglist[[i]], TRUE)) {
          .jcall("org.jtansj.util.AnsjOptions", "V", "setIsNumRec", TRUE)
        } else {
          .jcall("org.jtansj.util.AnsjOptions", "V", "setIsNumRec", FALSE)
        }
      }
      if (argnames[i] == "isQuantifierRecognition") {
        eval(parse(text = paste("options(", argnames[i], "=", arglist[[i]], ")")))
        if (identical(arglist[[i]], TRUE)) {
          .jcall("org.jtansj.util.AnsjOptions", "V", "setIsQuantifierRec", TRUE)
        } else {
          .jcall("org.jtansj.util.AnsjOptions", "V", "setIsQuantifierRec", FALSE)
        }
      }
    }
  }
}






