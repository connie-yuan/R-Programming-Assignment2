# Assign2
## Matrix inversion is usually a costly computation and there
## may be some benefit to caching the inverse of a matrix rather
## than compute it repeatedly (there are also alternatives to
## matrix inversion that we will not discuss here). Your assignment
## is to write a pair of functions that cache the inverse of a matrix.

#  Note: the double arrow "<<-" operator can modify variables in parent levels.
## This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    get <- function() x
    setinverse <- function(solve) m <<- solve
    getinverse <- function() m
    list(get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}
y<-makeCacheMatrix(x)


## This function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix above. If the inverse has already been calculated (and the 
## matrix has not changed), then the cachesolve should retrieve the inverse 
## from the cache.

cacheSolve <- function(x, ...) {
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
}
