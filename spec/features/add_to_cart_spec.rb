require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Cart Test'

    @category.products.create!(
      name: 'cart product',
      description: 'cart test description',
      image: '-',
      quantity: 1,
      price: 25.00
    )
  end

  scenario "Any user can add a product to cart" do
    # ACT
    visit '/products'
    first('article.product').find_button('Add').click()
    find_link('My Cart (1)').click()
    expect(find('header.page-header')).to have_content('My Cart')
    expect(page).to have_content('cart product')
    expect(page).to have_content("$25")
    puts page.html
    # DEBUG / VERIFY
    save_screenshot
  end
  
end
