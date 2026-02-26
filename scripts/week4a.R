# 1. Load and Inspect Data
data(iris)
str(iris)
# View(iris) # Commented out for smoother script execution
class(iris)

# 2. Base R Box Plots
# Single variable
boxplot(iris$Sepal.Length,
        main = "Box Plot for Sepal Length",
        ylab = "Sepal Length",
        col = "skyblue")

# Grouped by Species
boxplot(Sepal.Length ~ Species,
        data = iris,
        main = "Sepal Length by Species",
        xlab = "Species",
        ylab = "Sepal Length",
        col = c("pink", "green", "blue"))

# Multi-Variable
boxplot(iris[, 1:4],
        main = "Multi Variable Box Plot",
        col = c("pink", "green", "blue", "purple"))

# Custom Color Palette (Base R)
species_colors <- c(
  "setosa" = "red",
  "versicolor" = "steelblue",
  "virginica" = "green"
)

boxplot(Sepal.Length ~ Species,
        data = iris,
        col = species_colors,
        main = "Sepal Length by Species (Custom Colors)",
        xlab = "Species",
        ylab = "Sepal Length")

# ---------------- 3. GGplot2 ----------------

library(ggplot2)

# Basic ggplot Boxplot
ggplot(iris, aes(x = Species, y = Sepal.Length)) +
  geom_boxplot()

# ggplot with Fill Color
ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot() +
  theme_minimal()

# ggplot with Custom Color Palette (Fixed Syntax)
ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot() + # Added missing '+' here
  scale_fill_manual(values = species_colors) +
  theme_minimal() +
  labs(title = "Sepal Length by Species",
       subtitle = "Using ggplot2 and custom colors")
