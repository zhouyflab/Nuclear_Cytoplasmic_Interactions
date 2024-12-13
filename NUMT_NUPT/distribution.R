library(ggplot2)
library(readxl)

hap1 <- read_excel("D:/nuclear-cytoplasmic interaction/NUMT/BMNG.xlsx", sheet = "hap1")
hap2 <- read_excel("D:/nuclear-cytoplasmic interaction/NUMT/BMNG.xlsx", sheet = "hap2")

hap1_len <- read.table("D:/nuclear-cytoplasmic interaction/NUMT/BMNG_hap1.length.txt", fileEncoding="UTF-8", header=TRUE)
hap2_len <- read.table("D:/nuclear-cytoplasmic interaction/NUMT/BMNG_hap2.length.txt", fileEncoding="UTF-8", header=TRUE)

hap1$source <- 'hap1'
hap2$source <- 'hap2'

combined_data <- rbind(hap1, hap2)

ggplot() + 
  geom_rect(data=hap1_len, aes(xmin=chr-0.2, xmax=chr+0.2, ymin=0, ymax=y/1000000), fill="white", colour="grey", linewidth=0.5) +
  geom_rect(data=hap2_len, aes(xmin=chr-0.2, xmax=chr+0.2, ymin=0, ymax=y/1000000), fill="white", colour="grey", linewidth=0.5) +
  geom_point(data=combined_data, aes(x=as.numeric(V1), y=(V2+V3)/2/1000000, color=source), shape=95, size=8, alpha=0.6) +
  labs(title='Distribution of NUMT sequence in Bmng', x='Chromosome', y='Chromosomal Position (Mb)') +
  theme(plot.title = element_text(hjust = 0.5, size=16),
        plot.subtitle = element_text(hjust = 0.5, size=14),
        axis.title.x = element_text(size=12),
        axis.title.y = element_text(size=12),
        axis.text.x = element_text(size=10),
        axis.text.y = element_text(size=10),
        panel.background = element_rect(fill="white"),
        #panel.border = element_rect(fill=NA, color="black", linewidth=2, linetype=1),
        panel.border = element_blank(),
        legend.position = "top",
        legend.background = element_rect(colour=NA, fill=NA, linewidth=1, linetype=1),
        legend.key = element_rect(colour=NA, fill=NA),
        legend.text = element_text(size=12),
        legend.title = element_text(size=12)) +
  guides(color = guide_legend(title=NULL)) +
  scale_color_manual(values=c('hap1'='skyblue3', 'hap2'='#ca6f7f')) +
  scale_x_continuous(breaks=c(1:19))
ggsave("D:\\nuclear-cytoplasmic interaction\\figure\\Fig. 3c.pdf", width = 14, height = 6,paper='a4')