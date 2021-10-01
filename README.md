[Link to repository](https://github.com/inverseswirl/ShriyaDhar_T1A3)

### **Purpose and Scope**
The Inventory app will help small gift shop owners to manage their inventory.
It will help them to view the initial Inventory stock in hand, make changes to the stock quantity depending upon the number of product units sold receive notification about the reorder levels of the stock, replenish the stock if the inventory is very low and calculate sales on the number of units sold. 

The owner will initially login into the app. He/She will be welcomed by a message describing, in brief, the purpose of the app. Then the user will see a list of options and will be prompted to select one from those options. The owner can then select the actions or tasks he wishes to perform. The owner can perform multiple tasks and once finished can exit from the app by making the last choice. The result is displayed in the form of tables for a tabular overlook of the changes updated in the Inventory Stock.


### **Limitations**

Safety stock is usually calculated using multiple determinants such as maximum and average lead time
and maximum and average units sold. In this app, the safety stock is fixed at 10 units for each product.
These ten units are added to the reorder level to obtain the Stock In.

Also, the option for the addition and deletion of products items from the Inventory list isn't included. 

### **Problem statements**

- How can the owner check the inventory status?
- How can the owner update the sold units?
- How can the owner check, calculate the sales & cumulative sales?
- How can the owner replenish the stock based on the notification system?

### **Target Audience**

The target audience for this app is small gift shop owners. 
Though the scope of the app is limited and can be used by small shop owners, it can be easily scaled
to add more features for larger businesses or to solve various other Inventory management problems.


### **List of features:**

1. Dsiplay Inventory stock - 
Users can log into the app and visualize the initial Inventory stock. This data is enclosed inside the class Item.
When the user chooses option 1, he will be able to see the product names, the unit price of each product, the initial quantity of each product, Optimum reorder levels and the notification for the current stock levels. The current quantity is compared with the reorder levels. If the quantity is lesser than the reorder level, 
it will show an indicator to the owner as - `Very low in stock. Similarly, if the stock is equal to the reorder level, it will display - `Reorder level reached` and if the quantity is greater than the reorder level it will indicate- `Stock already full`.

The owner can decide to replenish the stock or add sold units etc.

2. Add Sold units and update qantity - 




