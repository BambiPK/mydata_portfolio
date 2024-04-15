### Data Profile in Power BI
This markdown aims to share about data profile in Power query based on what I know so far.  
**This time I would like to explain about different between distinct and unique example data from Northwind again**

![image](https://github.com/BambiPK/mydata_portfolio/assets/141467571/c9aadd15-8405-4903-9dbe-cbb627077052)

As you can see there are 3 columns in the picture  ProductID, ProductName and SupplierID.  
  There are 77 number in this dataset (77 rows) ProductID and ProductName has their own unique (one ID = one product name)  
  Focus on SupplierID, you may notice that one supplier sales many productID.  
  As you can see in column distribution. It defines **29 distinct and 3 unique.** So Look at column profile to see more clearly :arrow_down:
  ![image](https://github.com/BambiPK/mydata_portfolio/assets/141467571/73f444d5-728e-4577-bc47-a255cc07aca2)  
  There are total 29 different values (29 Suppliers) in the data set .  Check that there are 29 columns chart (SupplierID 7-27)  
  and there are **3 uniques** in this dataset that show only one time (Supplier 10,13,27)
  ![image](https://github.com/BambiPK/mydata_portfolio/assets/141467571/78f7da32-8a8c-4678-968f-69d4152d6833)   
  ![image](https://github.com/BambiPK/mydata_portfolio/assets/141467571/36f98df6-0fa7-4e2f-afc4-0ca718af1074)  

  Power query is a good simple tool to understand the data profile as for preliminary for me.
  



