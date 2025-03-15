#' ---
#' title: Time Series Week NNN
#' author: You
#' date: Today
#' ---

# 1. R Scratchpad ------------------------------------------------------------
#   You will only write in R Markdown for code and results
#   that are more or less finalised.
#   In the meantime, you can use this R scratchpad.
#   Delete all this text and write your own code
#   Don't forget to add explanatory comments
#   And to separate out different bits with headings or
#   subheadings

# 2. Use Sectioning ----------------------------------------------------------
#   Comment lines start with #, they are not read by R
#   If you end comment lines with space and four minus signs -
#   they will be interpreted as section headings.
#   You can add more - to visually separate sections.
#   CTRL+SHIFT+R / ⌘+SHIFT+R creates a new section and adds the hyphens.
#
#   These sections are accessible in
#     - the drop-down list on the bottom left of the scripting area,
#       ALT+SHIFT+J / ⌘+SHIFT+J brings it up
#   and
#     - the outline section on the top-right corner of the scripting area
#       CTRL+SHIFT+O / ⌘+SHIFT+O brings it up

## 2.1 Subsection -----------------------------------
#   You can also have subsections
#   RStudio does not treat them differently from sections
#   but if you add a extra #, number or spaces they will look
#   different in the outline section.
#   This makes it easier to navigate your R file
#   I use less hyphens for subsections to help visually

### 2.1.1 Subsection -------------------
#   And sub-subsections,...

# 3. Folding sections -----------------------------------------------------
#   You can fold sections by clicking on the little grey down-arrow on the left
#   of the section heading. Or hitting ALT+L/⌘+ALT+L
#   This is useful to hide sections you are not working on
#   SHIFT+ALT+L / ⌘+SHIFT+⌥+L unfolds the section
#   ALT+O / ⌘+⌥+O folds all sections
#   SHIFT+ALT+O / ⌘+SHIFT+⌥+O unfolds all sections

# 4. Etiquette ------------------------------------------------------------
#   It is a good idea (valued in any business environment) to have a certain
#   etiquette when writing code (or anything else really).
#   For instance, I write a blank line before a section heading and not after
#   You can choose your own style, but be consistent, and have the least
#   amount of random variations in your style as possible.

# 1. Installing Prophet
install.packages("prophet")

install.packages("remotes")
remotes::install_github('facebook/prophet@*release', subdir='R')

library("prophet")


# 2. Example Code
#    2.1 Set Up Time Series as a Dataframe Following Instructions Section 1.1.2
co2.df = data.frame(
    ds=zoo::as.yearmon(time(co2)),
    y=co2)
#   2.2 Fit Prophet Model to the Dataframe
m = prophet::prophet(co2.df)
#   2.3 Create Future Dates for Forecasting
f = prophet::make_future_dataframe(m, periods=8, freq="quarter")
#   2.4 Run Predict Function
p = predict(m, f)
#   2.5 Display Forecast
plot(m,p)



# 4. My Code
#   4.1 Get Data for Daily Searches for Lana Del Rey in Past 5 Years
file.choose()
Lana.Searches = read.csv("/Users/bettysmythe/Desktop/Coursework1_220631220/data/Lana.Search.Data.csv", skip=2)
#   4.2 Get a Better Understanding of Lana Data
summary(Lana.Searches)
head(Lana.Searches)
tail(Lana.Searches)
plot(Lana.Searches, main="Daily Searches for Lana Del Rey 2020-2025", xlim="2025-02-02", col="pink")
#   4.3 Set Up Time Series as a Dataframe Following Instructions Section 1.1.2
Lana.Dataframe = data.frame(
    ds=zoo::as.Date(Lana.Searches$Week),
    y=Lana.Searches)
#   4.4 Fit Prophet Model to the Dataframe
Prophet.Model = prophet::prophet(Lana.Dataframe)
#   4.5 Create Future Dataframe for Forecasting
Future.Dates = prophet::make_future_dataframe(Prophet.Model, periods=24, freq="month")
#   4.6 Run Predict Function
Predicted.Values = predict(Prophet.Model, Future.Dates)
#   4.7 Display Forecast
plot(Prophet.Model,Predicted.Values)
#   4.8 Plot Trend and Seasonality
prophet_plot_components
#   4.9 Run Linear Regression to Understand Growth of Series
Time.Index = 1:length(Lana.Searches)
Linear.Model = lm(Lana.Searches ~ Time.Index)
summary(Linear.Model)
Growth.Rate = coef(Linear.Model)[2]

# RUNNING CODE FROM RMD FILE

Lana.Data = read.csv("/Users/bettysmythe/Desktop/Coursework1_220631220/data/Lana.Search.Data.csv", skip=2)
head(Lana.Data)
summary(Lana.Data)

colnames(Lana.Data) = c("Week", "Searches")
Lana.Data$Week = as.Date(Lana.Data$Week, format="%Y-%m-%d")
Lana.Data$Searches <- as.numeric(Lana.Data$Searches)
plot(Lana.Data$Week, Lana.Data$Searches, type="l", col="pink", xlab="Week", ylab="Searches", main="Weekly Google Searches for Lana del Rey")

Lana.Dataframe = data.frame(
    ds=zoo::as.yearmon(Lana.Data$Week),
    y=Lana.Data$Searches)


install.packages("dplyr")
library(dplyr)

