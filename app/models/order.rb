class Order < ApplicationRecord
    belongs_to :user
    has_many :carted_products
    has_many :items, through: :carted_products


    def calculate_totals
        subtotal_sum = 0
        carted_products.each do |carted_product|
            subtotal_sum += carted_product.subtotal
        end
        self.tip = tip || 0
        self.subtotal = subtotal_sum
        self.tax = subtotal * 0.09
        self.total = subtotal + tax + tip
        save
    end
end