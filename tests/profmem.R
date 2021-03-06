library("profmem")

if (capabilities("profmem")) {

  p <- profmem({
    x <- raw(1000)
    A <- matrix(rnorm(100), ncol=10)
  })
  print(p)

  data <- as.data.frame(p)
  print(data)

  t <- total(p)
  print(t)
  stopifnot(t == sum(data$bytes, na.rm=TRUE))


  foo <- function(n) {
    matrix(rnorm(n^2), ncol=n)
  }

  p <- profmem({
    A <- matrix(rnorm(100^2), ncol=100)
    B <- foo(100)
  })
  print(p)

  p2 <- subset(p, bytes > 40000)
  print(p2)

} ## if (capabilities("profmem"))

