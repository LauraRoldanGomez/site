# SESSION X - Beginner R 

# 1. Set up----
'
Descripition: R Course Sessioon 2
Date: August 2022
Author: T. Wacker
Sources:
'

# Set up

#After you __opened RStudio__, in the console, __set your working directory__.

setwd("C:/Users/YourUserName/OneDrive -University of Exeter/YourFolder")

#Your working directory is now the folder you created. 

# Data set
# Read or load in the data for this session. We will be using the R data called “iris” & "mtcars". 

data(iris)
data(mtcars)

# Topics
## Intro to Data Types and Structures
### Data Types - *The basis of it all*

# *Data types*, or modes, define how the values are stored in the computer. 
# For your computer (and for R), there are __*3 core data types*:__
# 
# * Numeric
# * Character
# * Logical
# 
# Elements of these data types may be combined to form data structures, such as atomic vectors. When we call a vector *atomic*, we mean that the vector only holds data of a single data type. More in detail in the next section "Data Structures".
# 
# #### Numeric
# 
# The __numeric__ data type consists of numbers.
# 
# Those can be:
#   
#   * __integers:__ ```1,-3,22,0,1890, 2L``` (The L explicitly tells R that this is an integer)
# * __doubles:__ ```15.5, 0.01, -0.0004```
# 
# Additionally, you can have __complex__ numbers:
#   
#   * __complex:__ ```1+4i``` (complex numbers with real and imaginary parts) ^[Interestingly, internally, complex numbers are stored as a pair of doubles. That means R knows that this is a complex number, to your computer it, however, is just a set of doubles.] 
# 
# 
# 
# #### Characters
# 
# The __character__ data type consists of letters or words such as "a", "f", "datatypes", "Learning R is fun".
# 
# * __character__: ```Superkalifragilistikexpialegetisch, abc, @%£$```
# 
# Importantly, also __*numbers can be characters*__. To coerce numbers into characters, you can use ```""```. To distinction between a character representation of a number and a numeric one is important. For example:

x=3
y=1.5

#We can subtract them from each other:
  
x-y


#However, if we do this with the character representations of the numbers 3 and 1.5, the following happens:
  
x="3"
y="1.5"
x-y

#### Logical

#__Logical__ values can either be ```TRUE``` or ```FALSE```. ```TRUE```can also be represented as ```1``` and ```FALSE``` as ```0```. 
#That means that if you type :
  x=as.logical(c(1,0,0,1))


#and use the function ```typeof()``` which returns which the datatype of an object, typeof() returns logical:
  
typeof(x)

### Examining datatypes: *What and how are you?*
  
#   R provides many functions to examine features of objects. Some are listed here:
#   
#   * ```typeof()``` - what is the object’s data type (on the data storage level ("what the computer sees"))?
#   * ```class()``` - What is the object's data type (on the abstract type level("what R sees"))?
# * ```mode()``` - what is the object's data type (on the data storage level ("what the computer sees"))?
#   * ```length()```- how long is it? 
#   * ```attributes()``` - does it have any metadata? 
#   * ```str``` - display the internal structure of an object.
# * ```is.numeric()```, ```is.character()```, ```is.complex()```, ```is.logical()``` - returns TRUE when an object is the datatype queried, FALSE if not

#__Some Examples:__

x <- "dataset"
typeof(x)
attributes(x)
y <- 1:10
y
typeof(y)
length(y)

#   ### Naming R objects
#   
#   You can use any combination of alphanumeric characters, along with dots and underscores, to name an R object. But there are a few ___exceptions:___
# 
# * Names cannot start with a number;
# * Names cannot have spaces;
# * Names cannot be a standalone number such as ```12``` or ```0.34```;
# * Names cannot be a reserved word such as ```if```, ```else```, ```function```, ```TRUE```, ```FALSE``` and ```NULL``` just to name a few (to see the full list of reserved words, type ```?Reserved```).
# 
# Examples of __*valid names*__ include ```a```, ```dat2```, ```cpi_index```, ```.tmp```, and even a standalone dot ```.``` (though a dot can make reading code difficult under certain circumstances).
# 
# Examples of __*invalid names*__ include ```1dat```,``` dat 2``` (note the space between ```dat``` and ```2```), ```df-ver2``` (the dash is treated as a mathematical operator), and ```Inf``` (the latter is a reserved word listed in the ```?Reserved``` help document).
# 
# You can mix cases, but use upper cases with caution since some letters look very much the same in both lower and upper cases (e.g. s and S).
# 
# > ##### Exercise:<br>
#   6.) Check out ```?Reserved``` and take a look at the reserved words!
# 
### Data Structures  
  
#R has many __data structures__. These include:
  
#   * vectors:
#   * atomic vector
# * list
# * matrix
# * data frame
# * factors
# 
# A vector is the most common and basic data structure in R. Technically, __vectors can be one of two types__:
#   
#   * atomic vectors
# * lists
# 
# The term “vector” most commonly refers to the atomic types not to lists.
# 
# When we call a vector __atomic__, we mean that the vector only holds elements (or atoms) of a single data type and each atom is a scalar, which means it “has length one”. It is __*homogenous*__.
# A __list__ is still vector, but it can be __*heterogenous*__, that means: lists can contain several datatypes and each atom of the list can itself be composed of more than one atom (has a length > one). 

#### Atomic vectors

#Let's first take a look at atomic vectors:

v_log <- c(TRUE, FALSE, FALSE, TRUE)
v_log
(v_int <- 1:4)
(v_doub <- 1:4 * 1.2)
(v_char <- letters[1:4])

#The ```c()``` function will explicitly __construct__ a vector. We used it above to construct the logical vector. All the other vectors came about through other means, as in everyday coding, most vectors aren’t made explicitly with ```c()```. They tend to be created with some generator, like the ```1:n``` shortcut, or via transformation of an existing object.
#The function ```c()``` can also be used to __add elements__ to a vector.

v_name <- c("Sarah", "Tracy", "Jon")
v_name <- c(v_name, "Annette")
v_name
v_name<- c("Greg", v_name)
v_name

#To __index a vector__  means to address specific atoms of that vector. To index a vector square brackets are used, like so: ```x[something]```. 
#There are several ways to express which elements you want, i.e. there are several valid forms for ```something```.

##### Atomic vector indexing examples:

#__Integer vector, all positive__: the elements specified in something are kept

v_char[2]

#We get the second element doing that. You can also use index ranges:

v_doub[2:3]

#__Logical vector__: keep elements of x for which something is TRUE and drop those for which it’s FALSE

v_char[c(FALSE, FALSE, TRUE, TRUE)]

#We can see that only elements remain, that were indexed with TRUE. We can also see that we can index a vector with a vector. That's    also the case below:

v_char[v_log]

#__Negative integers, all negative:__ the elements specified in something are dropped

v_char[-4]

#Another neat thing is that if you request an element that is not there the underlying variable type is retained.

#__Index of 0:__

v_int[0]
typeof(v_int[0])

#__Outside bounds of the vector:__

v_doub[100]

typeof(v_doub[100])


# __*So, why does a 0-indexed vector not return NA?*__
# The answer is in the manual:
#   
#   >NA and zero values are allowed: rows of an index matrix containing a zero are ignored, whereas rows containing an NA produce an NA in the result.
# 
# So an index of 0 just gets ignored. We can see this in the following


x <- 1:10
x[c(1, 3, 0, 5, 0)]

#So if the only index we give it is 0 then the appropriate response is to return an empty vector.

-----
  
#   #### Coercion
#   
#   Even though R’s vectors have a specific data type, it’s quite easy to convert them to another type. This is called __coercion__. 
# There’s a hierarchy of types: the more primitive ones cheerfully and silently (__implicitly__) convert to those higher up in the food chain. Here’s the order:
#   
#   >__R coercion rules:__<br><br>
#   logical __&#8594;__ integer __&#8594;__ numeric __&#8594;__ complex __&#8594;__ character<br>
#   
#   where __&#8594;__ can be read as “are transformed into”. Conversely, character is higher in the hierarchy than complex and that is higher in the hierarchy than numeric *etc.*.
#   
#   For __explicit coercion__, use the ```as.*()``` functions.


v_log
as.integer(v_log)
v_int
as.numeric(v_int)
v_doub
as.character(v_doub)
as.character(as.numeric(as.integer(v_log)))

#But coercion can also be triggered by other actions, such as assigning a scalar of the wrong type into an existing vector.

v_doub_copy <- v_doub
str(v_doub_copy)
v_doub_copy[3] <- "uhoh"
str(v_doub_copy)


#Our numeric vector was silently coerced to character. This can be a wonderful source of bugs, so when debugging, always give serious thought to this question: Is this object of the type I think it is? How sure am I about that?
#We end the discussion of atomic vectors with two specific examples of “being intentional about type”.

#* Use of type-specific NAs when doing setup.
#* Use of L to explicitly request integer. 

(big_plans <- rep(NA_integer_, 4))
str(big_plans)
big_plans[3] <- 5L
## note that big_plans is still integer!
str(big_plans)
## note that omitting L results in coercion of big_plans to double
big_plans[1] <- 10
str(big_plans)
  
#### <a id="4.1.4.3 Lists"></a>Lists
  
# Atomic vectors are very constrained: atoms are of a scalar/length 1 and need to be one data type. You might find yourself needing a vector that violates these constraints and for which the following is true:
#   
# * Individual atoms might have length greater than 1.
# * Individual atoms might not be of the same flavor.
# 
# This is a when you need a __list__.
# 
# A list is actually still a vector in R, but it’s not an atomic vector. Lists are sometimes called __generic vectors__, because the elements of a list can by of any type of R object, even lists containing further lists. They are ultimately nice R containers for data. 
# 
# We __construct__ a list explicitly with ```list()``` but, like atomic vectors, most lists are created some other way in real life.


(x <- list(1:3, c("four", "five")))

(y <- list(logical = TRUE, integer = 4L, double = 4 * 1.2, character = "character"))

(z <- list(letters[26:22], transcendental = c(pi, exp(1)), f = function(x) x^2))


# We have explicit proof above that list components can
# 
# * Be heterogeneous, i.e. can be of different “flavors”. 
# * Have different lengths.
# * Have names. Or not. Or some of both.
# 
# You can also __coerce__ other objects using ```as.list()```. 
# 
# To create an empty list of the required length in R, use the ```vector()``` function. ```list()``` does not allow you to create an empty list of a *specific length* (it just creates an empty list object). The ```vector()``` function takes two arguments: mode and length. The mode is, in our case, is a list, and length is the number of elements in the list, and the list ends up actually empty, filled with NULL.


a_list <- vector(mode="list", length = 5) # empty list
length(a_list)
a_list

#The content of elements of a list can be retrieved by using double square brackets (more to that below).

a_list[[1]]

#Vectors can be coerced to lists as follows:

other_list <- 1:10
other_list<- as.list(other_list)
length(other_list)

  
##### List indexing {-}
  
#List indexing is a bit more complicated than that of atomic vectors. There are __3 ways to index a list__ and the differences are very important:
  
#.) __With single square brackets__, i.e. just like we indexed atomic vectors. Note this always returns a list, even if we request a single component.


x[c(FALSE, TRUE)]
y[2:3]
z["transcendental"]

#2.) __With double square brackets__. This can only be used to access a single component and it returns the “naked” component. You can request a component with a positive integer or by name.


x[[2]]

y[["double"]]

#3.) ___With the ```$``` addressing named components__, which we will learn a lot more about when we look at data frames. Like ```[[```, this can only be used to access a single component, but it is even more limited: You must specify the component by name.


z$transcendental


#A very good and easy-to-grasp example of the difference between the list-preserving indexing provided by ```[``` and the behaviour of ```[[``` is given here: [the pepper shaker analogy on R for Data Science](https://r4ds.had.co.nz/vectors.html#lists-of-condiments). Click the hyperlink to see more!

#### <a id="4.1.4.4"></a>Overview data frames & matrices
  
#   A __data frame__ & __matrices__ are very important data types in R. They are pretty much the de facto data structures for most tabular data and what we use for statistics.
# 
# While the data frame is a special type of list where every element of the list has same length (i.e. data frame is a “rectangular” list), the matrix is a special type of atomic vector.
# 
# The table below illustrates how they relate to each other:
#   
#   __Table 1__
# 
# | Dimensions |	Homogenous | Heterogeneous |
#   |:-----------|:-----------:|:-------------:|
#   | 1-D	| atomic vector |	list |
#   | 2-D |	matrix |	data frame |
#   
#   ------
#   
#   #### Matrices
  
# As Table 1 already hints add, __matrices are atomic vectors with dimensions; the number of rows and columns__. As with atomic vectors, the elements of a matrix must be of the same data type.
# 
# To __create an empty matrix__, we need to define those dimensions:

m<-matrix(nrow=2, ncol=2)
m

#We can __find out how many dimensions a matrix has__ by using ```dim()```

dim(m)

#You can check that matrices are vectors with a class attribute of matrix by using ```class()``` and ```typeof()```.

m <- matrix(c(1:3))
class(m)
typeof(m)

#While ```class()``` shows that ```m``` is a matrix, ```typeof()``` shows that in this case __*fundamentally the matrix is an integer vector*__ (we will see later that they are not always __integer__ vectors, but can be __character__ vectors, too.
                                                                                                                                                
# When creating a __matrix__, it is important to remember that matrices __*are filled column-wise*__

m<-matrix(1:6, nrow=2, ncol=3)
m

# If that is not what you want, you can use the ```byrow``` argument (a logical: can be ```TRUE``` or ```FALSE```) to specify how the matrix is filled

m<-matrix(1:6, nrow=2, ncol=3, byrow=TRUE)
m

# You can __create a matrix from a vector__:

m<-sample(1:100, size=10)
m
dim(m)<-c(2,5)
m


#All of the above takes the random integer vector and transforms it into a matrix with 2 rows and 5 columns. 

#You can also __bind columns and rows__ using ```cbind()``` and ```rbind```:

x <- 1:3
y <- 10:12
m<-cbind(x, y)
m
n<-rbind(x,y)
n


#If we want to retrieve an element we can do so by using: 

##### Matrix indexing{-}

#Akin to vectors, we revisit our square-brackets and can retrieve elements of a matrix by specifying the index along each dimension (e.g. “row” and “column”) in single square brackets.


m[3,2]


#Note that it is ```[row,column]```.


#### Data frames

# Usually created by ```read.csv()``` and ```read.table()```, i.e. when importing the data into R. When we imported the data set "iris" earlier (```data(iris)```), we loaded the data frame "iris". 
# Have a look by typing ```iris``` into your console.
# Assuming all columns in a data frame are of same type, data frame can be converted to a matrix with ```data.matrix()``` (preferred) or ```as.matrix()```.  Otherwise type coercion will be enforced and the results may not always be what you expect.
# 
# > ##### Question: <br>
# Is it possible to convert the data set iris into a matrix?
# 
# Instead of loading data, you can also __create a new data frame__ with ```data.frame()``` function.
# Find the number of rows and columns with ```nrow(dat)``` and ```ncol(dat),``` respectively. We will look at that in detail in a moment
# Rownames are often automatically generated and look like 1, 2, …, n. 

##### First, let's create a data frames by hand:{-}

dat <- data.frame(id = letters[1:10], x = 1:10, y = 11:20)
dat

#You can also convert matrices into data frames using ```as.data.frame()```:

class(m)
df_m=as.data.frame(m)
class(df_m)


#To explore data frames, there are several interesting functions:
  
##### Explorative data frame functions:{-}
#   
# * ```head()``` - shows first 6 rows
# * ```tail()``` - shows last 6 rows
# * ```dim()``` - returns the dimensions of data frame (i.e. number of rows and number of columns)
# * ```nrow()``` - number of rows
# * ```ncol()```- number of columns
# * ```str()``` - structure of data frame - name, type and preview of data in each column
# * ```names()``` or ```colnames()``` - both show the names attribute for a data frame
# * ```sapply(dataframe, class)``` - shows the class of each column in the data frame
# 
# 
# Remember Table 1? Below we show that a __data frame is actually a special list__:
  

is.list(dat)
class(dat)

#Lists can contain elements that are themselves multi-dimensional (e.g. a lists can contain data frames or another type of objects). Lists can also contain elements of any length, therefore list do not necessarily have to be “rectangular”. __*However, in order for the list to qualify as a data frame, the length of each element has to be the same.*__

##### Data frame indexing/slicing {-}

# As indirectly shown above, there are ways to retrieve specific elements from the data frame, the data frame can be __*sliced*__ or __*indexed*__ .
# Because data frames are rectangular, elements of data frame can be referenced by specifying the row and the column index in single square brackets (similar to matrix).

dat[1, 3]

#As data frames are also lists, it is possible to refer to columns (which are elements of such list) using the list notation, i.e. either double square brackets or a ```$```.

dat[["y"]]
dat$y
  
##### Restructure your data frame - *pimp your data frame*  {-}
  
dat
head(iris)

#However, when we look at the ```mtcars``` data set, it does:

head(mtcars)

# __*```mtcars``` has rownames!*__
# <br><br>
#   Let's assume we want to make ```dat``` a bit more fancy and we want to __give each row a name__. What could we do? 
# Albeit a bit non-sensical (but the entire data frame is just a generic example), we could name the rows as follows:


names<-c("first","second","third","fourth","fifth","sixth", "seventh","eighth","nineth","tenth")
rownames(dat)=names
dat

#Note that ```names``` is a character vector that is used to assign the rownames in the data frame ```dat```.

#We can also __rename columns__. Let's assume we want to change the abbreviation of the first three columns of mtcars to the actual words:
  

colnames(mtcars)[1:3]<-c("miles per gallon","cylinders","displacement")
head(mtcars)

#By using ```[1:3]``` we only changed a subset of the column names. If you want to change them all, the vector with the column names must correspond to the number of columns (be of identical length/ have the same 1D dimension). 


#You can also __append a column of choice__ to your data frame. Remember, it needs to have the same length as the other columns:

#find out how many rows our mtcars actually has:
nrow(mtcars)
#generate new column
favorites=1:32
#append
mtcars$favorites=favorites
mtcars

#We can also __subset__ (or filter based on a conditional statement) a data frame using ```subset```. The function takes two arguments ```subset(x, condition)```. X is the the data frame to perform subset on, condition is the conditional statement to subset with:
  
subset(mtcars, cylinders>4)



### Factors
#### Understanding factors{-}
# Factors are so-called __*derived data types*__.
# They are normally __used to group variables into a fixed number of unique categories or levels__. For example, a data set may be grouped by gender or month of the year. Such data are usually loaded into R as a numeric or character data type requiring that they be converted to a factor using the ```as.factor()``` function.
# 
# In the following chunk of code, we create a factor from a character object.


a      <- c("March","February","February","November","February","March","March","March","February","November")
fact <- as.factor(a)

#Note that ```a``` is of __character data type and ```fact``` is the factor representation of ```a```__.

typeof(a)

#However, the derived object ```fact``` is now stored as an integer!
  
typeof(fact)

#Yet, when displaying the contents of ```fact``` we see character values.

fact

#__*How can this be?*__ 
#Well, ```fact``` is a __*more complicated object*__ than the simple objects created thus far in that the factor is storing additional information not seen in its output. This hidden information is stored in attributes. To view these hidden attributes, use the ```attributes()``` function.

attributes(fact)


#__There are two attributes of the factor object ```fact``` : levels and class.__ The __levels attribute__ lists the three unique values in ```fact```. The order in which these levels are listed reflect their __*numeric* representation__. So in essence, ```fact``` is __storing each value as an integer that points to one of the three unique levels__.

#__*So why doesn’t R output the integer values when we output ```fact```?*__ To understand why, we first need to know that when we call the object name, R is wrapping that object name with the print command, so the following lines of code are identical.

fact
print(fact)

#The ```print``` function then looks for a class attribute in the object. The class type instructs the print function on how to generate the output. Since ```fact``` has a factor class attribute (```fact``` is the factor object of ```a```), the print function is instructed to replace the integer values with the level “tags”. 

#Naturally, this all happens behind the scenes without user intervention.

#Another way to determine ```fact```’s class type is to call the class function.


class(fact)

#The unique levels of a factor, and the order in which they are stored can be extracted using the levels function.

levels(fact)

#Remember, the order in which the levels are displayed match their integer representation.

#Note that if ```a``` class attribute is not present (if it is not the ```fact``` factor of ```a```), the class function will return the object’s data type (though it will not distinguish between integer and double).

class(a)

#In such a case, the ```a``` object is treated as a generic element, it is not its factor representation with levels: ```fact```.

#To __*appreciate the benefits of a factor we’ll first create a data frame*__. One column will be assigned the ```fact``` factor and another will be assigned some random numeric values.

x      <- c(166, 47, 61, 148, 62, 123, 232, 98, 93, 110)
dat_fact    <- data.frame(min_sunshine = x, month = fact)
dat_fact

#The month column is now a factor with three levels: F, M and N. We can use the ```str()`` function to view the data frame’s structure as well as its columns classes.

str(dat_fact)

#Many __functions__ other than print will __*recognize factor data types and will allow you to split the output into groups defined by the factor’s unique levels*__. For example, to create three box plots of the value min_sunshine (we will learn more about box plots later), one for each month group F, M and U, type the following:

boxplot(min_sunshine ~ month, dat_fact, horizontal = TRUE)


#The tilde ```~``` operator is used in the plot function to split (or condition) the data into separate plots based on the factor gender.

#### Rearranging level order{-}

#__*A factor will define a hierarchy for its levels*__. When we invoked the levels function in the last example, you may have noted that the levels output were ordered F, M and N–this is the __level hierarchy__ defined for months (i.e. F>M>N ). This means that regardless of the order in which the factors appear in a table, __*anytime a plot or operation is conditioned by the factor, the grouped elements will appear in the order defined by the levels’ hierarchy*__. When we created the box plot from our ```dat_fact``` object, the plotting function ordered the box plot (bottom to top) following months’s level hierarchy (i.e. F first, then M, then N).

#If we wanted the box plots to be plotted in a __different order__ (i.e. N first followed by F then M) we would need to __modify the month__ column by __*releveling*__ the factor object as follows:

dat_fact$month <- factor(dat_fact$month, levels=c("November","February","March"))
str(dat_fact)

#The factor function is given the original factor values (dat_fact$months) but is also given the levels in the new order in which they are to appear(```levels=c("November","February","March")```). Now, if we recreate the box plot, the plot order (plotted from bottom to top) will reflect the new level hierarchy.

boxplot(min_sunshine ~ month, dat_fact, horizontal = TRUE)

