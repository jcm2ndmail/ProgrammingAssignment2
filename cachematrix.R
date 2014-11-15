# Example of use
#mat1 <- matrix(1:4, 2,2)                    # Create a matrix and store it in a variable
#m <- makeCacheMatrix(mat1)      # run the first function with the matrix as parameter 
#cacheSolve(m)                                     # run the second function using previous variable as parameter and  get the inverse of the matrix
                                                                      # There is no cache in the first run
#cacheSolve(m)                                     # run the second function again and the inverse is taken from the cache

#  makeCacheMatrix Function

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinv <- function(solve) m <<- solve
        getinv <- function() m
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


## cacheSolve Function

cacheSolve <- function(x, ...) {
        m <- x$getinv()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinv(m)
        m
}
