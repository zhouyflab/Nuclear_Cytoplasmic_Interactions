#NUMT
library(openxlsx)
library(ggplot2)

goinput <- read.xlsx("D:/nuclear-cytoplasmic interaction/NUMT/GO/total.xlsx", sheet = "Sheet3")

goinput$unique_id <- paste(goinput$Description, goinput$Haplotype, sep = "_")

goinput$Description <- factor(goinput$Description, levels = unique(goinput$Description))

p <- ggplot(goinput, aes(x = Fold_Enrichment, y = factor(Description, levels = unique(goinput$Description)))) +
  geom_point(aes(size = Count, color = -1 * log(PValue), shape = Haplotype)) +
  scale_color_gradient(low = "#fbaea8", high = "#c7e0e4") +
  scale_size_continuous(range = c(10, 24)) +  
  scale_shape_manual(values = c(16, 15)) +  
  labs(color = expression(-log[10](PValue)),
       size = "Count",
       shape = "Haplotype",
       x = NULL,
       y = NULL) +
  theme_bw() +
  theme(panel.border = element_blank(),
        axis.text.y = element_text(size = 20),
        axis.text.x = element_text(size = 20),
        axis.title.x = element_text(size = 12),
        axis.title.y = element_text(size = 12),
        legend.text = element_text(size = 20),
        legend.title = element_text(size = 28),
        plot.title = element_blank())

print(p)