# require '../lib/inventory/items.rb'
# require '../lib/inventory/intro.rb'


# describe Item do
#     before(:example) do
#         item = Item.new
#     end

#     context 'on initialize' do
#         it 'should be an instance of a Item' do
#           expect(item).to be_a Item
#         end

#         it 'should initialize with name' do
#             expect(item.name).to eq( ["scented_candles", "greeting_cards", "wall_clocks", 
#                 "photo_frames", "soft_toys", "perfume_bottles", "chocolate_boxes", 
#                 "Jigsaw_puzzle_box", "souvenir_mugs", "novels"])
#           end

#     end
        
#     # it "should call intro_input variable" do
        
# end

# describe Intro do
#     it "should be an instance of Intro class " do
#         intro = Intro.new
#      expect(intro).to be_a Intro
#     end

#     it "should display app description" do
#         puts intro.inventory_options
#      expect(puts intro.intro_description).to eq("\n"\
#         "  Hi, there! Welcome to the Inventory app!
#     This app will help an owner of a small Gift shop to manage his inventory stock,
#     display stock list, update inventory, get sales report and many other helpful tasks.\n"\
#     "-------------------------------------------------------------------------------------\n")
#     end
# end