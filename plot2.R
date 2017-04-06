baseDir <- './data/'
repoDir <- './exploratory-analysis/week01/ExData_Plotting1/'
zipFile <- 'household_power_consumption.zip'
dataFile <- 'household_power_consumption.txt'
imgFile <- 'plot2.png'

zipFilePath <- paste(baseDir, zipFile, sep = '')
dataFilePath <- paste(baseDir, dataFile, sep = '')
imgFilePath <- paste(repoDir, imgFile, sep = '')

if(!file.exists(zipFilePath)) {
    download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', zipFilePath, 'curl')   
}

if(!file.exists(dataFilePath)) {
    unzip(zipFilePath)    
}

data <- read.csv(dataFilePath, header = TRUE, sep = ';', na.strings = '?')
data$Time <- strptime(paste(data$Date, data$Time), '%d/%m/%Y %H:%M:%S')
data$Date <- as.Date(data$Date, '%d/%m/%Y')

dates <- as.Date(c('2007-02-01', '2007-02-02'))

filteredByDate <- data[data$Date %in% dates, ]

plot(filteredByDate$Time, filteredByDate$Global_active_power, 
     type = 'l',
     xlab = '',
     ylab = 'Global Active Power (kilowatts)')

dev.copy(png, file = imgFilePath, width = 480, height = 480)
dev.off()