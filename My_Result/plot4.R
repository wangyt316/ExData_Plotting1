#Read Data
df = read.csv('household_power_consumption.txt', header = T, sep = ';')
nrow(df)
head(df)
tail(df)
Date = as.Date(df$Date, format = '%d/%m/%Y')
head(Date)
subdf = df[Date == "2007-02-01" | Date == '2007-02-02', ]
head(subdf)
tail(subdf)
#factor to numeric
x = as.numeric(as.character(subdf$Global_active_power))
s1 = as.numeric(as.character(subdf$Sub_metering_1))
s2 = as.numeric(as.character(subdf$Sub_metering_2))
s3 = as.numeric(as.character(subdf$Sub_metering_3))


png('plot4.png', width = 480, height = 480)
#Make a 2 by 2 canvas
par(mfrow=c(2,2))
#First plot
plot(x, type = 'l', ylab = 'Global Active Power (kilowatts)',xaxt = "n", frame.plot = T)
axis(1, at = c(1, nrow(subdf)/2, nrow(subdf)),lab = c('Thu','Fri','Sat'))
#Second plot
v = as.numeric(as.character(subdf$Voltage))
plot(v, type = 'l',ylab = 'Voltage',xlab = 'datetime',xaxt = "n", frame.plot = T)
axis(1, at = c(1, nrow(subdf)/2, nrow(subdf)),lab = c('Thu','Fri','Sat'))
#Third plot
plot(s1, type = 'l',ylab = 'Energy sub metering',xaxt = "n", frame.plot = T)
lines(s2, col= 'red')
lines(s3, col= 'blue')
axis(1, at = c(1, nrow(subdf)/2, nrow(subdf)),lab = c('Thu','Fri','Sat'))
legend("topright",names(subdf)[7:9], col = c('black','red','blue'),lty=rep(1,3),bty = 'n')
#Forth plot
g = as.numeric(as.character(subdf$Global_reactive_power))
plot(g, type = 'l',ylab = 'Global_reactive_power',xlab = 'datetime',xaxt = "n", frame.plot = T)
axis(1, at = c(1, nrow(subdf)/2, nrow(subdf)),lab = c('Thu','Fri','Sat'))
dev.off()
