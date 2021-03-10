require 'rails_helper'

RSpec.feature "Visitor can add a product to their cart", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They add the first product to their cart" do
    # ACT
    visit root_path
    first('article.product').find_button('Add').click()


    # DEBUG
    
    # VERIFY
    expect(page).to have_selector :link, 'My Cart (1)'
    #expect(find_link('My Cart (1)')).to exist
    
    save_screenshot
  end
end
