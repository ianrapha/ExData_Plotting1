baseDir <- './data/'
repoDir <- './exploratory-analysis/week01/ExData_Plotting1/'
zipFile <- 'household_power_consumption.zip'
dataFile <- 'household_power_consumption.txt'
imgFile <- 'plot1.png'

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
data$Date <- as.Date(data$Date)

filteredByDate <- data[data$Date %in% as.Date(c('2007-02-01', '2007-02-02')), ]

hist(filteredByDate$Global_active_power, 
     main = 'Global Active Power', 
     xlab = 'Global Active Power (kilowatts)',
     ylab = 'Frequency',
     col = "red")

dev.copy(png, file = imgFilePath, width = 480, height = 480)
dev.off()