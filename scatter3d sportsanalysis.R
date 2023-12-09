install.packages("rgl")

# Load the required libraries
library(rgl)

# Generate sample data (replace this with your actual dataset)
set.seed(123)
n <- 100
player_data <- data.frame(
  PlayerID = 1:n,
  Points = rnorm(n, mean = 20, sd = 5),
  Assists = rnorm(n, mean = 5, sd = 2),
  Rebounds = rnorm(n, mean = 10, sd = 3)
)

# Create a 3D scatter plot
open3d()
plot3d(player_data$Points, player_data$Assists, player_data$Rebounds, col = "blue", size = 2)
title3d("Player Statistics 3D Scatter Plot")

# Add labels to the points
text3d(player_data$Points, player_data$Assists, player_data$Rebounds,
       text = player_data$PlayerID, adj = 0.5, cex = 0.5)

# Export the 3D plot as an image (PNG format)
rgl.snapshot("3d_scatter_plot.png", fmt = "png")

# Close the 3D plot
close3d()

