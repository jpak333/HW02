# Shot Charts
# scatterplot 
library(ggplot2)
install.packages("jpeg")
library(jpeg)
library(grid)

court_file <- "../images/nba-court.jpg"
court_image <- rasterGrob(
  readJPEG(court_file), 
  width = unit(1, "npc"), 
  height = unit(1, "npc")) 

iguodala_shot_chart <- ggplot(data = iguodala) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + ggtitle('Shot Chart: Andre Iguodala (2016 season)') + 
  theme_minimal()
pdf(file="../images/andre-iguodala-shot-chart.pdf ", width=6.5, height=5)
iguodala_shot_chart
dev.off()

green_shot_chart <- ggplot(data = green) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + ggtitle('Shot Chart: Draymond Green (2016 season)') + 
  theme_minimal()
pdf(file="../images/draymond-green-shot-chart.pdf ", width=6.5, height=5)
green_shot_chart
dev.off()

durant_shot_chart <- ggplot(data = durant) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + ggtitle('Shot Chart: Kevin Durant (2016 season)') + 
  theme_minimal()
pdf(file="../images/kevin-durant-shot-chart.pdf ", width=6.5, height=5)
durant_shot_chart
dev.off()

thompson_shot_chart <- ggplot(data = thompson) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + ggtitle('Shot Chart: Klay Thompson (2016 season)') + 
  theme_minimal()
pdf(file="../images/klay-thompson-shot-chart.pdf ", width=6.5, height=5)
thompson_shot_chart
dev.off()

curry_shot_chart <- ggplot(data = curry) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + ggtitle('Shot Chart: Stephen Curry (2016 season)') + 
  theme_minimal()
pdf(file="../images/stephen-curry-shot-chart.pdf ", width=6.5, height=5)
curry_shot_chart
dev.off()

# Facetted Shot Chart
gsw_shot_chart <- ggplot(data = dat) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  theme_minimal() + ggtitle('Shot Chart: GSW (2016 season)') +
  ylim(-50, 420) + 
  facet_wrap( ~ name,ncol=3)+
  theme_minimal()
pdf(file="../images/gsw-shot-charts.pdf", width=8, height=7)
gsw_shot_chart
dev.off()


