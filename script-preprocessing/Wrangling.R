#convert into numeric
install.packages("plyr")
library(plyr)

df$HighBlood <- as.numeric(revalue(df$HighBlood, c("Yes" = 1, "No" = 0, "NA" = NA)))
df$Stroke <- as.numeric(revalue(df$Stroke, c("Yes" = 1, "No" = 0, "NA" = NA)))
df$Complication_risk <- factor(df$Complication_risk, levels = c("Low", "Medium", "High"))
df$Overweight <- as.numeric(revalue(df$Overweight, c("Yes" = 1, "No" = 0, "NA" = NA)))
df$Arthritis <- as.numeric(revalue(df$Arthritis, c("Yes" = 1, "No" = 0, "NA" = NA)))
df$Diabetes <- as.numeric(revalue(df$Diabetes, c("Yes" = 1, "No" = 0, "NA" = NA)))
df$Hyperlipidemia <- as.numeric(revalue(df$Hyperlipidemia, c("Yes" = 1, "No" = 0, "NA" = NA)))
df$BackPain <- as.numeric(revalue(df$BackPain, c("Yes" = 1, "No" = 0, "NA" = NA)))
df$Anxiety <- as.numeric(revalue(df$Anxiety, c("Yes" = 1, "No" = 0, "NA" = NA)))
df$Allergic_rhinitis <- as.numeric(revalue(df$Allergic_rhinitis, c("Yes" = 1, "No" = 0, "NA" = NA)))
df$Reflux_esophagitis <- as.numeric(revalue(df$Reflux_esophagitis, c("Yes" = 1, "No" = 0, "NA" = NA)))
df$Asthma <- as.numeric(revalue(df$Asthma, c("Yes" = 1, "No" = 0, "NA" = NA)))


# Keep only the specified columns
df_subset <- df[, c(
  "Additional_charges", "Age", "Services", "Doc_visits",
  "Complication_risk", "TotalCharge", "HighBlood", "Stroke", "Overweight", 
  "Arthritis", "Diabetes", "Hyperlipidemia", "BackPain", "Anxiety", 
  "Allergic_rhinitis", "Reflux_esophagitis", "Asthma"
)]

# View the resulting subset of the dataset
head(df_subset)

# Write 
write.csv(df_subset, "medical_clean_subsetted_data.csv", row.names = TRUE)