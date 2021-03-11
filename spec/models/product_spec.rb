require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    
    before(:each) do
      @a_category = Category.create(name: "clothing")
      
      @a_product = Product.create(
        name: 'sack', 
        price: 12.34, 
        quantity: 3, 
        category: @a_category
      )
    end
    
    it "creates a record" do
      
      expect(@a_product).to be_valid
    end
    
    
    it "validates name is present when new product created" do
      @a_product.name = nil
      expect(@a_product.name).to be_nil
      expect(@a_product).to_not be_valid
    end
  
    it "validates price is present when new product created" do
      @b_product = Product.create(
        name: 'sack', 
        price: nil, 
        quantity: 3, 
        category: @a_category
      )
      expect(@b_product.price).to be_nil
      expect(@b_product).to_not be_valid
    end

    it "validates quantity is present when new product created" do
      @a_product.quantity = nil
      expect(@a_product.quantity).to be_nil
      expect(@a_product).to_not be_valid
    end

    it "validates category is present when new product created" do
      @a_product.category = nil
      expect(@a_product.category).to be_nil
      expect(@a_product).to_not be_valid
    end



  end
end
