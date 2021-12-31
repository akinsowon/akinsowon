# how to use apply family
# The firstly apply function   
# Construct a 5x6 matrix
X <- matrix(rnorm(30), nrow = 5, ncol = 6)
X
# Sum the values of each column with `apply()`
apply(X, 2, sum)


#The secondly lappy function
# Create a list of matrices
A <- matrix(1:9,ncol = 3)
B <- matrix(1:12,ncol = 3)
C <- matrix(1:15,ncol = 3)

mylist <- list(A,B,C)
mylist
# Extract the 2nd column from MyList with the selection operator `[` with lapply()`
lapply(mylist,"[",  2)
lapply(mylist,"[",, 2)
lapply(mylist,"[", 3)
lapply(mylist,"[",, 1)
lapply(mylist,"[", 1)
lapply(mylist,"[", 1, 2)
lapply(mylist,"[", 2, 3)

#The Thirdly sapply function the is vice versa of lapply, it return the function to vector.
# Return a list with `lapply()`
lapply(mylist,"[", 2, 1 )

# Return a vector with sapply()`
sapply(mylist,"[", 2, 1 )

# Return a list with sapply() will simplify to false.
sapply(mylist,"[", 2, 1, simplify=F)

# Return a vector with `unlist()`
(lapply(mylist,"[", 2, 1 ))

#The fourthly Rep function
# Initialize `Z`
Z <- sapply(mylist,"[", 1, 1 )
#Return `Z`
Z

# Replicate the values of `Z`
Z <- rep(Z,c(3,1,2))
# Return `Z`
Z

# The five one is mapply function it multivariate apply.

# Create a 4x4 matrix
Q1 <- (c(rep(1, 4), rep(2, 4), rep(3, 4), rep(4, 4), 4,4))
Q1

Q2 <- (c(rep(1, 3), rep(2, 2), rep(3, 5), rep(4, 2), 5,5))
Q2
# Or use `mapply()`
Q3 <- mapply(rep,1:4,4)
Q3

#create dataset called datapoint
datapoint <- matrix(c(1:15),ncol = 3)
datapoint
#Find means per column with apply()`
datapoint_means <- apply(datapoint, 2, mean)
datapoint_means
#Find standard deviation with apply()`
datapoint_sdev <- apply(datapoint, 2, sd)
datapoint_sdev
# Center the points 
datapoint_Trans1 <- sweep(datapoint, 2, datapoint_means)
print(datapoint_Trans1)
datapoint_Trans1
# Return the result
datapoint_Trans1

# Normalize
datapoint_Trans2 <- sweep(datapoint_Trans1, 1, datapoint_sdev)

#Normalize and use divide operator '/'
datapoint_Trans2 <- sweep(datapoint_Trans1, 1, datapoint_sdev, "/")

# Return the result
datapoint_Trans2

# Normalize the data with a nested call
datapoint_Trans <- sweep(sweep(datapoint, 2, datapoint_means,"-"), 1, datapoint_sdev,"/")

# Return the result
datapoint_Trans


datapoint_means <- apply(datapoint, c(1,2), mean)
datapoint_means

# The Aggregate function(), to call the aggregate we need to create dataframe or insert 
#the data

mydf <- data.frame(productID = c(001,002,003,004,005,006,007,008,009,010),
                   productName = c('bicycle-toy','train-toy','doll-toy','ball-toy','teddy-toy',
                                   'kite-toy','rubber-toy','airplane-toy','crayon-toy','car-toy'),
                   ProductPrice = c('#100','#50','#120','#70','#80','#50','#100','#40','#70','#90'),
                   ShefID = c(1,3,4,6,9,10,12,8,2,5),
                   BarcodeID = c(0010,0011,0012,0013,0014,0015,0016,0017,0018,0019),
                   DeliverStatus = c('T','T','T','F','T','F','F','T','T','F'))
mydf
# Show data types for each column
sapply(mydf, class)
# Return number of rows and columns with `dim()`
dim(mydf) 
# How many productName? 
unique(mydf$productName)
# To number of row and column
nrow(mydf)
ncol(mydf)

#To learn or explore more about apply family go to advance. 














