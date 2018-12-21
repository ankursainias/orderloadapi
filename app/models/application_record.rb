class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.impressions
    impressionable_ids = Impression.where(controller_name: self.table_name).pluck(:impressionable_id)
    return self.where(id: impressionable_ids).uniq
  end
end
