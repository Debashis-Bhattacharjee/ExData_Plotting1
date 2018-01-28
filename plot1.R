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

## plot
hist(
  data_required$Global_active_power,
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)",
  ylab = "Frequency",
  col = "Red"
)


## save as png
dev.copy(png,
         file = "plot1.png",
         height = 480,
         width = 480)
dev.off()