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


## plot2.png

par(bg = NA)
plot(hpcdata[,10], hpcdata[,3], type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()

