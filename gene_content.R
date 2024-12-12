library(dplyr)
library(ggplot2)
library(tidyverse)
library(openxlsx)
library(RColorBrewer)

df <- read.xlsx("D:/nuclear-cytoplasmic interaction/mt/annotation/gene_content.xlsx", sheet= "Sheet1", sep=',')
head(df)
new.df <- pivot_longer(df,
                       !X,
                       names_to = "Y",
                       values_to = "Value")
head(new.df)
color_mapping <- c("0" = "#ffffff", "1" = "#a6cde7", "2" = "#fab0b1",
                   "3" = "#cbb9ea", "4" = "#f3fa9b", "5" = "#f5b847", "6" = "#90dbf4", "7" = "#606c38", "8" = "#023e8a")
new.df$Value <- factor(new.df$Value)
custom_levels <- c("Vmu", "Var", "Vrp", "Vri", "Mmpt", "Spt", "Cm", "Bypt", "Xzpt", "Hey",
                   "Vcf", "Vme", "Vcs", "Vca", "Pnzh", "Pn", "Vsyd", "Vsyc", "Vs", "Vsya",
                   "Vzc", "Vsyb", "Vch", "Ql", "Mgx", "Vsye", "Ves", "Ved", "Zla", "Mrz",
                   "Hmng", "Bmng", "Whz", "Whb")

new.df$X <- factor(new.df$X, levels = custom_levels)
ggplot() +
  geom_tile(data = new.df, aes(Y, X, fill = Value), color = "#8d99ae", show.legend = FALSE) +
  scale_fill_manual(values = color_mapping) +
  coord_equal() +  
  labs(x = NULL, y = NULL) +  
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 1, size = 10),  
        axis.text.y = element_text(size = 10),  
        legend.position = "top",
        legend.box = "vertical") 