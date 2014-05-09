
# Supress warnings
options(warn=-1)
#Set Working directory

# Read file
pwdata <- read.table("./data/household_power_consumption.txt", sep=";", na.string="?", header=TRUE)

# Convert to Date column to Date type
pwdata$Date <- strptime(pwdata$Date, "%d/%m/%Y")

#Subset data
myset <- pwdata[as.Date(pwdata$Date) >= as.Date("2007-02-01") & as.Date(pwdata$Date) <= as.Date("2007-02-02"), ]

#--- Script to generate plot2.png
png(file="plot2.png")
plot(as.POSIXct(paste(myset$Date, myset$Time),format("%Y-%m-%d %H:%M:%S")), myset$Global_active_power, type= "l", xlab = "", ylab= "Global Active Power(kilowatts)")
dev.off()