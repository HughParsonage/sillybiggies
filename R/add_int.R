#' Add integer vectors
#'
#' @name add_int
#'
#' @param X,Y Integer vectors representing the digits of big integers.
#' The first digit is the 1s column, second digit is tens column etc.
#'
#' @return Integer vector representing addition of \code{X} and \code{Y}.
#'
#' @examples
#' add_int(1, 1)
#' add_int(55, 56)
#' add_int(55, add_int(1, 55))
#'
#' @export do_add_int add_int


do_add_int <- function(X, Y) {
  lx <- length(X)
  ly <- length(Y)

  if (lx < ly) {
    return(do_add_int(Y, X))
  }
  O <- integer(lx + 1L)
  ten <- FALSE
  for (i in seq_along(X)) {
    if (i > ly) {
      break
    }
    oi <- X[i] + Y[i] + ten
    ten <- oi >= 10L
    O[i] <- oi - ten * 10L
  }
  if (i > ly) {
    for (j in i:length(X)) {
      oi <- X[j] + ten
      ten <- oi >= 10L
      O[j] <- oi - ten * 10L
    }
  }
  if (ten) {
    O[length(O)] <- 1L
  }

  class(O) <- c("sillybiggy", "integer")

  O
}

add_int <- function(x, y) {
  if (!inherits(x, "sillybiggy")) {
    x <- gsub("[^0-9]", "", deparse(substitute(x)))
    X <- rev(as.integer(strsplit(x, split = "")[[1]]))
  } else {
    X <- x
  }
  if (!inherits(y, "sillybiggy")) {
    y <- gsub("[^0-9]", "", deparse(substitute(y)))
    Y <- rev(as.integer(strsplit(y, split = "")[[1]]))
  } else {
    Y <- y
  }
  do_add_int(X, Y)
}


#' @export
print.sillybiggy <- function(x, ...) {
  X <- rev(as.integer(x))
  fz <- .which_first(X > 0L)
  cat("[1] ")
  if (fz == 0L) {
    cat("0")
  } else {
    for (i in fz:length(X)) {
      cat(X[i])
    }
  }
  cat("\n")
}

.which_first <- function(cond) {
  o <- which.max(cond)
  if (o == 1L && !cond[1L]) {
    return(0L)
  }
  o
}








