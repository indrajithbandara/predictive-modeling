library(MASS)
data("Boston")

# lm(formula = avg_time ~ distance , data =  rs) avg_time is the “response variable” (what we are trying to predict) distance is the “predictor variable” (what we are using to predict the response variable)

names(Boston)

fit <- lm(formula = medv ~ rm, data = Boston)

summary(fit)

attach(Boston)

plot(rm, medv, pch=20, xlab="Avg Rooms", ylab="Median Value")

lines(rm, fit$fitted, lwd=3)

# Let’s say you want to predict the median home value based on 
# the average number of rooms being — 2, 4 and 5

coef(fit)[1] + coef(fit)[2] * 2
coef(fit)[1] + coef(fit)[2] * 4
coef(fit)[1] + coef(fit)[2] * 5

# Or using predict...

predict(fit, data.frame(rm = c(2, 4, 5)))


plot(cooks.distance(fit))


