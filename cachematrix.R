## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## makeCacheMatrix is a function that holds a list of functions to set and get the value of the matrix and set and get inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  solvedMatrix <- NULL
  set <- function(y) {
    x <<- y
    solvedMatrix <<- NULL
  }
  
  get <- function() x
  
  setSolveMatrix <- function(solve) solvedMatrix <<- solve
  
  getSolveMatrix <- function() solvedMatrix
  
  list(set = set, get = get,
       setSolveMatrix = setSolveMatrix,
       getSolveMatrix = getSolveMatrix)
}


## Write a short comment describing this function
## function for getting Inverse of an matrix created by a makeCacheMatrix function. In first run it calculates the inverse of matrix, then in next calls it returns cached result.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  solvedMatrix <- x$getSolveMatrix()
  if(!is.null(solvedMatrix)) {
    message("getting cached data")
    return(solvedMatrix)
  }
  data <- x$get()
  solvedMatrix <- solve(data, ...)
  x$setSolveMatrix(solvedMatrix)
  solvedMatrix
}
