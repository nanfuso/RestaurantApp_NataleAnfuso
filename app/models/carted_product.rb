class CartedProduct < ApplicationRecord
    belongs_to :item
    belongs_to :user
    belongs_to :order, optional: true

    def subtotal
        item.price * quantity
    end

end
