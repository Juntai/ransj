.onLoad = function(libname, pkgname){
  .jpackage(pkgname, lib.loc=libname)
  # Set three options of segmentation
  ransj.options(isNameRec = TRUE)
  ransj.options(isNumRec = TRUE)
  ransj.options(isQuantifierRec = TRUE)

  # Set dictionary library
  dict.path = system.file("library", package = pkgname)
  .jcall("",)



}
