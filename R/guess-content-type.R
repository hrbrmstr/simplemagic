#' Guess MIME type from filename (extension)
#'
#' @details
#' Incorporates standard IANA MIME extension mappings and those from
#' [`servoy-client`](https://github.com/Servoy/servoy-client) and
#' [stevenwdv](https://github.com/stevenwdv)'s
#' [`allMimeTypes.json`](https://s-randomfiles.s3.amazonaws.com/mime/allMimeTypes.json).
#'
#' @md
#' @param path path to file
#' @export
guess_content_type <- function(path) {

  path <- path.expand(path)
  if (!file.exists(path)) stop("File not found.", call.=FALSE)

  extension <- trimws(tolower(tools::file_ext(path)))

  res <- .ext_to_mime[(.ext_to_mime$extension == extension),]$mime_type

  if (length(res) == 0) return("???")

  return(unique(res))

}
