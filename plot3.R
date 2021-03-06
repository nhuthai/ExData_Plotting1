myfunction <- function(){
# create png file
png(file = "plot3.png", width = 480, height = 480)

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

minX <- min(dat$Sub_metering_1, dat$Sub_metering_2, dat$Sub_metering_3, na.rm=FALSE)
maxX <- max(dat$Sub_metering_1, dat$Sub_metering_2, dat$Sub_metering_3, na.rm=FALSE)
rangeX <- c(minX, maxX)

minY <- head(DateTime,1)
maxY <- tail(DateTime,1)
rangeY <- c(minY , maxY)

plot(rangeY, rangeX , type ="n", main="", ylab = "Energy sub metering", xlab = "")
lines(DateTime, dat$Sub_metering_1, type="l") 
lines(DateTime, dat$Sub_metering_2, type="l", col="red")
lines(DateTime, dat$Sub_metering_3, type="l", col="blue")

leg.txt <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright", leg.txt, lty=1, col = c(1, 2, 4))

# close png file
dev.off()
}