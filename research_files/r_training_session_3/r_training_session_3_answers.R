# Tasks
## 1.
### a.
iris[14,]

### b.
iris[,4]

### c.
iris[120, 2]

### d.
iris[c(4,6,10,12),]

### e.
iris[c(111:113), "Species"]

## 2.
### a.
identical(iris$Petal.Length[9], iris$Petal.Length[13])

### b.
identical(iris$Sepal.Length[145], iris$Sepal.Length[146])

### c.
identical(iris$Sepal.Length[150], iris$Petal.Length[103])

### d.
identical(iris$Sepal.Width[13], iris$Sepal.Width[108])

### e.
identical(50/55, 10/12)
#OR
all.equal(50/55, 10/12)

### f.
all.equal(50/55, 10/12, tolerance = 0.1)

## 3.
### a.
x<-1:10
y<-11:20

rbind(x,y)->xy.rbind

### b.
cbind(x,y)->xy.cbind

# Tasks
## 1.
### a.
iris -> iris2

paste("flower", colnames(iris2), sep="_")->colnames(iris2)

### b.
iris2$flower_Species -> iris2$flower_Species2

### b.
iris2$num <- seq(from = 4, to = 600, by = 4)

# Tasks
## 1.
### a.
a <- 1:20
b <- 40:21

plot(b~a)

### b.
plot(b~a, xlab="Independent Variable", ylab="Dependent Variable")

### c.
plot(b~a, xlab="Independent Variable", ylab="Dependent Variable", xlim=c(1,40), ylim=c(1,40))

### d.
plot(b~a, xlab="Independent Variable", ylab="Dependent Variable", xlim=c(1,40), ylim=c(1,40), 
     pch=5, cex=1.5, col=c("red", "orange", "yellow", "green", "blue"))

### e.
plot(b~a, xlab="Independent Variable", ylab="Dependent Variable", xlim=c(1,40), ylim=c(1,40), 
     pch=6, cex=1.5, col=c("red", "orange", "yellow", "green", "blue"))
legend("topright", c("A", "B", "C", "D", "E"), pch=6, col=c("red", "orange", "yellow", "green", "blue"))

### f.
abline(h=30, col="gray", lty=2, lwd=2)

### g.
abline(v=10, col="purple", lty=3, lwd=2)

### h.
text(x = 14, y= 32, "Cross Point", cex=1.5, col="royalblue")

## 2.
### a., c.
#I have made a mistake here for c., I want the x-axis to be 4-8 and y-axis to be 0-8
plot(iris$Sepal.Width ~ iris$Sepal.Length, xlab="Sepal length (cm)", ylab="Size (cm)", 
     col="red", pch=2, xlim=c(4,8), ylim=c(0,8))
points(iris$Petal.Length ~ iris$Sepal.Length, col="blue", pch=19)
points(iris$Petal.Width ~ iris$Sepal.Length, col="orange", pch=5)

### b.
legend("topleft", c("Sepal Width", "Petal Length", "Petal Width"), col=c("red", "blue", "orange"), pch=c(2,19,5))

### d.
par(mar = c(6, 5, 5, 3))
plot(iris$Sepal.Width ~ iris$Sepal.Length, xlab="Sepal length (cm)", ylab="Size (cm)", 
     col="red", pch=2, xlim=c(4,8), ylim=c(0,8))
points(iris$Petal.Length ~ iris$Sepal.Length, col="blue", pch=19)
points(iris$Petal.Width ~ iris$Sepal.Length, col="orange", pch=5)
legend("topleft", c("Sepal Width", "Petal Length", "Petal Width"), col=c("red", "blue", "orange"), pch=c(2,19,5))

### e.
pdf("irisplot.pdf")
par(mar = c(6, 5, 5, 3))
plot(iris$Sepal.Width ~ iris$Sepal.Length, xlab="Sepal length (cm)", ylab="Size (cm)", 
     col="red", pch=2, xlim=c(4,8), ylim=c(0,8))
points(iris$Petal.Length ~ iris$Sepal.Length, col="blue", pch=19)
points(iris$Petal.Width ~ iris$Sepal.Length, col="orange", pch=5)
legend("topleft", c("Sepal Width", "Petal Length", "Petal Width"), col=c("red", "blue", "orange"), pch=c(2,19,5))
dev.off()

## 3.
### a.-c.
jpeg("iriscomposite.jpg", width = 800, height = 800, units = "px", res = 200, pointsize = 6)
par(mar=c(5.1, 4.1, 3.1, 2.1))
layout(matrix(c(2, 2, 1, 3), 2, 2, byrow=TRUE))

boxplot(iris$Petal.Length ~ iris$Species, col=c("red", "blue", "green"))

hist(iris$Petal.Length, breaks=6, col=c("red", "orange", "yellow", "green", "blue", "purple"))
abline(v=mean(iris$Petal.Length), col="gray", lty=2, lwd=2)
text(mean(iris$Petal.Length), 54, "Mean=3.758", xpd=T)

plot(subset(iris$Petal.Length, iris$Species == "virginica") ~ subset(iris$Petal.Width, iris$Species == "virginica"), 
     xlab="Petal Width (cm)", ylab="Petal Length (cm)")
abline(lm(subset(iris$Petal.Length, iris$Species == "virginica") ~ 
            subset(iris$Petal.Width, iris$Species == "virginica")))

dev.off()
