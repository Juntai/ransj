% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stopwords.R
\name{stopwordsIsEmpty}
\alias{stopwordsIsEmpty}
\title{Whether stopwords is empty}
\usage{
stopwordsIsEmpty()
}
\value{
logical. Whether stopwords is empty.
}
\description{
Whether stopwords is empty.
}
\examples{
\dontrun{
stopwordsIsEmpty()
insertStopwords(c("of", "at"))
stopwordsIsEmpty()
}
}
\seealso{
\code{\link{insertStopwords}},\code{\link{clearStopwords}},\code{\link{showStopwords}}
}

