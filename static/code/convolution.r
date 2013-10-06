convolution <- function(A, B) {
  # Computes the convolution of two vectors.
  #
  # Args:
  #   A, B: column vectors representing polynomial coefficients.
  #
  # Returns:
  #   The coefficient vector resulting from multiplying the polynomial 
  #   represented by A by the polynomial represented by B.
  Ap <- c(A, B*0)
  Bp <- c(B, A*0)
  C <- fft(Ap) * fft(Bp)
  D <- round(fft(C, inverse=T))
  E <- as.numeric(D)
  R <- E/(length(A)+length(B))
  return(R)
}

zeroes <- function(Z) {
  if (length(Z) == 1) {
    return(c(1, -Z[1]))
  }
  ml <- length(Z) / 2
  mr <- ml + 1
  A <- zeroes(Z[1:ml])
  B <- zeroes(Z[mr:length(Z)])
  return(convolution(A, B))
}

# Example
A <- c(1,2,3,4)
B <- c(5,6,7,8)
print(convolution(A, B))