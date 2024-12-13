library(dplyr)
library(ggplot2)
library(openxlsx)

kk <- read.xlsx("D:/nuclear-cytoplasmic interaction/NUMT/GO/total.xlsx", sheet = "Sheet2")

kk$Description <- factor(kk$Description, levels = kk$Description)

ggplot(kk, aes(y = Description, x = Count, fill = PValue)) +
  geom_bar(stat = "identity", width = 0.4) +  
  scale_fill_gradient(low = "#def0f9", high = "#89cbe8") + 
  labs(
    x = NULL,
    y = NULL
  ) +       
  theme_bw() +
  theme(
    axis.title.x = element_text(face = "bold", size = 30),       
    axis.title.y = element_text(face = "bold", size = 30),       
    axis.text.x = element_text(size = 25, face = "bold"),        
    axis.text.y = element_text(size = 25, face = "bold"),       
    legend.title = element_text(face = "bold", size = 30),       
    legend.text = element_text(size = 20),                       
    plot.title = element_text(hjust = 0.5, size = 30, face = "bold") 
  ) 