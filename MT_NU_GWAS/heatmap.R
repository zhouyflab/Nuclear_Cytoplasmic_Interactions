library(openxlsx)
library(pheatmap)
library(RColorBrewer)

df <- read.xlsx("D:/nuclear-cytoplasmic interaction/GWAS/data.xlsx")
str(df)
convert_genotype_to_numeric <- function(genotype) {
  if (genotype == "0/0") {
    return(0)
  } else if (genotype == "0/1" || genotype == "1/0") {
    return(1)
  } else if (genotype == "1/1") {
    return(2)
  } else {
    return(NA)
  }
}

df_numeric <- as.data.frame(lapply(df, function(column) {
  sapply(column, convert_genotype_to_numeric)
}))

row.names(df_numeric) <- df[,1]
df_numeric <- df_numeric[,-1]

df_numeric[is.na(df_numeric)] <- -1

pheatmap(df_numeric, 
         cluster_rows = F, 
         cluster_cols = T,
         color = colorRampPalette(brewer.pal(n = 9, name = "Blues"))(100),
         na_col = "white", 
         border_color = NA, 
         show_colnames = FALSE, 
         fontsize = 12, 
         fontsize_row = 10, 
         fontsize_col = 10,
         treeheight_col = 50, 
         lwd = 4) 