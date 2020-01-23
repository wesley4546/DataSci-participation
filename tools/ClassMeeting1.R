number <- 3

number * 2

number <- 5 

number * 2

another_number

times <- c(17, 30, 25, 35, 25, 30, 40, 20)

mean(times)
time_in_hours <- times / 60

mean(times)
range(times)
sqrt(times)

times > 30
times == 17

which(times > 30)
all(times > 30)
any(times > 30)

?mean
times[times>30]
times[-3]
times[3:5]
times[c(2,4)]
times[-c(2,4)]

times
times[1] = 47
times[times > 30] <- NA
times

mean(times,na.rm = TRUE)

mean(times[times > 20 & times < 35], na.rm = TRUE)

times > 20 | times < 35

mean(x = times)
mean(times)
mean(times, na.rm = TRUE)
mean(times, trim = .2, na.rm = TRUE)

mtcars
head(mtcars)
tail(mtcars)
str(mtcars)
names(mtcars)
