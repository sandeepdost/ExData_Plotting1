DrawPlot1 <- function() {
  file <- "household_power_consumption.txt"
	powerData <- read.table(file, header=T, sep=";")
	powerData$Date <- as.Date(powerData$Date, format="%d/%m/%Y")
	df <- powerData[(powerData$Date=="2007-02-01") | (powerData$Date=="2007-02-02"),]
	df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
	df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
	df$Voltage <- as.numeric(as.character(df$Voltage))
	df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
	df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
	df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
	df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
	
	hist(df$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
	dev.copy(png, file="plot1.png", width=480, height=480)
	dev.off()
	cat("Plot1.png has been saved in", getwd())
}
