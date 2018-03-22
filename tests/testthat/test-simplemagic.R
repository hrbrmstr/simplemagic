context("File types are recognized properly")
test_that("Basic file tests work", {

  c("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
"application/java-vm", "application/java-vm", "application/java-vm",
"application/java-vm", "audio/mp3", "application/msword", "application/xml",
"message/rfc822", "application/zip", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
"image/tiff", "application/zip", "application/vnd.openxmlformats-officedocument.presentationml.presentation",
"application/msword", "application/msword", "application/zip",
"application/vnd.openxmlformats-officedocument.wordprocessingml.document",
"audio/basic", "application/mac-binary", "application/macbinary",
"application/octet-stream", "application/x-binary", "application/x-macbinary",
"image/bmp", "application/xml-dtd", "application/x-msmetafile",
"application/postscript", "video/flc", "video/fli", "video/x-fli",
"image/gif", "image/x-icon", "text/plain", "text/x-java", "text/x-java-source",
"image/jpeg", "audio/mp3", "application/vnd.oasis.opendocument.text",
"application/ogg", "audio/ogg", "image/pcx", "image/x-pcx", "application/pdf",
"text/plain", "text/x-perl", "text/x-script.perl", "image/png",
"application/x-portable-anymap", "image/x-portable-anymap", "image/x-portable-pixmap",
"application/msword", "application/postscript", "image/photoshop",
"text/x-python", "text/x-script.phyton", "application/rtf", "application/x-rtf",
"text/richtext", "text/rtf", "application/x-bsh", "application/x-sh",
"application/x-shar", "text/x-script.sh", "text/x-sh", "application/pax",
"application/octet-stream", "application/x-compressed", "application/x-gzip",
"image/x-tga", "text/plain", "application/octet-stream", "application/x-compressed",
"application/x-gzip", "audio/x-wav", "application/x-msmetafile",
"windows/metafile", "application/x-xcf", "application/xml", "image/x-xbitmap",
"image/x-xpixmap", "image/xpm", "application/zip") -> results


  list.files(system.file("extdat", package="simplemagic"), full.names=TRUE) %>%
    sapply(get_content_type, USE.NAMES = FALSE) %>%
    unlist() -> tst

  all(tst == results)

})
