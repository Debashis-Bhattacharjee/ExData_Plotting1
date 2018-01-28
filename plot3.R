#set working directory
setwd(
  "C:/Users/A611558/Work/Data Science/Coursera/Exploratory Data Analysis/Week1/Assignment/ExData_Plotting1"
)

## read the input data set 
data_all <-
  read.table(
    "household_power_consumption.txt",
    header = TRUE,
    sep = ";",
    na.strings = "?"
  )

## subset and get only the relevant data
data_required <-
  subset(data_all, Date %in% c("1/2/2007", "2/2/2007"))
data_required$Date <- as.Date(data_required$Date, format = "%d/%m/%Y")
data_required <-
  cbind(data_required, "DateTime" = as.POSIXct(paste(data_required$Date, data_required$Time)))

## plot 
with(data_required, {
  plot(
    Sub_metering_1 ~ DateTime,
    type = "l",
    xlab = "",
    ylab = "Energy Sub Metering"
  )
})

lines(data_required$Sub_metering_2 ~ data_required$DateTime, col = 'Red')
lines(data_required$Sub_metering_3 ~ data_required$DateTime, col = 'Blue')
legend(
  "topright",
  lty = 1,
  lwd = 3,
  col = c("black", "red", "blue") ,
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)

## save as png file
dev.copy(png,
         file = "plot3.png",
         height = 480,
         width = 480)
dev.off()