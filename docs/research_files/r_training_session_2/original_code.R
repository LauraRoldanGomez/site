# R Training: Session 2
# Data Types and Structures

'
Date: August 2022
Author: T. Wacker
Modified: Laura Roldan-Gomez
'

# 1. Set up----

## 1.1. Working Directory----

setwd("C:/Users/YourUserName/OneDrive -University of Exeter/YourFolder")


## 1.2. Dataset----

# Read or load the built-in R data sets called “iris” & "mtcars". 

data(iris)
data(mtcars)

### Task 1----
# Explore which other data sets are available by typing 'data()' and running that line of code in your console. 

# 2. Data Types - *The basis of it all*----

# *Data types* define how the values are stored in the computer. There are 3 core data types:
 
# * Numeric
# * Character
# * Logical
 
## a. Numeric:----

# this data type consists of numbers, like...
  
#- integers:
3 # This is a number
class(3) # you can check. The function class() and typeof() returns the datatype of an object
typeof(3) # another way of checking (double and numeric are the same thing)


15.5 # This is also a number
class(15.5) 
typeof(15.5)


#- complex:
1+4i # This is also a number
class(4i)
typeof(4i)

## b. Characters or strings:----

# consists of letters, words, sentences or characters, such as:

"a" # note the quote marks
"datatypes"
"Learning R is fun"
"@%£$"

class("a") # Check

# Basically, anything within "" is a character or string, so... numbers can also be characters! 
3 # This is a number
2 # This is also a number

3-2 # I can treat them as numbers

# NOW...
"3" # This is not a number
"2" # This is not a number

"3"-"2" # I cannot treat them as numbers


## c. Logical:----
 
# Logical values can either be TRUE or FALSE or sometimes 1 and 0. 

# That means that if you type:

z = as.logical(c(1,0,0,1))

typeof(z)

### Task 2-----
# Find out, using RStudio Help in the menu or help('as.logical') in the console, what the command as.logical() does.

### Task 3----
# If you do not use as.logical() around c(1,0,0,1) (*i.e.* x=c(1,0,0,1)), what does typeof(z) return and why [make a prediction first, then try out]?


# 3. Examining datatypes: *What and how are you?*----

# R provides many functions to examine features of objects. Some are listed here:

typeof(iris)  #- object’s data type (on the data storage level ("what the computer sees"))?
mode(iris) # same as typeof
class(iris)   #- object's data type (on the abstract type level("what R sees"))?
    
# When you use class() on the iris dataset (*e.g.* class(iris)) and when you use typeof() on the iris data set, which results do you get? The resulting data types/structures will be explained later in detail; keep the results in mind.

length(iris)  #- how long is it? 
length(iris$Sepal.Length)

attributes(iris) #- does it have any metadata? 
str(iris) #- display the internal structure of an object.

is.numeric(iris$Sepal.Length)
is.character(iris$Species) 
is.complex(iris$Sepal.Width)
is.logical(iris$Species) #- returns TRUE when an object is the datatype queried, FALSE if not


#### Task 4----
# Create the following objects:x=8 y=8.9 Use both typeof() and mode() to determine the datatypes of x and y. What differences do you observe?


# 4. Naming R objects----

# *Before we look at data structures, we need to look at naming conventions*

# You can use any combination of alphanumeric characters, along with dots and underscores, to name an R object. But there are a few exceptions:

# Names cannot:
  # * start with a number;
  # * have spaces;
  # * be a standalone number such as 12 or 0.34;
  # * be a reserved word such as if, else, function, TRUE, FALSE and NULL just to name a few (to see the full list of reserved words, type ?Reserved).

# Examples of *valid names* include a, dat2, cpi_index, .tmp, and even a standalone dot . (though a dot can make reading code difficult under certain circumstances).
 
# Examples of *invalid names* include 1dat, dat 2 (note the space between dat and 2), df-ver2 (the dash is treated as a mathematical operator), and Inf (the latter is a reserved word listed in the ?Reserved help document).
 
# You can mix cases, but use upper cases with caution since some letters look very much the same in both lower and upper cases (e.g. s and S).

#### Task 6----
# Check out '?Reserved' and take a look at the reserved words!


# 5. Data Structures----

# R has many data structures. These include:

# * vectors:
  ## * atomic vector
  ## * list
# * matrix
# * data frame
# * factors

## 5.1. Vectors----
# A vector is the most common and basic data structure in R. Technically, vectors can be one of two types:

# * atomic vectors
# * lists

# The term “vector” most commonly refers to the atomic types not to lists.

# An atomic vector only holds elements (or atoms) of a single data type and each atom is a scalar, which means it “has length one”. It is *homogenous*.
# A list is still vector, but it can be *heterogenous*, that means: lists can contain several datatypes and each atom of the list can itself be composed of more than one atom (has a length > one). 

### a. Atomic vectors----
# Let's first take a look at atomic vectors:

v_log <- c(TRUE, FALSE, FALSE, TRUE)
v_log

#

(v_int <- 1:4)

(v_doub <- 1:4 * 1.2)

(v_char <- letters[1:4])


### Task 7----
# What do is.numeric(), is.integer(), and is.double() return for the vectors that hold floating point number versus integers?

### Task 8----
# What does letters do?
 
#### Concatenate----
# The concatenate or combine c() function will explicitly construct a vector. We used it above to construct the logical vector. All the other vectors came about through other means, as in everyday coding, most vectors aren’t made explicitly with c(). They tend to be created with some generator, like the 1:n shortcut, or via transformation of an existing object.
# The function c() can also be used to add elements to a vector.

v_name <- c("Sarah", "Tracy", "Jon")
v_name
v_name <- c(v_name, "Annette")
v_name

# 

v_name<- c("Greg", v_name)
v_name

# 

#### Indexing----
# To index a vector  means to address specific atoms of that vector. To index a vector square brackets are used, like so: x[something]. 
# There are several ways to express which elements you want, i.e. there are several valid forms for something.
 
# Atomic vector indexing examples: 

# Integer vector, all positive: the elements specified in something are kept

v_char[2]

#   We get the second element doing that. You can also use index ranges:

v_doub[2:3]

iris[,2] # in a data base, the position of objects is like a coordinate with the first number indicating the row and the second the column
 
# Logical vector: keep elements of x for which something is TRUE and drop those for which it is FALSE

v_char[c(FALSE, FALSE, TRUE, TRUE)]

#   We can see that only elements remain, that were indexed with TRUE. We can also see that we can index a vector with a vector. That's also the case below:

v_char[v_log]

 
# Negative integers, all negative: the elements specified in something are dropped

v_char[-4]

### Task 8----
# Use the indexing on the data set iris or mtcars. Get a row, a column, remove the last column.

### Task 9----
# What happens when you request the zero-th element of one of our vectors?

### Task 10----
# What happens when you ask for an element that is past the end of the vector, i.e. request x[k] when the length of x is less than k?

### Task 11----
# We indexed x with a logical vector of the same length. What happens if the indexing vector is shorter than x?
 
# Complete the Tasks and you’ll see it’s possible to get an atomic vector of length zero and also to get elements that are NA. In R, missing data is represented as NA (Not Available). NA is a special value and a reserved variable, so you cannot use it in naming objects.   

# Another neat thing is that if you request an element that is not there the underlying variable type is retained.

# Index of 0:

v_int[0]

# 

typeof(v_int[0])

# Outside bounds of the vector:

v_doub[100]

# 

typeof(v_doub[100])

# *So, why does a 0-indexed vector not return NA?*
# The answer is in the manual:
 
# >NA and zero values are allowed: rows of an index matrix containing a zero are ignored, whereas rows containing an NA produce an NA in the result.

# So an index of 0 just gets ignored. We can see this in the following
 

x <- 1:10
x[c(1, 3, 0, 5, 0)]

# So if the only index we give it is 0 then the appropriate response is to return an empty vector.
 

#### Data type coercion----

# Even though R’s vectors have a specific data type, it’s quite easy to convert them to another type. This is called coercion. 
# There’s a hierarchy of types: the more primitive ones cheerfully and silently (implicitly) convert to those higher up in the food chain. Here’s the order:

# >R coercion rules:
# logical - integer - numeric - complex - character

# where - can be read as “are transformed into”. Conversely, character is higher in the hierarchy than complex and that is higher in the hierarchy than numeric *etc.*.

# For explicit coercion, use the as.*() functions.

v_log
as.integer(v_log)
v_int
as.numeric(v_int)
v_doub
as.character(v_doub)
as.character(as.numeric(as.integer(v_log)))

# But coercion can also be triggered by other actions, such as assigning a scalar of the wrong type into an existing vector.

v_doub_copy <- v_doub
str(v_doub_copy)
v_doub_copy[3] <- "uhoh"
str(v_doub_copy)

# Our numeric vector was silently coerced to character. This can be a wonderful source of bugs, so when debugging, always give serious thought to this question: Is this object of the type I think it is? How sure am I about that?

# We end the discussion of atomic vectors with two specific examples of “being intentional about type”.

# * Use of type-specific NAs when doing setup.
# * Use of L to explicitly request integer. 


(big_plans <- rep(NA_integer_, 4))
str(big_plans)
big_plans[3] <- 5L

## note that big_plans is still integer!

str(big_plans)

## note that omitting L results in coercion of big_plans to double
big_plans[1] <- 10
str(big_plans)



### Task 12----
# Recall the hierarchy of the most common atomic vector types: logical < integer < numeric < character. Try to use the as.*() functions to go the wrong way. Call as.logical(), as.integer(), and as.numeric() on a character vector, such as letters. What happens?
 

### b. Lists----

# Atomic vectors are very constrained: atoms are of a scalar/length 1 and need to be one data type. You might find yourself needing a vector that violates these constraints and for which the following is true:

# * Individual atoms might have length greater than 1.
# * Individual atoms might not be of the same flavor.

# This is when you need a list. A list is still a vector in R, but it’s not an atomic vector. Lists are sometimes called generic vectors, because the elements of a list can be of any type of R object, even lists containing further lists. They are ultimately nice R containers for data. 
 
# We construct a list explicitly with list() but, like atomic vectors, most lists are created some other way in real life.


(x <- list(1:3, c("four", "five")))

(y <- list(logical = TRUE, integer = 4L, double = 4 * 1.2, character = "character"))

(z <- list(letters[26:22], transcendental = c(pi, exp(1)), f = function(x) x^2))


# We have explicit proof above that list components can
 
# * Be heterogeneous, i.e. can be of different “flavors”. 
# * Have different lengths.
# * Have names. Or not. Or some of both.

# You can also coerce other objects using as.list(). 

# To create an empty list of the required length in R, use the vector() function. list() does not allow you to create an empty list of a *specific length* (it just creates an empty list object). The vector() function takes two arguments: mode and length. In our case, the mode is a list, length is the number of elements in the list, and actually the list ends up being empty, filled with NULL.
# 

a_list <- vector(mode="list", length = 5) # empty list
length(a_list)
a_list

# The content of elements of a list can be retrieved by using double square brackets (more on that below).

a_list[[1]]

 
# Vectors can be coerced to lists as follows:

other_list <- 1:10
other_list<- as.list(other_list)
length(other_list)

iris1<-as.list(iris)
 
### Task 13----
# What is the class of other_list[1]?

### Task 14----
# What is the class of other_list[[1]]?

#### List indexing----

# List indexing is a bit more complicated than that of atomic vectors. There are 3 ways to index a list and the differences are very important:
 
# 1.) With single square brackets, i.e. just like we indexed atomic vectors. Note this always returns a list, even if we request a single component.
 

x[c(FALSE, TRUE)]
y[2:3]
z["transcendental"]

iris[1]

 
# 2.) With double square brackets. This can only be used to access a single component and it returns the “naked” component. You can request a component with a positive integer or by name.
 

x[[2]]

y[["double"]]

 
# 3.) With the $ addressing named components, which we will learn a lot more about when we look at data frames. Like [[, this can only be used to access a single component, but it is even more limited: You must specify the component by name.
 

z$transcendental

 
# A very good and easy-to-grasp example of the difference between the list-preserving indexing provided by [ and the behaviour of [[ is given here: [the pepper shaker analogy on R for Data Science](https://r4ds.had.co.nz/vectors.html#lists-of-condiments). Click the hyperlink to see more!
 
### Task 15----
# Consider 
my_vec <- c(a = 1, b = 2, c = 3)
my_list <- list(a = 1, b = 2, c = 3)
# Use [ and [[ to attempt to retrieve elements 2 and 3 from my_vec and my_list. What succeeds vs. fails? What if you try to retrieve element 2 alone? Does [[ even work on atomic vectors? Compare and contrast the results from the various combinations of indexing method and input object.
 
## Overview data frames & matrices----

# A data frame & matrices are very important data types in R. They are pretty much the de facto data structures for most tabular data and what we use for statistics.

# While the data frame is a special type of list where every element of the list has same length (i.e. data frame is a “rectangular” list), the matrix is a special type of atomic vector.
 
 

## 5.2. Matrices----

# Matrices are atomic vectors with dimensions; the number of rows and columns. As with atomic vectors, the elements of a matrix must be of the same data type.
 
# To create an empty matrix, we need to define those dimensions:
 

m<-matrix(nrow=2, ncol=2)
m

 
# We can find out how many dimensions a matrix has by using

dim(m)

# You can check that matrices are vectors with a class attribute of matrix by using class() and typeof().
 

m <- matrix(c(1:3))
class(m)
typeof(m)

# While class() shows that m is a matrix, typeof() shows that in this case *fundamentally the matrix is an integer vector* (we will see later that they are not always integer vectors, but can be character vectors, too.

# When creating a matrix, it is important to remember that matrices *are filled column-wise*


m<-matrix(1:6, nrow=2, ncol=3)
m

# If that is not what you want, you can use the byrow argument (a logical: can be TRUE or FALSE) to specify how the matrix is filled

m<-matrix(1:6, nrow=2, ncol=3, byrow=TRUE)
m

 
# You can create a matrix from a vector:
 

m<-sample(1:100, size=10)
m
dim(m)<-c(2,5)
m

 
# *A lot is going on here. Let's dissect it*:
 
# * We generate a random integer vector using sample(). sample() in this case randomly draws 10 (size=10) numbers from 1 to 100 (1:100)^[if you want to get the same vector each time with the same parameters, you need to use set.seed() with a defined number first].
# * we assign the vector dimensions using dim() and c(2,5), with the later being c(rows, columns).
 
# All of the above takes the random integer vector and transforms it into a matrix with 2 rows and 5 columns. 
 
# You can also bind columns and rows using cbind() and rbind:

x <- 1:3
y <- 10:12
m<-cbind(x, y)
m
n<-rbind(x,y)
n

 
# If we want to retrieve an element we can do so by using: 
 
#### Matrix indexing----

# Akin to vectors, we revisit our square-brackets and can retrieve elements of a matrix by specifying the index along each dimension (e.g. “row” and “column”) in single square brackets.


m[3,2]


# Note that it is [row,column].
 
### Task 16----
# Transform the built-in dataset iris into a matrix using as.matrix() and assign it to a new variable of your choice.
# When you use class() and typeof(), what results do you get and why? What happened to the doubles in the data frame (hint: remember the coercion rules from earlier)?


## 5.3 . Data frames----

# Usually created by read.csv() and read.table(), i.e. when importing the data into R. When we imported the dataset "iris" earlier (data(iris)), we loaded the dataframe "iris". 
# Have a look by typing iris into your console.
# Assuming all columns in a data frame are of same type, data frame can be converted to a matrix with data.matrix() (preferred) or as.matrix().  Otherwise type coercion will be enforced and the results may not always be what you expect.
 
# Instead of loading data, you can also create a new data frame with data.frame() function.
# Find the number of rows and columns with nrow(dat) and ncol(dat), respectively. We will look at that in detail in a moment
# Rownames are often automatically generated and look like 1, 2, …, n. 
 
# First, let's create a data frames by hand:
 

dat <- data.frame(id = letters[1:10], x = 1:10, y = 11:20)
dat


# You can also convert matrices into data frames using as.data.frame():

class(m)
df_m=as.data.frame(m)
class(df_m)

 
# To explore data frames, there are several interesting functions:
 
# Explorative data frame functions:

# * head() - shows first 6 rows
# * tail() - shows last 6 rows
# * dim() - returns the dimensions of data frame (i.e. number of rows and number of columns)
# * nrow() - number of rows
# * ncol()- number of columns
# * str() - structure of data frame - name, type and preview of data in each column
# * names() or colnames() - both show the names attribute for a data frame
# * sapply(dataframe, class) - shows the class of each column in the data frame

### Task 17---- 
# Try out all the functions above on dat.

### Task 18---- 
# Try summary(dat) and summary(iris). What does it do?

# Below we show that a data frame is actually a special list:

is.list(dat)
class(dat)

# Lists can contain elements that are themselves multi-dimensional (e.g. a lists can contain data frames or another type of objects). Lists can also contain elements of any length, therefore lists do not necessarily have to be “rectangular”. *However, in order for the list to qualify as a data frame, the length of each element has to be the same.*

#### Data frame indexing/slicing---- 

# As indirectly shown above, there are ways to retrieve specific elements from the data frame, the data frame can be *sliced* or *indexed* .
# Because data frames are rectangular, elements of data frame can be referenced by specifying the row and the column index in single square brackets (similar to matrix).


dat[1, 3]

# As data frames are also lists, it is possible to refer to columns (which are elements of such list) using the list notation, i.e. either double square brackets or a $.
# 

dat[["y"]]
dat$y

#### Restructure your data frame - *pimp up your data frame*----  

# When you look at both the dat and iris data frames from earlier, they have no rownames:
 
dat
head(iris)


# However, when we look at the mtcars data set, it does:

head(mtcars)

# *mtcars has rownames!*

# Let's assume we want to make dat a bit more fancy and we want to give each row a name. What could we do? 
# Albeit a bit non-sensical (but the entire data frame is just a generic example), we could name the rows as follows:

names<-c("first","second","third","fourth","fifth","sixth", "seventh","eighth","ninth","tenth")
rownames(dat)=names
dat

# Note that names is a character vector that is used to assign the rownames in the data frame dat.

# We can also rename columns. Let's assume we want to change the abbreviation of the first three columns of mtcars to the actual words:

colnames(mtcars)[1:3]<-c("miles per gallon","cylinders","displacement")
head(mtcars)

# By using [1:3] we only changed a subset of the column names. If you want to change them all, the vector with the column names must correspond to the number of columns (be of identical length/ have the same 1D dimension). 

### Task 19----
# Try to selectively rename 2 rows of your choice in mtcars.
 
# You can also append a column of choice to your data frame. Remember, it needs to have the same length as the other columns:

#find out how many rows our mtcars actually has:
nrow(mtcars)
#generate new column
favorites=1:32
#append
mtcars$favorites=favorites
mtcars

### Task 20----
# Try out what happens if you try to add a new column of a length that is less than 32.

# We can also subset (or filter based on a conditional statement) a data frame using subset. The function takes two arguments subset(x, condition). X is the data frame to perform subset on, condition is the conditional statement to subset with:


#find out how many rows our mtcars actually has:
subset(mtcars, cylinders>4)

### Task 21----
# Extract (using either [] or $) the columns Sepal.Length and Sepal.Width from the iris dataset and make a new data frame out of them using data.frame(). Subset the new data frame for Sepal.Length > 4.6.


## 5.4. Factors----
# Factors are so-called *derived data types*.
# They are normally used to group variables into a fixed number of unique categories or levels. For example, a data set may be grouped by gender or month of the year. Such data are usually loaded into R as a numeric or character data type requiring that they be converted to a factor using the as.factor() function.
 
# In the following chunk of code, we create a factor from a character object.
 

a      <- c("March","February","February","November","February","March","March","March","February","November")
fact <- as.factor(a)

# Note that a is of character data type and fact is the factor representation of a.

typeof(a)

# However, the derived object fact is now stored as an integer!


typeof(fact)


# Yet, when displaying the contents of fact we see character values.

fact

# *How can this be?* 
# Well, fact is a *more complicated object* than the simple objects created thus far in that the factor is storing additional information not seen in its output. This hidden information is stored in attributes. To view these hidden attributes, use the attributes() function.

attributes(fact)

# There are two attributes of the factor object fact : levels and class. The levels attribute lists the three unique values in fact. The order in which these levels are listed reflect their *numeric* representation. So in essence, fact is storing each value as an integer that points to one of the three unique levels.

# *So why doesn’t R output the integer values when we output fact?* To understand why, we first need to know that when we call the object name, R is wrapping that object name with the print command, so the following lines of code are identical.

fact
print(fact)

# The print function then looks for a class attribute in the object. The class type instructs the print function on how to generate the output. Since fact has a factor class attribute (fact is the factor object of a), the print function is instructed to replace the integer values with the level “tags”. 

# Naturally, this all happens behind the scenes without user intervention.
 
# Another way to determine fact’s class type is to call the class function.

class(fact)

# The unique levels of a factor, and the order in which they are stored can be extracted using the levels function.

levels(fact)

# Remember, the order in which the levels are displayed match their integer representation.

# Note that if a class attribute is not present (if it is not the fact factor of a), the class function will return the object’s data type.

class(a)

# In such a case, the a object is treated as a generic element, it is not its factor representation with levels: fact.
 
# To *appreciate the benefits of a factor we’ll first create a data frame*. One column will be assigned the fact factor and another will be assigned some random numeric values.

x      <- c(166, 47, 61, 148, 62, 123, 232, 98, 93, 110)
dat_fact    <- data.frame(min_sunshine = x, month = fact)
dat_fact

# The month column is now a factor with three levels: F, M and N. We can use the str()`` function to view the dataframe’s structure as well as its columns classes.

str(dat_fact)

# Many functions other than print will *recognize factor data types and will allow you to split the output into groups defined by the factor’s unique levels*. For example, to create three box plots of the value min_sunshine (we will learn more about box plots later), one for each month group F, M and U, type the following:

boxplot(min_sunshine ~ month, dat_fact, horizontal = TRUE)

# The tilde ~ operator is used in the plot function to split (or condition) the data into separate plots based on the factor month.

#### Rearranging level order----

# *A factor will define a hierarchy for its levels*. When we invoked the levels function in the last example, you may have noted that the levels output were ordered F, M and N–this is the level hierarchy defined for months (i.e. F>M>N ). This means that regardless of the order in which the factors appear in a table, *anytime a plot or operation is conditioned by the factor, the grouped elements will appear in the order defined by the levels’ hierarchy*. When we created the box plot from our dat_fact object, the plotting function ordered the box plot (bottom to top) following months’s level hierarchy (i.e. F first, then M, then N).

# If we wanted the box plots to be plotted in a different order (i.e. N first followed by F then M) we would need to modify the month column by *releveling* the factor object as follows:

dat_fact$month <- factor(dat_fact$month, levels=c("November","February","March"))
str(dat_fact)

# The factor function is giving the original factor values (dat_fact$months) but is also giving the levels in the new order in which they are to appear(levels=c("November","February","March")). Now, if we recreate the box plot, the plot order (plotted from bottom to top) will reflect the new level hierarchy.

boxplot(min_sunshine ~ month, dat_fact, horizontal = TRUE)

### Task Challenge----
# Load the dataset esoph. This data frame contains the data from a case-control study of (o)esophageal cancer in Ille-et-Vilaine, France.

# * remove the last column of the data frame.
# * rename the columns from agegp to Age_Group, from alcgp to Alcohol_consump, from tobgp to Tobacco_consump and leave the column name of ncases the same. 
# * subset the dataframe to only contain rows that have an Alcohol_consump of 120+. 
# * convert the agegp into a factor and assign it to a new variable. Assess the attributes of that variable.
# * What data type is Alcohol_consump? 

