dist <- function(x, method, diag, upper, p) {
  # Validate distance method
  if (!(method %in% c("euclidean", "maximum", "manhattan",
                    "canberra", "binary", "minkowski"))) {
    stop("invalid distance_method")
  }
  
  # Assign input matrix
  x <- as.matrix(x)
  if (!is.numeric(x)) {
    stop("x was not coerced to numeric")
  }
  n <- nrow(x)
  row_names <- rownames(x)
  x <- t(x) # Transpose for column-major operations
  print("x=")
  print(x)
  
  # Calculate distance
  calc_dist <- function(x, method) {
    dist_matrix <- matrix(0, nrow = n, ncol = n)
    print("dist_matrix=")
    print(dist_matrix)
    
    # Compare all rows to each other
    for (i in 1:(n - 1)) {
      cat("Filling row", i, "of dist matrix:\n")
      min_row <- i + 1
      cat("min_row =", min_row, "\n")
      cat("min_row:n=", min_row:n, "\n")
      for (j in min_row:n) {
        cat("Compare row", i, "to row", j, "\n")
        cat("Row i = ", i, "is", x[, i], "\n")
        cat("Row j = ", j, "is", x[, j], "\n")
        
        # Calculate distance between two rows
        a <- x[, i]
        b <- x[, j]
        dist_row <- vector(mode = "numeric", length = length(a))
        if (method == "euclidean") {
          dist_row <- a - b
          print(dist_row)
          dist_row <- dist_row^2
          print(dist_row)
          dist_row <- sum(dist_row)
          print(dist_row)
          dist_row <- sqrt(dist_row)
          print(dist_row)
        }
        else if (method == "maximum") {
          # TODO: implement
        }
        else if (method == "manhattan") {
          # TODO: implement
        }
        else if (method == "canberra") {
          # TODO: implement
        }
        else if (method == "binary") {
          # TODO: implement
        }
        else {
          # TODO: implement
        }
        
        # Assign values to dist_matrix
        # so that it is square and symmetric
        dist_matrix[i, j] <- dist_row
        dist_matrix[j, i] <- dist_row
      }
    }
    return(dist_matrix)
  }
  
  dist_matrix <- calc_dist(x, method)
  rownames(dist_matrix) <- row_names
  print(dist_matrix)
  dist_matrix <- as.dist(dist_matrix)
  return(dist_matrix)
}

# Test the function
a <- c(2, 4, 4, 6)
b <- c(5, 5, 7, 8)
c <- c(9, 9, 9, 8)
d <- c(1, 2, 3, 3)

mat <- rbind(a, b, c, d)

mat

stats::dist(mat, method="euclidean")
dist(mat, method="euclidean")

library(microbenchmark)
library(ggplot2)
bm_results <- microbenchmark(
  stats::dist(mat, method="euclidean"),
  dist(mat, method="euclidean"),
  times = 100
)
autoplot(bm_results)
