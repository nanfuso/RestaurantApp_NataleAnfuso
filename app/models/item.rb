class Item < ApplicationRecord
    has_many :carted_products
    has_many :orders, through: :carted_products

    enum category: ["appetizer", "main course", "dessert", "side"]

    validates :name, presence: true
    validates :name, uniqueness: true
    validates :price, presence: true
    validates :price, numericality: true
    validates :description, presence: true
    validates :description, length: { maximum: 500 }


end
