[Link to repository](https://github.com/inverseswirl/ShriyaDhar_T1A3)

### **Purpose and Scope**
The Inventory app will help small gift shop owners to manage their inventory.
It will help them to view the initial Inventory stock in hand, make changes to the stock quantity depending upon the number of product units sold receive notification about the reorder levels of the stock, replenish the stock if the inventory is very low and calculate sales on the number of units sold. 

The owner will initially login into the app. He/She will be welcomed by a message describing, in brief, the purpose of the app. Then the user will see a list of options and will be prompted to select one from those options. The owner can then select the actions or tasks he wishes to perform. The owner can perform multiple tasks and once finished can exit from the app by making the last choice. The result is displayed in the form of tables for a tabular overlook of the changes updated in the Inventory Stock.

As the user progresses and uses multiple options, the state of inventory changes continuously. For instance, at any time owner chooses to add the purchase order and replenish his stock in the app, the owner can choose Replenish order option and the fresh stock units will get added to the previous quantity. Once user is done will all tasks, he can exit the app choosing the Exit option.


### **Limitations**

Safety stock is usually calculated using multiple determinants such as maximum and average lead time
and maximum and average units sold. In this app, the safety stock is fixed at 10 units for each product.
These ten units are added to the reorder level to obtain the **Stock-In.**

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

**1. Display Inventory stock**

Users can log into the app and visualize the initial Inventory stock. This data is enclosed inside the class Item.
When the user chooses option 1, he will be able to see the product names, the unit price of each product, the initial quantity of each product, Optimum reorder levels and the notification for the current stock levels. There are total ten products in the inventory in this app. The current quantity is compared with the reorder levels. If the quantity is lesser than the reorder level, 
it will show an indicator to the owner as - `Very low in stock.` Similarly, if the stock is equal to the reorder level, it will display - `Reorder level reached` and if the quantity is greater than the reorder level it will indicate- `Stock already full`.

The owner can decide to replenish the stock or add sold units etc. 

**2. Add Sold units and update qantity**

A shop owner can add the units of product sold and update the **Inventory stock.** This feature is essential for obtaining the amount of stock left in hand, comparing the reorder levels with updated quantity and making other decisions to either replenish the stock or calculate sales on freshly sold units. The product sold units will help the owner to perform other tasks. The table displays previous quantity, sold units and the updated stock side-by-side to have a better understanding of the changes made.

**3. Replenish Stock**

Replenishing stock is essential. When the owner receives the physical quantity or purchased order, the **replenish option** inside the app will enable him to replenish the current quantity. This makes sure that the physically received purchased order is updated inside the app so that consistency is maintained between the online data and physical quantity. This option helps the owner to keep a track of the replenished stock and update the quantity so that it doesn't fall short of the optimum reorder levels. 

The notification function helps to inform the owner about the reorder levels and keep the stock levels up-to-date.

If the `Stock already full` signs flashes, that particular quantity won't get replenished as it is already full and up-to-date.
If the notification shows, `Reorder level reached` or `Very low in stock.` for products, those products will get replenished. 
 
**4. Calculate Sales and Cumulative sales**

Sales are an important part of the Inventory app. The **sales option** helps the owner determine which products are of most value to their business and are top-selling. Sales are calculated using the factors - the unit price of the product multiplied by the product units sold. This informs the user of the sales contributed by each product in their inventory list. Excessive inventory comes with a cost for any business. The products of **high value** i.e the ones that bring the maximum percentage of margins are the star performers out of all products. Maintaining a good inventory of that product is crucial for the sustenance of good business.
This option also helps to obtain Cumulative sales. That in turn will help to determine the most valuable product which brings maximum sales persistently.

**5. Top selling product**

Cumulative sales will help to determine the top-selling product. It is the product that brings maximum sales for the business. This always guides the owner to replenish the stock of this product and never maintain a low stock. This product is usually in high demand. A good inventory of this product will ensure that this product never runs out of stock and saves business costs as much as possible.



### **Control Flow**

<img src="./docs/controlflow.png">

### **User interaction**

1. User will be prompted multiple options on opening the app. Then the user can perform multiple tasks or actions to manage Inventory.

2. User can view the Inventory using **Display Inventory option**. If the user wants to add the sold units and update quantity, he can use the **Add Sold units & Update Quantity option**. 

3.  Once the user has added sold units, he can obtain sales and view the sales using the **Sales option**. He will also be able to obtain **cumulative sales**. 

4. If the user wishes to obtain the top-selling product, he can choose the **option 5 - Top selling product**.

5. This way users can continuously update quantity, or replenish the stock or obtain sales or top-selling product for the units sold.
 
6. If a user tries to obtain sales or check top-selling product before adding sold units, he will be prompted with a message that says **"Add Sold units before obtaining sales or top selling product**. 


### **Installation**

1. Open the terminal and Go to your Desktop from terminal

```
cd Desktop
```

2. Use the command below to clone the git repository. This will create a new folder ShriyaDhar_T1A3 and clone all the files present in the repository inside the folder.

```
git clone git@github.com:inverseswirl/ShriyaDhar_T1A3.git
```

3. Go to the folder 

```
cd ShriyaDhar_T1A3
```

4. Run the executable file with the command given below. This will start the app.

```
./run_inventory_app.sh 
```


### **Implementation**

The [link](https://trello.com/b/YxuGO6LC/giftshopinventory-app) to the Trello board for implementation plan.




