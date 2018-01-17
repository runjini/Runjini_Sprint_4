# This script shows how to install the Rfacebook library, set up a token to access, pull the past 250 posts from the public Ward Village account, and then write and read that dataset to a CSV on the local computer.

# How to install and access the R Facebook library.

install.packages('Rfacebook')
library("Rfacebook")

# In order to access data for either your individual Facebook account or data from a public page, a token must be used to access Facebook.  This assumes you have set up your account accordingly on the Facebook Developer page.

myouath <- fbOAuth(app_id='id',app_secret='id')
save(myouath, file="myoauth")
load("myoauth")
me <- getUsers("me", token = myouath)
me$name

# In order to get a view of the Facebook post data, use the getPage function and set to a table named "getpagedata."

getpagedata <- getPage (310668279073583, token = myouath, n = 250)

# View getpage data in R Studio.

View(getpagedata)

# Write the dataset to a file on your local machine.

write.csv(getpagedata, "/Users/runjini.murthy/Desktop/GitHub/Runjini_Sprint_4/last-250-wv-fb-posts-Rfacebook.csv")

# Read the newly created .CSV dataset in R

WVFBData <- read.csv(file="/Users/runjini.murthy/Desktop/GitHub/Runjini_Sprint_4/last-250-wv-fb-posts-Rfacebook.csv", header=TRUE, sep=",")

# View the WVFBData dataset

View(WVFBData)

# Create a "total engagements" column, that combines likes plus comments plus shares.

WVFBData$total_engagement<-WVFBData$likes_count + WVFBData$comments_count + WVFBData$shares_count

# Install parsedate package to parse date and time in created_time column. Goal is to group posts by hour from the time column.
install.packages("parsedate")

library(parsedate)

# Create a new column in dataset that reformats the date and time from the created_time column.

WVFBData$parsed_timestamp <- parse_iso_8601(WVFBData$created_time)
View (WVFBData)

# Install chron package for date/time column split.  (THIS MIGHT NOT BE NECESSARY.)

install.packages("chron")
library(chron)

# Parse the created_time column into the date, time, and the singular posting hour for further analysis.  View to see new columns.

WVFBData$parsed_date <- format(WVFBData$parsed_timestamp, "%m/%d/%y")
WVFBData$parsed_time <- format(WVFBData$parsed_timestamp, "%H:%M")
WVFBData$post_hour <- format(WVFBData$parsed_timestamp, "%H")
View (WVFBData)

# Realized that the timestamps were in the incorrect timezone, so adjusted the columns and created a time-adjusted timestamp.  To adjust the timestamp, you have to add or subtract seconds, as the timestamp is based on the seconds elapsed since 1970.

WVFBData$adjusted_timestamp <- WVFBData$parsed_timestamp - 10*60*60
WVFBData$parsed_date <- format(WVFBData$adjusted_timestamp, "%m/%d/%y")
WVFBData$parsed_time <- format(WVFBData$adjusted_timestamp, "%H:%M")
WVFBData$post_hour <- format(WVFBData$adjusted_timestamp, "%H")
iew(WVFBData)
write.csv(WVFBData, "/Users/runjini.murthy/Desktop/GitHub/Runjini_Sprint_4/last-250-wv-fb-posts-Rfacebook.csv")

# For filtering, install dplyr package.

install.packages("dplyr")
library(dplyr)

# As an example, create a filter of the dataset that has only those posts from the midnight hour.

twelveam <- filter(WVFBData, post_hour == "00")

# Test out calculations using mean function

mean(twelveam$likes_count)
mean(twelveam$shares_count)
mean(twelveam$comments_count)

# Plot average of total engagements column for each post hour (THIS IS NOT CORRECT; SEEMS TO BE SHOWING SUM RATHER THAN MEAN)

ggplot(WVFBData) + geom_bar(aes(x=post_hour,y=total_engagement),stat="summary", fun.y = "mean",fill=I("grey50"))
