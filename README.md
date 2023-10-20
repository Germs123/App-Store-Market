# App-Store-Market

## App Store App Analysis

## Project Overview
I am a junior analyst for a stakeholder who is an aspiring app developer who needs data-driven insights to decide what type of app to build.

## ASK
1. What app categories are most popular?
2. What price should I set?
3. How can I maximize user ratings?

## Prepare
Our stakeholder encourages me to use public data on Kaggle that explores various app information including: app names, size, ratings, supporting devices, supporting languages and descriptions. 

## Process
The tools used for the cleaning, analysis and sharing are SQLite.com: SQL and Google Sheets
I first begin by connecting the dataset using SQLite that allows me to work with my data directly online with no installations required for software or setting up databases. SQLite.com allows me to upload files with a maximum size of four megabytes. I split the large CSV files into four smaller files under the four megabyte limit to then seamlessly combine files into one CSV file within SQLite using UNION ALL feature. 
* No missing data was found between two tables
* No missing values in key fields of tables
* No missing values for combined apple store description tables

## Analyze
Recall our objectives
1. What app categories are most popular?
2. What price should I set?
3. How can I maximize user ratings?

Assumptions for Analysis:
* Paid apps have higher ratings than free apps
* Apps with more supported languages have higher ratings
* Apps description length is directly correlated to user ratings

## Insights

#### On average the rating of paid apps is slightly higher compared to free apps. 

Average Rating: 
* Free: 3.38
* Paid: 3.72

#### On average, apps with 10-30 supported languages achieve higher ratings than apps with less or more supported languages.

Average Rating:
* <10 languages: 3.37
* 10-30 languages: 4.13
* 30+ languages: 3.78


#### Categories such as Catalogs and Finance rank lowest in app ratings

Average rating(Lowest three Categories):
* Catalogs: 2.1
* Finance: 2.43
* Book: 2.48

#### Strong Correlation among positive user ratings and longer app description

Average Rating:
* Long Description: 3.86
* Medium Description: 3.23
* Short Description: 2.53

## Act
Final recommendations for business strategies with data-driven insights:

* My data analysis has concluded that paid apps generally achieve higher ratings than the free counterparts. Users who pay for an app may have higher engagement and perceived more value leading to better ratings. Suggestions for clients is if the quality of the app is good, consider charging a certain amount for the app.
* My analysis found that apps supporting a modern number of languages between 10 and 30 have the highest average rating. Shifting focus from the quality of language an app supports but rather focusing on the right languages.
* My research analysis discovered that existing categories such as finance, catalogs and books have lower user ratings further suggesting user needs are not being fully met. This can present a market opportunity for the creation of an app in this category that addresses user needs better than the current offerings. There is potential for high user ratings and market penetration.
* Analysis concluded that users appreciate having a clear understanding of an app's features and capabilities before they download. A detailed well crafted app description can set clear expectations and increase user satisfaction as app description length is correlated with positive user ratings.
* On average all apps have a rating of 3.5. In order to stand away from the crowd expectations should be to aim for an app with a rating above 3.5.
* Games and entertainment categories have an extremely high volume of apps suggesting saturation. Entering these spaces might be challenging due to competition, however also suggest a high user demand in these sectors. 
