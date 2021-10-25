
Titanic <- read.csv('titanic.csv')
View(Titanic)
shuffle <- sample(1:nrow(Titanic))
head(shuffle) # to check head of sample row
tail(shuffle)
Titanic <- Titanic[shuffle,]
head(Titanic)
tail(Titanic)
library(dplyr)
clean_titanic <- Titanic %>%
select(-c(home.dest, cabin, name, x, ticket)) %>%
  #convert to factor level
  mutate(pclass = factor(pclass, levels = c(1,2,3), labels = c('Upper', 'Middle', 'Lower')),
         survived = factor(survived,levels = c(0,1), labels = c('No', 'Yes')))%>%
  na.omit()
glimpse(clean_titanic)      


create_train_test <- function(data, size = 0.8, train = TRUE) {
  n_row = nrow(data)
  total_row = size * n_row
  train_sample <- 1: total_row
  if (train == TRUE) {
    return (data[train_sample, ])
  } else {
    return (data[-train_sample, ])
  }
}

data_train <- create_train_test(clean_titanic, 0.8, train = TRUE)
data_test <- create_train_test(clean_titanic, 0.8, train = FALSE)
dim(data_train)
dim(data_test)

prop.table(table(data_train$survived))
prop.table(table(data_test$survived))


library(rpart)
library(rpart.plot)
fit <- rpart(survived~., data = data_train, method = 'class')
rpart.plot(fit, extra = 106, cex = 0.6)


