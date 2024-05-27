# Import and open medical clean data 
library(readxl)
df <- read_excel("C:/Users/kolgi/OneDrive - Western Governors University/d208/medical_clean.xlsx")
View(df)

# Understanding and exploring the data
summary(df)
head(df)
str(df) 

# Use naniar to find missing values 
library(naniar) 
miss_var_summary(df)
miss_case_summary(df)

# count duplicates
sum(duplicated(df)) 


# Count how many outliers for each variable using the Interquartile method
count_outliers <- function(x) {
  q1 <- quantile(x, 0.25, na.rm = TRUE)
  q3 <- quantile(x, 0.75, na.rm = TRUE)
  iqr <- q3 - q1
  lower_bound <- q1 - 1.5 * iqr
  upper_bound <- q3 + 1.5 * iqr
  
  outliers <- sum(x < lower_bound | x > upper_bound, na.rm = TRUE)
  return(outliers)
}

# List of variables for which you want to count outliers
variables_of_interest <- c("CaseOrder", "Zip", "Lat", "Lng" ,"Population", "Children", "Age", "Income", "VitD_supp", 
                           "VitD_levels", "Doc_visits", "Full_meals_eaten", "Initial_days", "TotalCharge", 
                           "Additional_charges", "Item1", "Item2", "Item3", "Item4", "Item5", 
                           "Item6", "Item7", "Item8")
outlier_counts <- data.frame(Variable = variables_of_interest, Count = numeric(length(variables_of_interest)))

# Loop through each variable
for (i in seq_along(variables_of_interest)) {
  variable <- variables_of_interest[i]
  outlier_counts$Count[i] <- count_outliers(df[[variable]])
}

# Print or inspect the outlier counts
print(outlier_counts)
