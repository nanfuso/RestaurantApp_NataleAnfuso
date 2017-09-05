class User < ApplicationRecord
    has_secure_password
    has_many :orders
    has_many :carted_products

    validates :name, presence: true
    validates :name, uniqueness: true
    validates :email, presence: true
    validates :email, uniqueness: true

    def cart
        carted_products.where(status: "carted")
    end
end
