#daily Add-Ons -- new packages and functions
getwd()

#******************************Hmisc package**********************************
install.packages("Hmisc", dependencies = T) #Useful for 'categorical data'
library(Hmisc)

help(package = 'Hmisc') #details on the functions available
describe(iris)

#******************************psych package**********************************
install.packages('psych', dependencies = T) #Useful for 'numerical data'
library(psych)

help(package = 'psych')
describeBy(iris, group = iris$Species)
describeData(iris)

#******************************detach and remove package**********************
#first detach and then remove package.
detach('package:psych', unload = T)
remove.packages('psych')

#*****************************barcharts with text funtion*********************
#tapply() : tapply(vector, index, function)
tapply(iris$Sepal.Length, iris$Species, mean) #mean Sepal.Length across Species
tapply(iris$Petal.Length, iris$Species, mean) #mean Petal.Length across Species

tapply(iris$Sepal.Length, iris$Species, sd) #sd of Sepal.length across Species
tapply(iris$Petal.Length, iris$Species, sd) #sd of Petal.Length across Species

a <- tapply(iris$Sepal.Length, iris$Species, median)
barplot(a)

#*****************************merge dataframes********************************
#note: join is more flexible than merge. join keeps the row order, merge doesn't
head(mtcars)
summary(mtcars$mpg)
summary(mtcars$gear)

mtcars.first <- mtcars[mtcars$mpg > 20.09,]
mtcars.second <- mtcars[mtcars$gear > 3,]

#intersection
intersection <- merge(mtcars.first, mtcars.second, rown) #merge
i2 <- mtcars[(mtcars$mpg>20.09 & mtcars$gear >3),] #same result without merge

  #checking if the two dataframes are equal or not
  all.equal(intersection,i2) #one way of comparing 2 df's
  identical(intersection,i2) #another way of comparign 2df's

#union / full join
merge(mtcars.first, mtcars.second, all = T)
rbind(mtcars.first, mtcars.second)

#left merge / left outer join
merge(mtcars.first, mtcars.second, all.x = T)

#right merge / right outer join
merge(mtcars.first, mtcars.second, all.y = T)

#***************************creating bins(range)************************
head(mtcars)
summary(mtcars$mpg)
b <- cut(mtcars$mpg, breaks = 10)
mtcars$bins <- b #imputing a new column to our df 'mtcars'
View(mtcars)

#***************************sorting columns in a df************************
head(mtcars)
mtcars[order(mtcars$mpg),] #single column sort
order.mtcars <- order(mtcars$mpg,mtcars$cyl) #mutiple columns sort
mtcars[order.mtcars,]

