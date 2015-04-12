myfunction <- function(){
# create png file
png(file = "plot2.png", width = 480, height = 480)

# only read
startPosition <- 66637
length <- 2880
header <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
dat   <- read.table('household_power_consumption.txt', skip = startPosition , nrows = length, header = FALSE, sep =';')
colnames( dat ) <- unlist(header)

# missing data
is.na(dat)<-(dat=="?")

#Chart
time <- as.Date(dat$Date, "%d/%m/%Y")
DateTime <- strptime(paste(time, dat$Time), "%Y-%m-%d %H:%M:%OS")
plot(DateTime, dat$Global_active_power, type ="n", main="", ylab = "Global Active Power(kilowatts)", xlab = "")
lines(DateTime, dat$Global_active_power, type="l")

# close png file
dev.off()
}