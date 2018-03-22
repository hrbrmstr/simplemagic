
# simplemagic

Lightweight File ‘MIME’ Type Detection Based On Contents or Extension

## Description

‘MIME’ types are shorthand descriptors for file contents and can be
determined from “magic” bytes in file headers, file contents or intuited
from file extensions. Tools are provided to perform limited “magic”
tests as well as mapping ‘MIME’ types from a database of over 1,500
extension mappings.

Provides a more portable/ligtweight alternative to the `wand` package.

## SOME IMPORTANT DETAILS

The header checking is minimal (i.e. nowhere near as comprehensive as
`libmagic`) but covers quite a bit of ground. If there are content-check
types from [`magic
sources`](https://github.com/threatstack/libmagic/tree/master/magic/)
that you would like coded into the package, please file an issue and
*include the full line(s)* from that linked `magic.tab` that you would
like mapped.

## What’s Inside The Tin

  - `get_content_type`: Discover MIME type of a file based on contents
  - `guess_content_type`: Guess MIME type from filename (extension)
  - `simplemagic_mime_db`: File extension-to-MIME mapping data frame

The following functions are implemented:

## Installation

``` r
devtools::install_github("hrbrmstr/simplemagic")
```

## Usage

``` r
library(simplemagic)
library(tidyverse)

# current verison
packageVersion("simplemagic")
```

    ## [1] '0.1.0'

``` r
list.files(system.file("extdat", package="simplemagic"), full.names=TRUE) %>% 
  map_df(~{
    data_frame(
      fil = basename(.x),
      mime = list(get_content_type(.x))
    )
  }) %>% 
  unnest() %>% 
  print(n=82)
```

    ## # A tibble: 82 x 2
    ##    fil                        mime                                                                     
    ##    <chr>                      <chr>                                                                    
    ##  1 test_1.2.class             application/java-vm                                                      
    ##  2 test_1.3.class             application/java-vm                                                      
    ##  3 test_1.4.class             application/java-vm                                                      
    ##  4 test_1.5.class             application/java-vm                                                      
    ##  5 test_128_44_jstereo.mp3    audio/mp3                                                                
    ##  6 test_excel_2000.xls        application/msword                                                       
    ##  7 test_excel_spreadsheet.xml application/xml                                                          
    ##  8 test_excel_web_archive.mht message/rfc822                                                           
    ##  9 test_excel.xlsm            application/zip                                                          
    ## 10 test_excel.xlsx            application/vnd.openxmlformats-officedocument.spreadsheetml.sheet        
    ## 11 test_nocompress.tif        image/tiff                                                               
    ## 12 test_powerpoint.pptm       application/zip                                                          
    ## 13 test_powerpoint.pptx       application/vnd.openxmlformats-officedocument.presentationml.presentation
    ## 14 test_word_2000.doc         application/msword                                                       
    ## 15 test_word_6.0_95.doc       application/msword                                                       
    ## 16 test_word.docm             application/zip                                                          
    ## 17 test_word.docx             application/vnd.openxmlformats-officedocument.wordprocessingml.document  
    ## 18 test.au                    audio/basic                                                              
    ## 19 test.bin                   application/mac-binary                                                   
    ## 20 test.bin                   application/macbinary                                                    
    ## 21 test.bin                   application/octet-stream                                                 
    ## 22 test.bin                   application/x-binary                                                     
    ## 23 test.bin                   application/x-macbinary                                                  
    ## 24 test.bmp                   image/bmp                                                                
    ## 25 test.dtd                   application/xml-dtd                                                      
    ## 26 test.emf                   application/x-msmetafile                                                 
    ## 27 test.eps                   application/postscript                                                   
    ## 28 test.fli                   video/flc                                                                
    ## 29 test.fli                   video/fli                                                                
    ## 30 test.fli                   video/x-fli                                                              
    ## 31 test.gif                   image/gif                                                                
    ## 32 test.ico                   image/x-icon                                                             
    ## 33 test.java                  text/plain                                                               
    ## 34 test.java                  text/x-java                                                              
    ## 35 test.java                  text/x-java-source                                                       
    ## 36 test.jpg                   image/jpeg                                                               
    ## 37 test.mp3                   audio/mp3                                                                
    ## 38 test.odt                   application/vnd.oasis.opendocument.text                                  
    ## 39 test.ogg                   application/ogg                                                          
    ## 40 test.ogg                   audio/ogg                                                                
    ## 41 test.pcx                   image/pcx                                                                
    ## 42 test.pcx                   image/x-pcx                                                              
    ## 43 test.pdf                   application/pdf                                                          
    ## 44 test.pl                    text/plain                                                               
    ## 45 test.pl                    text/x-perl                                                              
    ## 46 test.pl                    text/x-script.perl                                                       
    ## 47 test.png                   image/png                                                                
    ## 48 test.pnm                   application/x-portable-anymap                                            
    ## 49 test.pnm                   image/x-portable-anymap                                                  
    ## 50 test.ppm                   image/x-portable-pixmap                                                  
    ## 51 test.ppt                   application/msword                                                       
    ## 52 test.ps                    application/postscript                                                   
    ## 53 test.psd                   image/photoshop                                                          
    ## 54 test.py                    text/x-python                                                            
    ## 55 test.py                    text/x-script.phyton                                                     
    ## 56 test.rtf                   application/rtf                                                          
    ## 57 test.rtf                   application/x-rtf                                                        
    ## 58 test.rtf                   text/richtext                                                            
    ## 59 test.rtf                   text/rtf                                                                 
    ## 60 test.sh                    application/x-bsh                                                        
    ## 61 test.sh                    application/x-sh                                                         
    ## 62 test.sh                    application/x-shar                                                       
    ## 63 test.sh                    text/x-script.sh                                                         
    ## 64 test.sh                    text/x-sh                                                                
    ## 65 test.tar                   application/pax                                                          
    ## 66 test.tar.gz                application/octet-stream                                                 
    ## 67 test.tar.gz                application/x-compressed                                                 
    ## 68 test.tar.gz                application/x-gzip                                                       
    ## 69 test.tga                   image/x-tga                                                              
    ## 70 test.txt                   text/plain                                                               
    ## 71 test.txt.gz                application/octet-stream                                                 
    ## 72 test.txt.gz                application/x-compressed                                                 
    ## 73 test.txt.gz                application/x-gzip                                                       
    ## 74 test.wav                   audio/x-wav                                                              
    ## 75 test.wmf                   application/x-msmetafile                                                 
    ## 76 test.wmf                   windows/metafile                                                         
    ## 77 test.xcf                   application/x-xcf                                                        
    ## 78 test.xml                   application/xml                                                          
    ## 79 test.xpm                   image/x-xbitmap                                                          
    ## 80 test.xpm                   image/x-xpixmap                                                          
    ## 81 test.xpm                   image/xpm                                                                
    ## 82 test.zip                   application/zip
