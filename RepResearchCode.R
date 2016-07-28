#Data is being loaded 
filename <- "~/data/RepResearch/activity.csv"
stepdata <- read.csv(filename,header = TRUE)

#Histogram of total num of steps taken by day

hist(x = tapply(stepdata$steps, stepdata$date, FUN = sum, na.rm = TRUE), xlab = "Steps Taken each Day", main = "Frequency of Steps Taken each Day")

#Mean and Median of steps taken each day
daymean <- mean(tapply(stepdata$steps, stepdata$date, FUN = sum, na.rm = TRUE), na.rm = TRUE)
daymedian <- median(tapply(stepdata$steps, stepdata$date, FUN = sum, na.rm = TRUE), na.rm = TRUE)
#print("The mean of steps taken every day is ",daymean)
#print("The median of steps taken every day is ",daymedian)

#Time Series Plot
stepdata$date <- as.Date( stepdata$date, '%m/%d/%Y')
timeseries <- aggregate(stepdata$steps ~ stepdata$interval, FUN = mean)
plot(timeseries, type = "l", xlab = "5 minute Interval", ylab = "Steps in 5 minute Interval", main = "Average steps taken during 5 Minute Intervals")

#Which Interval has the most steps on average?
topinterval <- max(timeseries, na.rm = TRUE)

#imput the means into NAs
#?#imputdata = transform(stepdata, y = ifelse(is.na(stepdata$steps), mean(stepdata$steps, na.rm=TRUE), stepdata$steps))
datesubset <- split(stepdata, stepdata$date)
str(datesubset)

nastep <- is.na(stepdata$steps)

#?#tapply(stepdata, mean)



#histogram of inputted data

#replace with weekdays

