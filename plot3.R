## read the data and convert date and create a new column for datetime

rawdata <- read.table("household_power_consumption.txt", header = TRUE, sep=";")
rawdata[,1] = as.Date(rawdata[,1], format = "%d/%m/%Y")
rawdata$DateTime <- as.POSIXct(paste(rawdata$Date, rawdata$Time), format="%Y-%m-%d %H:%M:%S")

## create working dataset and convert columns from factor to numeric

hpcdata <- rawdata[which (rawdata$Date > "2007-01-31" & rawdata$Date < "2007-02-03"),]
hpcdata[,3] = as.numeric(as.character(hpcdata[,3]))
hpcdata[,4] = as.numeric(as.character(hpcdata[,4]))
hpcdata[,5] = as.numeric(as.character(hpcdata[,5]))
hpcdata[,6] = as.numeric(as.character(hpcdata[,6]))
hpcdata[,7] = as.numeric(as.character(hpcdata[,7]))
hpcdata[,8] = as.numeric(as.character(hpcdata[,8]))


## plot3.png

png(filename = "plot3.png")
par(bg = NA)
plot(hpcdata[,10], hpcdata[,7], type = "n", xlab = "", ylab = "Energy sub metering")
lines(hpcdata[,10], hpcdata[,7], type = "l", col = "black")
lines(hpcdata[,10], hpcdata[,8], type = "l", col = "red")
lines(hpcdata[,10], hpcdata[,9], type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

