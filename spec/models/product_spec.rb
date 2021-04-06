require 'rails_helper'


RSpec.describe Product, type: :model do
  
  describe 'Validations' do
    before (:all) do
      @product = Product.new
    end
   
    context "needs all product fields to be filled" do
      it "is filled in all fields" do
        @category = Category.create(name: "String")
      prod = Product.new(
      name: "string",
      price: 1000,
      quantity: 10,
      category: @category
      ) 
      @product.save
      expect(prod).to be_present
     
    end
  end

    context "needs name" do
    it "is given a name" do
      @product.name = nil
      @product.validate
      expect(@product.errors[:name]).to include("can't be blank")

      @product.name = 'string'
      @product.validate
      expect(@product.errors[:name]).to_not include("can't be blank")
  end
end
      context "needs price" do
        it "is given a price" do
          @product.price = nil
          @product.validate
          expect(@product.errors[:price]).to include("is not a number", "can't be blank")

          @product.price = 1000
          @product.validate
          expect(@product.errors[:price]).to_not include("is not a number", "can't be blank")
      end
    end

      context "needs quantity" do
        it "is given a quantity" do
          @product.quantity = nil
          @product.validate
          expect(@product.errors[:quantity]).to include("can't be blank")

          @product.quantity = 10
          @product.validate
          expect(@product.errors[:quantity]).to_not include("is not a number", "can't be blank")
      end
    end

    context "needs category" do
    it "is given a category" do
        @product.category = nil
        @product.validate
        expect(@product.errors[:category]).to include("can't be blank")

        @category = Category.new
        @product.category = @category
        @product.validate 
        expect(@product.errors[:category]).to_not include("can't be blank")
      end
    end
  end
end
   
