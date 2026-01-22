# 1. Load the required libraries
# If you haven't installed it yet, run: install.packages("ggplot2")
library(ggplot2)

# Load Air Passengers
data(AirPassengers)

# 2. Convert to dataframe correctly
# Changed "<-" to "=" inside data.frame and used as.numeric for the year
ap_df <- data.frame(
  year = as.numeric(time(AirPassengers)),
  passengers = as.numeric(AirPassengers)
)

# 3. Base R Plotting
plot(AirPassengers,
     type = 'l',
     main = "Air Passengers Trend Analysis",
     xlab = "Year",
     ylab = "No. of passengers",
     col = "red")
points(AirPassengers, pch = 16, col = "blue", cex = 0.5)
grid()

# 4. ggplot2 Analysis
# Fixed the extra parentheses at the end
ggplot(ap_df, aes(x = year, y = passengers)) +
  geom_line(color = "darkgreen", linewidth = 0.5) +
  labs(
    title = 'Trend Analysis of Air Passengers',
    subtitle = "From 1949-1960",
    caption = 'Using Built-in AirPassengers Dataset',
    x = 'Year',
    y = 'No. of Passengers'
  ) +
  geom_point(color = 'red', size = 0.5) +
  geom_smooth(method = "loess", se = FALSE, color = 'orange') +
  theme_minimal() +
  theme(
    plot.title = element_text(face = 'bold', size = 14),
    plot.subtitle = element_text(size = 10)
  )