require "pry"
class CashRegister
    attr_accessor :total, :discount, :last_transaction_amount, :items
   

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @cart = []
    end

    def add_item(item, price, quantity = 1)
        item_info = {}
       
        item_info[:item] = item
        item_info[:price] = price
        item_info[:quantity] = quantity

        @cart << item_info
        @total += price * quantity
        @last_transaction_amount = @total
    end

    def apply_discount
        if @discount == 0
            return "There is no discount to apply."
        end
        @total -= @total * @discount /100
          return "After the discount, the total comes to $#{@total}."
    end

    def items
        # @cart
        items_array = []
       @cart.each do |item_hash|
        # binding.pry

        # items_array << item_hash[:item]
        item_hash[:quantity].times {items_array << item_hash[:item]}
        end
        items_array
      end
    
      def void_last_transaction
        @total -= @last_transaction_amount
      end
end
