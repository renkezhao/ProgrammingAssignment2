## The functions will calculate inverse matrix using cached data. If the matrix is not available in cache, the second function will do the calculation.  

## The first function creates a special "vector", which is really a list containing a function to set the value of the vector,
## to get the value of the vector,set the value of the inverse matrix,get the value of the inverse matrix

makeCacheMatrix<- function(x=matrix()){
  m <- NULL
  set <- function(y){
    x<<- y
    m<<-NULL
  }
  get <- function() x
  setinverse <- function(solve) m<<- solve
  getinverse <- function() m
  list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}



## The following function calculates the inverse matrix of the special "vector" created with the above function

cacheSolve <- function(x,...){
  m <- x$getinverse()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  data <-x$get()
  m<-solve(data,...)
  x$setinverse(m)
  m
}