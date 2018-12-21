class Order < ApplicationRecord
	# self.per_page = 10
has_many :items
	searchable do
		text :system_id
		text :tracker_hash
		boolean :response
		float :average_rating
		text :items do
		    items.map(&:name)
		  end
		# paginate :page => 1, :per_page => 2
	end
extend FriendlyId
friendly_id :system_id, use: :slugged
	def self.set_system_id
		begin
     		token = SecureRandom.hex(16)
   		end while Order.exists?(system_id: token)
   		return token
	end
end
