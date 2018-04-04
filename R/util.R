# seq_in <- function(source_vector, pattern_vector) {
#
#   which(
#     Reduce(
#       '+',
#       lapply(
#         seq_along(y <- lapply(pattern_vector, '==', source_vector)),
#         function(x) {
#           y[[x]][x:(length(source_vector) - length(pattern_vector) + x)]
#         }
#       )
#     ) == length(pattern_vector)
#   )
#
# }

# #ty @yeedle!
seq_in <- function(haystack, needle) {
  index <- seq_along(haystack)
  for (i in seq_along(needle)) {
    pile <- haystack[index]
    index <- index[pile==needle[i]] + 1L
  }
  (index-length(needle))[1]
}