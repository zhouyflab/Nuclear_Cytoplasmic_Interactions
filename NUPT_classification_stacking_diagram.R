library(openxlsx)  
library(ggplot2)
library(ggprism)
library(reshape2)  
library(ggalluvial)
library(scales)

df_hap1 <- read.xlsx("D:/nuclear-cytoplasmic interaction/NUPT/list/data.xlsx", sheet = "allhap1")
df_hap2 <- read.xlsx("D:/nuclear-cytoplasmic interaction/NUPT/list/data.xlsx", sheet = "allhap2")

df_hap1$haplotype <- 'hap1'
df_hap2$haplotype <- 'hap2'

df <- rbind(df_hap1, df_hap2)

df$group <- factor(df$group, levels = c("DNA","Helitron","LINE", "LTR","MITE", "SINE","rRNA", "other", "nonTE"))

ggplot(df, aes(x = X, y = value, fill = group)) +
  geom_col(position = 'stack', width = 0.6) +
  scale_fill_manual(values = c("#fff0ccb2", "#dce4f8b2","#f8edeb","#fcf6bd", "#e6ccb2","#fcd5ce","#fec89a" , "#d9ead3b2","#bde0fe")) +
  theme_minimal() +  
  scale_y_continuous(labels = label_number(scale = 1, suffix = NULL)) +  
  labs(x = NULL, y = "Length of NUPTs(Mb)", fill = NULL) + 
  theme(
    panel.grid.major = element_blank(),  
    panel.grid.minor = element_blank(),  
    axis.text.x = element_text(angle = 45, hjust = 1, size = 16),  
    axis.text.y = element_text(size = 16),  
    axis.title.x = element_text(size = 16),  
    #axis.line = element_line(color = "black"),  
    strip.text = element_text(size = 18),  
    legend.text = element_text(size = 14),  
    legend.title = element_text(size = 16)  
  ) +
  facet_wrap(~haplotype)  
