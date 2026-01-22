# =========================
# Load iris dataset
# =========================
data(iris)

# =========================
# Inspect the data
# =========================
head(iris, 3)
str(iris)
class(iris)

# =========================
# Verify Species column
# =========================
iris$Species
View(iris)

# =========================
# Bar Chart: Count of Species
# =========================
barplot(
  table(iris$Species),
  main = "Count of Iris Species",
  xlab = "Species",
  ylab = "Number of Items",
  col = "steelblue"
)

# =========================
# Mean Sepal Length per Species
# =========================
mean_sepal <- tapply(
  iris$Sepal.Length,
  iris$Species,
  mean
)

mean_sepal

# =========================
# Bar Chart: Mean Sepal Length
# =========================
barplot(
  mean_sepal,
  col = "orange",
  main = "Average Sepal Length by Species",
  xlab = "Species",
  ylab = "Mean Sepal Length"
)

# =========================
# Grouped Data: Sepal vs Petal Length
# =========================
group_means <- rbind(
  Sepal = tapply(iris$Sepal.Length, iris$Species, mean),
  Petal = tapply(iris$Petal.Length, iris$Species, mean)
)

group_means

# =========================
# Grouped Bar Chart
# =========================
barplot(
  group_means,
  beside = TRUE,
  col = c("skyblue", "pink"),
  legend.text = TRUE,
  main = "Grouped Bar Chart: Sepal vs Petal Length",
  xlab = "Species",
  ylab = "Mean Length"
)

# =========================
# Stacked Bar Chart
# =========================
barplot(
  group_means,
  beside = FALSE,
  col = c("skyblue", "pink"),
  legend.text = TRUE,
  main = "Stacked Bar Chart: Sepal vs Petal Length",
  xlab = "Species",
  ylab = "Mean Length"
)