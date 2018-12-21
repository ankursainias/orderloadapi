class AddAverageRatingToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :average_rating, :float, default: 0
  end
end
