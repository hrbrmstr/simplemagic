seq_in <- function(a, b) {

  which(
    Reduce(
      '+',
      lapply(
        seq_along(y <- lapply(b, '==', a)),
        function(x) { y[[x]][x:(length(a) - length(b) +x)] }
      )
    ) == length(b)
  )

}
