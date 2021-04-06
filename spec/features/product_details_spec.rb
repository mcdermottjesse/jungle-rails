# require 'rails_helper'

# RSpec.feature "Visitor navigates to the Product Details page", type: :feature, js: true do
#   before :each do
#     @category = Category.create! name: 'Product Details'

#     @category.products.create!(
#       name: 'test product',
#       description: 'test description',
#       image: open_asset('apparel5.jpg'),
#       quantity: 1,
#       price: 12.50
#     )
#   end
  
# scenario "They can see the product details that they chose" do
#   # ACT
#   visit '/products'
#   first('article.product').click_on('Details »')
#   expect(page).to have_content('test product')
#   expect(page).to have_content('12.50')
#   puts page.html
#   # DEBUG / VERIFY
#   save_screenshot
# end

# end
