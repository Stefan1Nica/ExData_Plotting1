library(data.table)
setwd("C:/workspace/R training/ExData_Plotting1")
household <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE)
head(household)
names(household)
setDT(household)

household$Date <- as.Date(household$Date, format = "%d/%m/%Y")
subset <- household[(household$Date == "2007-02-01") | (household$Date == "2007-02-02")]
subset
subset$Global_active_power <- as.numeric(as.character(subset$Global_active_power))
subset$Global_reactive_power <- as.numeric(as.character(subset$Global_reactive_power))
subset$Voltage <- as.numeric(as.character(subset$Voltage))
subset <- transform(subset, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
subset$Sub_metering_1 <- as.numeric(as.character(subset$Sub_metering_1))
subset$Sub_metering_2 <- as.numeric(as.character(subset$Sub_metering_2))
subset$Sub_metering_3 <- as.numeric(as.character(subset$Sub_metering_3))
subset$timestamp

plot(subset$timestamp,subset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()

