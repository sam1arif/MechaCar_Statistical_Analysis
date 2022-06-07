# MechaCar_Statistical_Analysis

## Linear Regression to Predict MPG:

  1. The vehicle length and vehicle ground clearance are likely to provide non-random amount of variance. Meaning the vehicle length and ground clearance both significantly effects our MPG in the dataset. On the other hand, the vehicle weight, spoiler angle and AWD feature have p-value of greater than 0.05 meaning there is no statistically significant observed difference; it indicates a random amount of variance through the dataset.

2. Slope of the linear model: The slope of this linear model is not zero, because the p-value of our slope/intercept in our analysis is 5.08e-08, which is much smaller than the assumed significance level of >0.05. This also rejects the null hypthesis.

3. In our linear regression model, the r-squared is 0.68, meaning that 68 percent of the predictions made from this analysis about mpg of MechaCar prototypes will be correct while using this model. ![Deliverable_one](https://user-images.githubusercontent.com/96811934/172295093-38423712-7e67-4ade-b135-1a108a27b78e.png)


## Summary Statistics on Suspension Coils
  The variance of the coils is 62.29 PSI for the entirety of three lots, which is within the 100 PSI variance requirement. Individually, Lot1 (variance = 0.97) and Lot2 (variance = 7.46) are within the 100 PSI variance requirement. However, Lot3 (variance = 170.28) doesn't meet the criteria as it has a greater variance of the suspension coils than 100 psi. It is Lot3 that is disproportionately skewing the variance of other lots as well.
  
  ![total_summary](https://user-images.githubusercontent.com/96811934/172301763-53fbb9dc-018c-4012-b39e-955e280f2098.png)
![lot_summary](https://user-images.githubusercontent.com/96811934/172301776-6571d640-2a30-4ceb-80e7-94c9c8a5e123.png)

## T-Tests on Suspension Coils
  Summary of the t-test across all manufacturing lots:
  ![summary_t_test](https://user-images.githubusercontent.com/96811934/172304011-d78abb86-53de-48d6-a14e-0b9a3a432b6d.png)

We can see in the screenshot that the mean of the sample is 1498.78. With a p-value of 0.06, which is higher than the assumed significance level of 0.05, indicating that there is not enough evidence to reject the null hypothesis. This means that all 3 manufacturing lots are statistically similar to the dictated population mean of 1500.

### Individual lots

  1. Lot1 has the sample mean of 1500 psi, which is exactly the population mean. With p-value = 1, which strongly indicates that the null hypothesis could not be rejected, meaning there is no statistical difference between the observed sample mean and the presumed population mean (1500).
  
  2. Lot2 (1500.2 psi) has essentially the same result as Lot1 but with its p-value = 0.6. Having said that, the null hypothesis cannot be rejected again, and the sample mean and the population mean of 1500 are statistically similar.
  
  3. Lot 3, on the other hand, is different. Lot3 has 1496.14 mean psi and the p-value = 0.04, which is lower than 0.05. This gives enough evidence to reject the null hypothesis that this sample mean and the presumed population mean are not statistically different.![t_test](https://user-images.githubusercontent.com/96811934/172304616-3d45e389-6ffb-4024-8e29-6d205013acea.png)


