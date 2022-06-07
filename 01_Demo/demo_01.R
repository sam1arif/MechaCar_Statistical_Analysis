demo_table <- read.csv(file = "demo.csv", check.names = F, stringsAsFactors = F)

# Load jsonlite package
library(jsonlite)

# Load json file
demo_table2 <- fromJSON(txt = "demo.json")

x <- c(3, 3, 2, 3, 5, 5, 8, 8, 9)
x[3]

# Select the third row of the year column
demo_table[3, "Year"]

# Second way of selecting the third row of year column in demo_table
demo_table[3, 3]

# Third way of way of selecting the third row of year column in demo_table
demo_table$"Vehicle_Class"

# Select an index
demo_table$"Vehicle_Class"[2]

# Filter out used car data
filter_table <- demo_table2[demo_table2$price > 10000,]


# Another method to subset dataframes, documentaiton.
?subset()

# Elaborate subset from our used car data (filter by price and drivetrain)

filter_table2 <- subset(demo_table2, price > 10000 & drive == "4wd" & "clean" %in% title_status)
filter_table2

filter_table3 <- demo_table2[("clean" %in% demo_table2$title_status) & (demo_table2$price > 10000) & (demo_table2$drive == "4wd"),]
filter_table3

# sample data in R
?sample()

# Sample a large vector and create a smaller vector
sample(c("cow", "deer", "pig", "chicken", "duck", "sheep", "dog"), 4)

# sampling two dimensional data
num_rows <- 1:nrow(demo_table)

# sample three of those rows
sample_rows <- sample(num_rows, 3)

# retrieve requested data
demo_table[sample_rows,]

# combine all three steps in one statement
demo_table[sample(1:nrow(demo_table), 3),]

# tidyverse
library(tidyverse)

# what does mutate() do? creates, modifies and deletes columns
?mutate()

# add columns to original data frame
demo_table <- demo_table %>% mutate(Mileage_per_Year=Total_Miles/(2020-Year),IsActive=TRUE) 

# grouping data and create summary table
summarize_demo <- demo_table2 %>% group_by(condition) %>% summarize(Mean_Mileage=mean(odometer), .groups = 'keep')

# create summary table with multiple columns to add maximum price for each condition and vehicles in category
summarize_demo <- demo_table2 %>% group_by(condition) %>% summarize(Mean_Mileage=mean(odometer),Maximum_Price=max(price),Num_Vehicles=n(), .groups = 'keep')

# Reshape data. gather() and spread() functions help reshape data
?gather()

# reshape
demo_table3 <- read.csv("demo2.csv", check.names = F, stringsAsFactors = F)

long_table <- gather(demo_table3,key="Metric",value="Score",buying_price:popularity)

# or alternatively
long_table <- demo_table3 %>% gather(key="Metric",value="Score",buying_price:popularity)

# what is spread()? it spreads a key-value pair across multiple columns
?spread()

wide_table <- long_table %>% spread(key="Metric",value="Score")

# check if our newly created wide-format table is exactly the same as our original demo_table3
all.equal(demo_table3, wide_table)

# reorder and sort columns of both data frames using order() and colnames()
table <-demo_table3[,order(colnames(wide_table))]

table <- demo_table3[,(colnames(wide_table))]

all.equal(demo_table3, wide_table)

# ggplot2
?ggplot()

head(mpg)

# bar plots, import dataset into ggplot2 and then plot a bar.
plt <- ggplot(mpg,aes(x=class)) 
plt + geom_bar()

# geom
?geom_bar()

# sumarize function, create summary table, import dataset into ggplot2 and plot a bar.
mpg_summary <- mpg %>% group_by(manufacturer) %>% summarize(Vehicle_Count=n(), .groups = 'keep')
plt <- ggplot(mpg_summary, aes(x=manufacturer, y=Vehicle_Count))
plt + geom_col() 

# change titles of our axes
plt + geom_col() + xlab("Manufacturing Company") + ylab("Number of Vehicles in Dataset") 

# plot a boxplot with labels that rotate 45 degrees
plt + geom_col() + xlab("Manufacturing Company") + ylab("Number of Vehicles in Dataset") + 
  theme(axis.text.x=element_text(angle=45, hjust=1))

# line plot in ggplot2
mpg_summary <- subset(mpg,manufacturer=="toyota") %>% group_by(cyl) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep') 
plt <- ggplot(mpg_summary,aes(x=cyl,y=Mean_Hwy)) 
plt + geom_line()

# adjust x and y axes tick values, add labels. the scale_x_discrete function tells ggplot to use explicit values for the 
# the x axis tick.
plt + geom_line() + scale_x_discrete(limits=c(4,6,8)) + scale_y_continuous(breaks = c(15:30)) 

# import dataset to ggplot2 and create scatterplot
plt <- ggplot(mpg, aes(x=displ,y=cty))
plt + geom_point() + xlab("Engine Size (L)") + ylab("City Fuel-Efficiency (MPG)")

# in the aes() function, below are the customizing effects:
#alpha changes the transparency of each data point
#color changes the color of each data point
#shape changes the shape of each data point
#size changes the size of each data point

# customize scatter plot. labs(x, y) is the alternative to xlabs and y labs
plt <- ggplot(mpg, aes(x=displ, y=cty,color=class)) 
plt + geom_point() + labs(x="Engine Size (L)", y="City Fuel-Efficiency (MPG)", color="Vehicle Class")

# more aesthetics
plt <- ggplot(mpg, aes(x=displ, y=cty, color=class, shape=drv)) 
plt + geom_point() + labs(x="Engine Size (L)", y="City Fuel-Efficiency (MPG)", color="Vehicle Class",shape="Type of Drive")

# boxplot
plt <- ggplot(mpg, aes(y=hwy))
plt + geom_boxplot()

#import dataset into ggplot2
plt <- ggplot(mpg, aes(x=manufacturer, y=hwy))

# add boxplot and rotate x axis labels 45 degrees
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45, hjust=1))


# heatmap plots
mpg_summary <- mpg %>% group_by(class,year) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep')
plt <- ggplot(mpg_summary, aes(x=class,y=factor(year),fill=Mean_Hwy))
plt + geom_tile() + labs(x="Vehicle Class",y="Vehicle Year",fill="Mean Highway (MPG)")


# heatmap with labels
mpg_summary <- mpg %>% group_by(model,year) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep')
plt <- ggplot(mpg_summary, aes(x=model,y=factor(year),fill=Mean_Hwy))
plt + geom_tile() + labs(x="Model",y="Vehicle Year",fill="Mean Highway (MPG)") + 
theme(axis.text.x = element_text(angle=90,hjust=1,vjust=.5))

# add layers to scatter plot, overlay scatter plot on top
plt <- ggplot(mpg,aes(x=manufacturer,y=hwy)) 
plt + geom_boxplot() + 
theme(axis.text.x=element_text(angle=45,hjust=1)) +
geom_point()


# scatter plot
mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ), .groups = 'keep')
plt <- ggplot(mpg_summary,aes(x=class, y=Mean_Engine))
plt + geom_point(size=4) + labs(x="Vehicle Class", y="Mean Engine Size")

# scatterplot overlay with error bars
mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ), SD_Engine=sd(displ), .groups = 'keep')
plt <- ggplot(mpg_summary,aes(x=class,y=Mean_Engine)) 
plt + geom_point(size=4) + labs(x="Vehicle Class", y="Mean Engine Size") + 
geom_errorbar(aes(ymin=Mean_Engine-SD_Engine, ymax=Mean_Engine+SD_Engine))


# convert to long format
mpg_long <- mpg %>% gather(key="MPG_Type",value="Rating",c(cty,hwy))
head(mpg_long)

# visualize the different vehicle fuel efficiency ratings by manufacturer
plt <- ggplot(mpg_long, aes(x=manufacturer, y=Rating,color=MPG_Type)) 
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45, hjust=1)) 


#facet_wrap() wraps 1d ribbon of panels into 2d
?facet_wrap()

#for example to facet the same viz
plt <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=MPG_Type))
plt + geom_boxplot() + facet_wrap(vars(MPG_Type)) +
theme(axis.text.x=element_text(angle=45,hjust=1),legend.position = "none") + xlab("Manufacturer")


#qualitative test for normality with mtcars dataset to check their distribution by weight using density plot.
ggplot(mtcars, aes(x=wt)) + geom_density()

#quantitative test for normality using shapiro.test(). 
?shapiro.test()

shapiro.test(mtcars$wt)

# sample_n() is used to sample two dimensional objects
?sample_n()

# import used car dataset, import the dataset into ggplot2 and then visualize distribution using density plot
population_table <- read.csv('used_car_data.csv',check.names = F,stringsAsFactors = F) 
plt <- ggplot(population_table,aes(x=log10(Miles_Driven))) 
plt + geom_density() 


# randomly sample 50 data points
sample_table <- population_table %>% sample_n(50)
plt <- ggplot(sample_table, aes(x=log10(Miles_Driven)))
plt + geom_density()

# t test
?t.test()

# compare sample vs population means
t.test(log10(sample_table$Miles_Driven), mu=mean(log10(population_table$Miles_Driven)))


# two sample t test. generate 50 randomly sampled data points, and then generate another one.
sample_table_num <- population_table %>% sample_n(50)
sample_table2_num <- population_table %>% sample_n(50)

# now compare means of the two samples
t.test(log10(sample_table$Miles_Driven),log10(sample_table2$Miles_Driven))

#import mpg_modified dataset, select only data points where the year is 1999 and select only data points where the year is 2008
mpg_data <- read.csv('mpg_modified.csv') 
mpg_1999 <- mpg_data %>% filter(year==1999) 
mpg_2008 <- mpg_data %>% filter(year==2008)


# compare mean difference between two samples again
t.test(mpg_1999$hwy, mpg_2008$hwy, paired = T)


# use aov() function for one way or two way anova test
?aov()

#filter columns from mtcars dataset and convert numeric column to factor and compare means across all levels
mtcars_filt <- mtcars[,c("hp","cyl")]
mtcars_filt$cyl <- factor(mtcars_filt$cyl)
aov(hp ~ cyl, data=mtcars_filt)

# to get p values warp aov function with summary functions
summary(aov(hp ~ cyl, data=mtcars_filt))


# combine geom_function() function with cor() function to figure out correlation
?cor()

head(mtcars)

# import dataset to ggplot2, create scatterplot and calculate correlation coefficient
plt <- ggplot(mtcars,aes(x=hp,y=qsec))
plt + geom_point() 

cor(mtcars$hp,mtcars$qsec)

# use another dataset
used_cars <- read.csv('used_car_data.csv',stringsAsFactors = F)
head(used_cars)

plt <- ggplot(used_cars,aes(x=Miles_Driven,y=Selling_Price))
plt + geom_point() 

# get Pearson correlation coefficient
cor(used_cars$Miles_Driven,used_cars$Selling_Price)

# convert data frame into numeric matrix
used_matrix <- as.matrix(used_cars[,c("Selling_Price","Present_Price","Miles_Driven")])
cor(used_matrix)

#create linear model
lm(qsec ~ hp, mtcars)

#summarize linear model
summary(lm(qsec~hp, mtcars))

#create linear model and determine y-axis values from linear model then create linear model line scatter plot
model <- lm(qsec ~ hp,mtcars) 
yvals <- model$coefficients['hp']*mtcars$hp +
model$coefficients['(Intercept)'] 

plt <- ggplot(mtcars,aes(x=hp,y=qsec))
plt + geom_point() + geom_line(aes(y=yvals), color = "red")


# multiple linear model regression
lm(qsec~mpg + disp + drat + wt + hp, data=mtcars)

# generate summary statistics
summary(lm(qsec~mpg + disp + drat + wt + hp, data=mtcars))
