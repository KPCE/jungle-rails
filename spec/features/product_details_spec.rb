require 'rails_helper'

RSpec.feature "Visitor navigates to product details page", type: :feature, js: true do

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

  scenario "They navigate to the first product's details page" do
    # ACT
    visit root_path
    first('article.product').find_link('Details').click()


    # DEBUG
    
    # VERIFY
    expect(find('header.page-header')).to have_content('Apparel')
    
    expect(page).to have_content('10')
    expect(page).to have_content('64.99')
    #save_screenshot
  end

end
