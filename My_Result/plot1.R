#Read data
df = read.csv('household_power_consumption.txt', header = T, sep = ';')
nrow(df)
head(df)
tail(df)
Date = as.Date(df$Date, format = '%d/%m/%Y')
head(Date)
#take out two-day data
subdf = df[Date == "2007-02-01" | Date == '2007-02-02', ]
head(subdf)
tail(subdf)
#factor to numeric
x = as.numeric(as.character(subdf$Global_active_power))
png('plot1.png', width = 480, height = 480)
hist(x,col = 'red', xlab = 'Global Active Power (kilowatts)', ylim = c(0,1200), main = 'Global Active Power' )
dev.off()