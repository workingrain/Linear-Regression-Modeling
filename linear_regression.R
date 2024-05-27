# Linear regression model for initial model
model <- lm(Additional_charges ~ Age + Services + Doc_visits + Complication_risk +
              TotalCharge + HighBlood + Stroke + Overweight + Arthritis + Diabetes +
              Hyperlipidemia + BackPain + Anxiety + Allergic_rhinitis + 
              Reflux_esophagitis + Asthma,
            data = df)
summary(model) # Print summary of the model

# Perform backward stepwise elimination
reduced_model <- step(model, direction = "backward")

# Print summary of the reduced model
summary(reduced_model)

# Residuals for final model
final_residuals <- resid(reduced_model)

# QQ Plot for final model
qqnorm(final_residuals)
qqline(final_residuals)