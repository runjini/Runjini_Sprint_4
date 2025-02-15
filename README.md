# Ward Village Facebook Post Analysis

**Author:** Runjini Murthy

__*Project Description:*__
Skill Story: As a budding marketing data analyst, I need to understand how to utilize libraries/packages so that I have alternative methods to perform social media campaign analysis other than Excel.

This project is intended to easily pull Facebook data and analyze it using the R package RFacebook.  This reduces some of the manual work required when downloading data from Facebook Insights; namely how engagement data (comments, likes, shares) comes through in merged fields in an Excel file.  To replace this tedious work, this project uses information from the Facebook developer area (namely, a key and secret to build a token) to extract data from public Facebook pages' posts.  All public Facebook pages can be analyzed in this way; the IDs for public Facebook page are available at: https://findmyfbid.com/.

Additionally, the specific task at hand is to analyze the engagement level of posts, on average, for every hour in a 24-hour cycle in order to determine highest user engagement based on the hour we posted to Facebook.

Key functions in this exercise include:
* Installing RFacebook
* Using a token to log in to RFacebook [Note: Token information is removed from the accompanying script file.]
* Parsing timestamp date to be able to group post engagement by posting hour.
* Plot the average engagement of posts by posting hour.

Final plot outcome:

![Final ggplot of plot hours with highest engagement][image-file]

[image-file]: https://github.com/runjini/Runjini_Sprint_4/blob/master/Supporting%20Documents/ggplot-highest-engagement-plot-hours.jpg?raw=true "Final ggplot of plot hours with highest engagement"
