#Read data
df = read.csv('household_power_consumption.txt', header = T, sep = ';')
nrow(df)
head(df)
tail(df)
Date = as.Date(df$Date, format = '%d/%m/%Y')
head(Date)
#Take out two-day data
subdf = df[Date == "2007-02-01" | Date == '2007-02-02', ]
head(subdf)
tail(subdf)
#factor to numeric
x = as.numeric(as.character(subdf$Global_active_power))
png('plot2.png', width = 480, height = 480)
plot(x, type = 'l', ylab = 'Global Active Power (kilowatts)',xaxt = "n", frame.plot = T)
axis(1, at = c(1, nrow(subdf)/2, nrow(subdf)),lab = c('Thu','Fri','Sat'))
dev.off()