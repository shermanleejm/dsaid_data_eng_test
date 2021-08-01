# Section 5

## Intuition

This problem appears to be a classification problem.  
The input data given excludes the number of seats which I removed from the dataset.
Looking at the correlations between all the variables and `buying` it appears almost negligible.  
The only variable that can describe `buying` appears to be `class`.  
## Methods used

1. XGBoost  
   Did not produce the greatest of results having only 9% accuracy

2. Random Forest  
   Marginally better.  
   Cycled through the number of depths of tree from 1 to 10 and found a max_depth of 3 to work the best.  
   Ended up with 29% accuracy with buying price of `v-high`.

3. Decision Tree based on gini coefficient  
   Gave up on the more modern approaches and tried a simpler model.  
   Initially tried to remove 1 category at a time to see if that reduction in features would be sufficient to produce a better accuracy.  
   Ended up marginally the same at 30% accuracy with buying price of `low`.

4. Decision Tree with K-Fold cross-validation  
   The dataset is quite small for K-Fold but tried it anyway.  
   Applied K-Fold at n = 10 initially and got a highest accuracy of 41% and buying price of `med`.  
   Applied K-Fold at n = 100 and got a highest accuracy of 70% and buying price of `low`.

5. Train with all data  
   Buying price of `low`

## Final answer

The final answer would be a buying price of `low`.
