.onLoad = function(libname, pkgname){
  options(java.parameters = "-Xmx800m")
  # .jpackage(pkgname, lib.loc=libname)
  .jinit()
  dir = system.file("java", package = pkgname)
  jar = list.files(path=dir, pattern = ".jar", full.names=TRUE)
  .jaddClassPath(jar)
  # Set three options of segmentation
  ransj.options(isNameRec = TRUE)
  ransj.options(isNumRec = TRUE)
  ransj.options(isQuantifierRec = TRUE)

  # Set default dictionary
  dict.path = system.file("library/default.dic", package = pkgname)
  .jcall("org/jtansj/util/UserLibrary","V","set", dict.path)
  # Set ambiguity dictionary
  amb.path = system.file("library/ambiguity.dic", package = pkgname)
  .jcall("org/jtansj/util/AmbiguityLibrary","V","set", amb.path)
  # Set CRF model file
  crf.path = system.file("library/crf.model", package = pkgname)
  .jcall("org/jtansj/util/CRFModel","V","set", crf.path)
}


# .onUnload <- function(libpath) {
#   rm(.ransjEnv, envir = .GlobalEnv)
#   library.dynam.unload("ransj", libpath)
# }
