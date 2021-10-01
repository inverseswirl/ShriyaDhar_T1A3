require '../lib/inventory/items'
require '../lib/inventory/intro'
# require '../lib/inventory'



describe Item do

 
        #test cases
        #Feature 1 : Check for replenish of stock
        it 'should replenish the stock quantity' do
            item = Item.new
        expect(item.replenish_stock(item.quantity)).to eq( item.stock_in)
        end

        it 'should provide the reorder levels' do
            item = Item.new
            expect( item.find_reorder_level).to eq(item.reorder_level)
          end

        it 'should provide notification to user about stock levels and caution against low stock ' do
            item = Item.new
            expect( item.item_notification).to eq(item.notification)
        end

    #feature 2 - 
    it 'calculate sales' do
        item = Item.new
    expect(item.sales(item.quantity,item.units_sold)).to eq()
    end
    
        
end

# describe Intro do
#     it "should be an instance of Intro class " do
#         intro = Intro.new
#      expect(intro).to be_a Intro
#     end

#     it "should initialize with options" do
#         intro = Intro.new
#      expect(intro.options).to eq("\n"\
#         "  Hi, there! Welcome to the Inventory app!
#     This app will help an owner of a small Gift shop to manage his inventory stock,
#     display stock list, update inventory, get sales report and many other helpful tasks.\n"\
#     "-------------------------------------------------------------------------------------\n")
#     end
# end