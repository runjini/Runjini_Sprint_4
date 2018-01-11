# Ward Village Facebook Post Analysis

**Author:** Runjini Murthy

__*Project Description:*__
Skill Story: As a budding marketing data analyst, I need to understand how to utilize libraries/packages so that I have alternative methods to perform social media campaign analysis other than Excel.

This project is intended to easily pull Facebook data and analyze it using the R package RFacebook.  This reduces some of the manual work required when downloading data from Facebook Insights; namely how engagement data (comments, likes, shares) comes through in merged fields in an Excel file.  To replace this tedious work, this project uses the Facebook API and the ability to extract data from public Facebook pages to pull data on posts.  

Key functions:

`` install.packages('Rfacebook')
library("Rfacebook") ``

`` myoauth <- fbOAuth(app_id='Facebook-id', app-secret='Facebook-secret')
save(myouath, file="myoauth")
load("myoauth")
me <- getUsers("me", token = myoauth)
me$name ``

`` getpagedata <- getPage (310668279073583, token = myoauth, n = 250)``

`` View(getpagedata)``

``unique(getpagedata[['story']])``

``unique(getpagedata[['type']])``

``max(getpagedata[['likes_count']])
topfblikes <- subset(getpagedata, likes_count > 99)
View(topfblikes)``

``max(getpagedata[['comments_count']])
topfbcomments <- subset(getpagedata, comments_count > 10)
View(topfbcomments)``

``max(getpagedata[['shares_count']])
topfbshares <- subset(getpagedata, shares_count > 30)
View (topfbshares)``

``unique(getpagedata[['story']])``

``unique(getpagedata[['type']]) ``

### Next Steps
Outstanding questions:
* How do I filter for 2017 posts only? (A subset function off of created_time is running into issues with the T00:00:00 text.)
* How can I bucket the posts into certain groups of content to make conclusions about what content performs well?
* How can I add paid post/paid ad data?
* What are the top performing pieces of content by type?
* How do I take this project to the next level?
