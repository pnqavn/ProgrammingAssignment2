## Put comments here that give an overall description of what your
## functions do

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function (x = matrix()) {
inverse <- NULL
set <- function(y){
	x <<- y
	inverse <<- NULL
	}
get <- function() x
setinverse <- function (inverse) inverse <<- Inverse
getinverse <- function() inverse
list(set=set,get=get,
setinverse=setinverse,
getinverse=getinverse)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
if(require("corpcor")){
	print("correctly loaded")
	} else {
		print("installing")
		install.packages("corpcor")
		if(require(corpcor)){
			print("loaded and installed")
			} else {
			stop("could not install corpcor")
			}
		}
inverse <- X$getinverse()
if(!is.null(inverse)){
	message("matrix in memory")
	return(inverse)
	}
message("inverse not in memory, inverse is being computed")
data <- X$get()
inverse <- pseudoinverse(data, ...)
X$setinverse(inverse)
inverse
}
