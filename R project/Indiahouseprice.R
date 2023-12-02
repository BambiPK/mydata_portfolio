library(tidyverse)
library(ggplot2)
library(dplyr)
library(caret)

df1 <- read_xlsx("House Price India.xlsx", sheet = 1)
df2 <- read_xlsx("House Price India.xlsx", sheet = 2)
df <- bind_rows(df1,df2)

df$Price <- log(df$Price)

ggplot(data = df,
       mapping = aes(x= Price)) + geom_histogram()

#prepare data; not found na rows

use_df <- df %>%
  select('number of bedrooms', 'living area', 'lot area', 'Distance from the airport', 'Price')


#1. Split data
n <- nrow(df)
set.seed(42)
train_id <- sample(1:n, size = 0.8*n)
train_df <- use_df[train_id, ]
test_df <- use_df[-train_id, ]


#2. train model
set.seed(42)
lm_model <- train(Price ~ .,
                  data = train_df,
                  method = "lm")

#3. score model
predict_df <- predict(lm_model, newdata = test_df)

#4. evaluate model
#mean absolute error
mae <- mean(abs(predict_df - test_df$Price))

#root mean square error
(rmse <- sqrt(mean(predict_df - test_df$Price)**2))
