#' Lightweight File 'MIME' Type Detection Based On Contents or Extension
#'
#' Provides a more portable/ligtweight alternative to the `wand` package.
#'
#' @section Some important details:
#'
#' The header checking is minimal (i.e. nowhere near as comprehensive as `libmagic`) but
#' covers quite a bit of ground. If there are content-check types from
#' [`magic sources`](https://github.com/threatstack/libmagic/tree/master/magic/)
#' that you would like coded into the package, please file an issue and
#' _include the full line(s)_ from that linked `magic.tab` that you would like mapped.
#'
#' @md
#' @name simplemagic
#' @docType package
#' @author Bob Rudis (bob@@rud.is)
#' @importFrom tools file_ext
NULL
