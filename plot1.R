myfunction <- function(){
# create png file
png(file = "plot1.png", width = 480, height = 480)

# only read
startPosition <- 66637
length <- 2880
header <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
dat   <- read.table('household_power_consumption.txt', skip = startPosition , nrows = length, header = FALSE, sep =';')
colnames( dat ) <- unlist(header)

# missing data
is.na(dat)<-(dat=="?")

#Histogram
hist(dat$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")

# close png file
dev.off()
}