require '../lib/inventory/items'
require '../lib/inventory/intro'




describe Item do

    #test cases
    #Feature 1 : Check for Replenishment of stock
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

    #feature 2 - Test for Calculation of sales 
    it 'should help to check whether the .get_sales method returns sales' do
       item = Item.new
       expect(item.get_sales(item.units_sold, item.quantity)).to eq(item.sales)
    end
       it 'should handle any error from within the cumulative sales method.' do
        item = Item.new
        expect(item.cumulative_sales(item.sales)).to eq(item.total_sales)
    end
        
end

