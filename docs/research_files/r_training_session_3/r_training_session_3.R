# SESSION 3 - Manipulating and Plotting Data

# Set up----
'
Descripition: R Course Sessioon 2
Date: November 2022
Author: Rebecca G. Smith and Emma Walker 
Adapted by: Laura Roldan-Gomez
'

# Working directory

setwd("/Users/roldix/Library/Mobile Documents/com~apple~CloudDocs/GitHub_Repos/R-Training/r_training_session_3")

 
# Data
data(iris)


# 1. Data exploration----

# When we load in our data, we need to explore and manipulate it to get it into the format we require. These easy to use tools help us with these tasks. 
 
## Subsetting ----

# tools to select parts of the data using square brackets [ ]. These brackets allow us to select based on position and name. To use them, we need to know how many dimensions the data has. 

# a vector has one dimension, 
# a data frame or matrix, has two. 

# This also informs how many arguments (separated by a comma) the brackets require for selection.

# Using a vector, we only need to give one selection and no comma
test <- 1:10

# Select the first value in the vector "test"
test[1]

# Using a matrix or data frame, we need to give two selections with a comma [row,column]

# To select the value in the first row and second column
iris[1, 2]

# select the first row
iris[1, ]

# select the third column
iris[, 3]

# Below we select the values in the 5th, 6th, 7th and 8th row and the first three columns
iris[5:8, 1:3]

# Using "c()", select the values in the 3th, 8th and 10th row and the 2nd and 4th
iris[c(3, 8, 10), c(2, 4)]

 # Using column name "Sepal.Width" to select values in this column, in the first three rows
iris[1:3, "Sepal.Width"]


# In data frames, we can use the "$" to select values in individual columns (this will not work in matrices). 

# Select the values in the column Petal.Length
iris$Petal.Length


## Matching ----

# Using identical(), we can check if values or collections of values are identical.
 
# Checking if the 1st and 2nd row values in the "Species" column of iris are identical
identical(iris$Species[1], iris$Species[2])

# Checking if the 1st and 51st row values are identical
identical(iris$Species[1], iris$Species[51])

 
# all.equal() is similar to identical(), but allows for some tolerance in how similar values can be. 

# We may want to check two numbers with lots of decimal places, but only need them to be within 0.01 of each other.
 
x1 <- 1.232529
x2 <- 1.23366
all.equal(x1, x2, tolerance=0.01)
all.equal(x1, x2, tolerance=0.0001)

 
# We can use "==" to pull all the matches. We can give a numeric value or a character in quotations.

iris[iris$Species == "setosa", ] # the comma means that you are selecting all the columns

# you can save it as a new subset
newdata <- iris[iris$Species == "setosa", ] 

# We can use objects or parts of objects to select rows and columns within [ ] using the "%in%".   
 
select <- "versicolor"
iris[iris$Species %in% select, ]


## Merging and binding----
 
# We will often need to bring multiple two-dimensional objects together. 

# Using rbind() and cbind(), we can combine objects together. rbind() allows us to bind together rows.
 
# First we look at the dimension of "iris"

dim(iris)

# Using rbind() to put together two copies of  causing double rows
rbind(iris, iris) -> iris.r
dim(iris.r)
iris.r[ ,1]

 
# cbind() allows us to bind together columns.
cbind(iris, iris) -> iris.c
iris.c[1,]


# Using merge(), we can join objects telling R how to do so. For example, we can bind using the rownames of our objects to merge by a specific column present in both objects (e.g. by = "Name"), or different columns in each object (by.x = "Species", by.y = "Name").
 
# Merging iris with itself by row names
merge(iris, iris, by = "row.names") -> iris.double
dim(iris.double)
iris.double[1, ]

## Tasks----

# 1. Display the following from "iris"
#     a. 14th row
#     b. 4th column
#     c. 120th row of 2nd column
#     d. 4th, 6th, 10th and 12th row
#     e. 111th, 112th and 113th row of "Species" column  

# 2. Work out if the following match
#     a. 9th and 13th row of "Petal.Length"
#     b. 145th and 146th row of "Sepal.Length"
#     c. 150th row of "Sepal.Length" and 103rd row of "Petal.Length"
#     d. 13th and 108th row of "Sepal.Width"
#     e. 50 divided by 55 and 10 divided by 12
#     f. 50 divided by 55 and 10 divided by 12 to a tolerance of 0.1
 
# 3. Create two objects, one containing numbers 1-10, one containing numbers 11-20
#     a. Bind them together to make an object of two rows, row 1 being 1:10, row 2 being 11-20
#     b. Bind them together to make an object of two columns, columns 1 being 11-20, column 2 being 1-10



# 2. Data manipulation----
 
## Paste----

# This function concatenates vectors and can be applied to characters or numbers, vector and column(s) of a data frame or matrix. 

# Adding text to a value in iris
paste("Species", iris$Species[1])

# You can define the separator (sep =), or use paste0() or paste() with sep = "" for no space. You can also give text to add to a character or vector.

# Pasting together two columns of iris
paste(iris$Species[1:10], iris$Sepal.Length[1:10], sep = ":")


## Renaming columns and rows----
iris -> iris2
colnames(iris2)
colnames(iris2) <- c("S.Length", "S.Width", "P.Length", "P.Width", "Type")
colnames(iris2)

 
## Adding and removing variables----
iris -> iris2
iris2$new.column <- 1:nrow(iris2)

 
# Removing a column can be done by using the "NULL" value. on the column of interest.
# 

### Removing a column----
iris2$new.column <- NULL

 
## Sequences: seq()----

# Create a sequence from 0 to 100 increasing by 5 each time
seq(from = 0, to = 100, by = 5)

#### Tasks----

# 1. Create a copy of "iris"
#     a. Rename the columns of "iris" by prefixing with the word "flower" and the separator "_"
#     b. In your copy, duplicate the "Species" column
#     c. Add a column to your copy which contains numbers between 4 and 600 increased by 4 each time


#---------------------------------#

# 3. Basic visualisations----
 
## Types of plots----

# R will automatically try and plot the most appropriate plot for the data provided. 
plot(iris) # some find this useful
 
# There are also many arguments we can give to R for the plots we want to make.
plot(iris, 
     col = c("red", "blue", "#ddaa33")[as.numeric(iris$Species)],
     pch = c(1, 2, 3)[as.numeric(iris$Species)], cex = 0.8)


# Box plots can be made using the boxplot() function. It uses a lot of the standard plotting functions.

plot(iris$Sepal.Length ~ iris$Species, 
     ylab = "Sepal Length (cm)", 
     xlab = "Species", 
     col =  c("red", "blue", "#ddaa33"))

 
# hist() allows us to plot the frequency of a vector.
hist(iris$Sepal.Length)

# Plotting "Sepal.Length" with 16 bins
hist(iris$Sepal.Length, breaks = 16)

# Below you can see a table containing a lot of basic plotting arguments. Also, for colour selection, making colour themes and looking for colour blind options, you can use https://www.colorhexa.com/ which will give you R friendly colour codes.
# 

read.csv("plotting table.csv", header = T)->plots


## Plots on plots----

# We can add more data to a plot.

# Plot "Sepal.Length" on a plot, 
plot(iris$Sepal.Length, ylim = c(0, 8), ylab = "Size (cm)", xlab = "Sample")

# then add "Sepal.Width" data as points using points() 
points(iris$Sepal.Width, col = "red", pch = 19, cex = 0.8)

# and "Petal.Length" as lines using lines()
lines(iris$Petal.Length, lty = 2, col = "blue")

 
# using abline(), you can add horizontal lines (h=), vertical lines (v=), diagonal or correlations (x, y). 

# Adding a horizontal line at 6 and a vertical line at 60
plot(iris$Sepal.Length)
abline(h = 6, col = "red")
abline(v = 60, col = "blue")

# Plotting "Sepal.Length" against "Petal.Length" and adding a line of best fit
plot(iris$Sepal.Length ~ iris$Petal.Length)

abline(lm(iris$Sepal.Length ~ iris$Petal.Length), lty = 3, col = "green", lwd = 3)


## Plot additions----

# Add a legend to our plot using legend(). The legend() function allows us to define position, either by using x, y coordinates or position such as "topleft". We also provide the text, colours and background.
 
plot(iris$Sepal.Length, 
     col = c("red", "blue", "#ddaa33")[as.numeric(iris$Species)], 
     pch = c(1, 2, 3)[as.numeric(iris$Species)])

legend("topleft", 
       legend = c("Setosa", "Versicolor", "Virginica"), 
       pch = c(1,2,3), 
       col = c("red", "blue", "#ddaa33"))


# We can add text to a plot by using text() or mtext(). To use text(), we provide x, y coordinates, the text to be written (labels =), size (cex =), and colour (col =) and font (font =). 

# Using mtext() requires different arguments as it is relation to the margin side we put the text in. It requires the text (text = ), the side of the plot the text will go (side =) with 1 = bottom, 2 = left, 3 = top, 4 = right, the margin line to put the text on (line = ).
 
# Adding text to a plot
plot(iris$Sepal.Length)

text(20, 6, "text", 
     cex = 0.7, 
     col = "blue", 
     font = 2)

mtext("text", 
      side = 4, 
      line = 1, 
      col = "red")

# We can add axes or move and adjust the axes of a plot. For this, we use axis(), and may add the argument to plot() to remove axes from our plot (axes = F) so we can draw them. Arguments for axis() are which side you want the axis (side =) using 1 = below, 2 = left, 3 = above and 4 = right, the point at which tick-marks are drawn (at =), what the labels are (labels =), how far from the axis the ticks should extend (line =), the position of the axis (pos =) and if tick marks should be drawn (tick =). You can also change the line width (lwd =), colour (col =) and type of line (lty =).
 
# Plotting "Sepal.Length" without axes and adding them with adjustment
plot(iris$Sepal.Length, axes = F, ylab="Sepal Length (cm)")

axis(1)

axis(2, pos = 50, at = 1:8, lwd = 2, col = "blue")


# Additional functions to add to your plots are segments(), arrows(), curve(), rect(), polygon() and grid().

 
## Margins---- 
 
# Using par(), mar() and mgp() before the plot, we can adjust the margins of our plot. 

## mar() adjusts margins giving the number of lines of margin, by default c(5, 4, 4, 2) + 0.1 relating to bottom, left, top and right 

## mgp() sets the axis label locations relative to the edge of the inner plot window. The first value represents the location the axis label, the 2nd the tick-mark labels, and 3rd the tick marks. The default is c(3, 1, 0).

# las() defines the orientation of the tick mark labels and any other text added to a plot. The options are parallel to the axis (the default, 0), always horizontal (1), always perpendicular to the axis (2), and always vertical (3).


par(mar = c(4, 4, 2, 1), 
    mgp = c(2, 0.5, 0), 
    las = 1)

plot(iris$Sepal.Length, ylab="Sepal Length (cm)")


## Composites ----

# There are two options for making composite plots, or plots with multiple plots as panels. These are par(mfrow/mfcol =) and layout().

# The arguments for par(mfrow/mfcol =), allows us to define how many rows and columns to make the composite of. Using mfcol draws by columns and mfrow draws by rows.
 
par(mar = c(4, 4, 2, 1))
par(mfrow = c(1, 2))
plot(iris$Sepal.Length, ylab="Sepal Length (cm)")
plot(iris$Sepal.Width, ylab="Sepal Width (cm)")


# The arguments for layout() are more complicated but allows for unequal sizes of composite sections. The matrix argument allows you to define what plots (in the order of plotting under the layout function). The following two numbers are the number of rows and columns in our composite, respectively. The byrow argument, if true, will add plots by row, if false, it will add by column.

par(mar = c(4, 4, 2, 1))
layout(matrix(c(1, 1, 2, 3), 2, 2, byrow = TRUE))
plot(iris$Sepal.Length, ylab = "Sepal Length (cm)")
plot(iris$Sepal.Width, ylab = "Sepal Width (cm)")
plot(iris$Petal.Length, ylab = "Petal Length (cm)")


# 4. Saving and exporting plot----

# We can save our plots using the format function: (pdf()), (jpeg()), (png()) and (tiff()). 
# These functions, with their arguments, will appear before the plot information, and will be succeeded by dev.off(). 
# The first argument for any of these functions should be the path and file name to save the file under. 
# You can also define the size of the image (width =, height =, units =), background colour (bg =) and resolution (res =).  


# Saving a plot as a jpeg file
jpeg("exampleplot.jpg", width = 300, height = 300, units = "mm", bg = "white", res = 200)
plot(iris$Sepal.Length, ylab = "Sepal Length (cm)")
dev.off()


### Tasks----

# 1. Make two objects, one object containing values 1-20, and another object containing values 40-21
#     a. Using your objects, create a plot with the object containing 1:20 on the x-axis and the object containing 40-21 on y-axis
#     b. Change the x-axis label to "Independent Variable" and y-axis label to "Dependent Variable"
#     c. Expand both axes to show values 1-40
#     d. Increase the data point size, change their style and make them repeat between five colours
#     e. Add a legend top the top right of the plot showing the five colours you have chosen and labelling them A, B, C, D, and E
#     f. Add a horizontal line at 30, choose a colour, weight and style
#     g. Add a vertical line at 10, choose a different colour, weight and style
#     h. Add text saying "Cross Point" to the top right of the intersection of the two lines. Adjust the colour and size

# 2. Using "iris", create a scatter plot with "Sepal.Length" on x-axis, labelled "Sepal length (cm)", and the other three variables plotted on y-axis, with the label being "Size (cm)"
#     a. Colour the three species differently and make the three measures different style of points 
#     b. Add a legend to show all the groups, and make sure it doesn't cover any points
#     c. Make sure the x-axis limits are 0-8 and y-axis limit is 4-8
#     d. Adjust the margins to give a larger space around the edge of the plot and move the axis labels a little away from the axes
#     e. Export the image as a pdf
 
# 3. Create a composite plot with the following panels using "iris". Make the plots colourful and variable, that all points are visible in plotting window, axes have labels and measurement units. Export the plot as a high resolution (200) jpeg. Make sure the points and text are readable, and all info is visible. You may need to adjust margins

#     a. Box plot of "Petal.Length" by species coloured by species
    
#     b. Histogram of "Petal.Length" with 6 breaks, each one coloured differently, with a line added for the mean (hint: mean), coloured and labelled "Mean = X" where "X" is the mean value. Make this panel take more space
#     c. "Petal.Length" against "Petal.Width" for just "virginica" species, with a line of best fit (hint: subsetting)

