class GroceryList < ApplicationRecord
	validates :user_id, presence: true
	validates :status, presence: true

	belongs_to :user
	has_many :grocery_list_items
	enum status: [ :active, :inactive ]

	before_create do
		@list = Hash.new([0])
	end

	def add_to_list(name, amount, item_name)
		if amount.is_a?(Float)
			@list[name] = [amount.to_f, item_name]
		elsif amount == "" && @list[name] == [0]
			@list[name] = [1.0, item_name]
		end
	end

	def save_list
		@list.each do |item|
			new_item = GroceryListItem.create(:name => item[0], :amount => item[1][0], :grocery_list_id => self.id, :item_name => item[1][1])
		end
	end

	def get_list
		list = []
		self.grocery_list_items.each do |item|
			if item.name[-1] != ":"
				list << item.to_s
			end
		end
		list
	end
end
