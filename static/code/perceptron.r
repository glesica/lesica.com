perceptron <- function(x, y, w, a, verbose=F) {
  # Uses the Perceptron algorithm to find a weight vector that 
  # satisfies the given data.
  #
  # Args:
  #   x: an m by n matrix representing the data under study
  #   y: objective vector of m elements
  #   w: initial guess for the weight vector, n elements
  #   a: learning rate, should be in (0,1]
  #   verbose: echo information w at each iteration (default: False)
  #
  # Returns:
  #   A satisfying weight vector of n elements.
  hyp <- function(w, x) {
    p <- w %*% x
    sign(p - abs(p)) + 1
  }
  
  iter <- function(x, y, w, a) {
    w + a * (y - hyp(w, x)) * x
  }
  
  wold <- matrix(w, nrow=1)
  nrows <- dim(x)[1]
  done <- FALSE
  iteration <- 0
  
  while (! done) {
    if (verbose) {
      print(paste("Iteration", iteration, sep=" "), quote=F)
      print(wold)
    }
    iteration <- iteration + 1
    count <- 0
    for (i in 1:nrows) {
      wnew = iter(x[i,], y[i], wold, a)
      if (all(wnew == wold)) {
        count <- count + 1
      }
      wold <- wnew
    }
    if (count == nrows) {
      done <- TRUE
    }
  }
  wnew
}

# Example
x <- matrix(c(1, 2, 1, 2, 2, 1, 4, 1, 1, 5, 1, 1), nrow=4, byrow=T)
y <- c(1, 0, 1, 0)
w <- c(0, 2, 1)
a <- 0.5
perceptron(x, y, w, a, verbose=T)