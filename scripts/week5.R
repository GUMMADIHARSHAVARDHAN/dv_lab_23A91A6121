# ==========================================
# PART 1: Iris Dataset (Box Plots)
# ==========================================

# 1. Load and Inspect
data(iris)
str(iris)

# 2. Base R Box Plots
# Custom Color Palette
species_colors <- c(
  "setosa" = "red",
  "versicolor" = "steelblue",
  "virginica" = "green"
)

# Grouped Box Plot
boxplot(Sepal.Length ~ Species,
        data = iris,
        col = species_colors,
        main = "Sepal Length by Species (Base R)",
        xlab = "Species",
        ylab = "Sepal Length")

# 3. GGplot2 Box Plots
library(ggplot2)

ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot() + 
  scale_fill_manual(values = species_colors) +
  theme_minimal() +
  labs(title = "Sepal Length by Species (ggplot2)",
       x = "Flower Species",
       y = "Sepal Length (cm)")

# ==========================================
# PART 2: Diamonds Dataset (Density Plots)
# ==========================================

# 1. Load and Understand
data(diamonds)
str(diamonds)
dim(diamonds)

# 2. Base R Scatter Plot
# Using transparency (rgb) because there are >50,000 points
plot(diamonds$carat, diamonds$price, 
     col = rgb(0, 0, 1, 0.1), 
     pch = 16,
     main = "Scatter Plot: Carat vs Price",
     xlab = "Carat",
     ylab = "Price")

# 3. Hexbin using Base R
# Check if package exists, then load
if(!require(hexbin)) install.packages('hexbin')
library(hexbin)

hb <- hexbin(diamonds$carat, diamonds$price, xbins = 40)
plot(hb, main = "Hexbin Plot: Carat vs Price (Base R)")

# 4. GGplot2 Hexbin Plots (Fixed Typos)
# Basic Hexbin
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_hex() +
  theme_minimal() +
  labs(title = "Basic Hexbin Plot")

# Labeled and Styled Hexbin
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_hex() +
  scale_fill_gradient(low = "lightblue", high = "red") +
  theme_minimal() +
  labs(title = "Hexagon Binning: Carat vs Price",
       subtitle = "Density visualization of 53,940 diamonds",
       x = "Carat (Weight)",
       y = "Price (USD)",
       fill = "Count")

# ==========================================
# PART 3: Global Package Check (Optional)
# ==========================================
# View all available datasets in your installed packages
# data(package = .packages(all.available = TRUE))
