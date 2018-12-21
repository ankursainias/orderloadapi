class Post < ApplicationRecord
  scope :published, -> { where(published: true) }
  include Paperclip::Glue
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  searchable do
    text :title, :boost => 5
    text :body, :stored => true
    text :publish_month
    time :published_at
    time :created_at
    string :publish_month
  end
    is_impressionable
    extend FriendlyId
    friendly_id :title, use: :slugged

  def publish_month
    if published
       published_at.strftime("%B %Y")
    else
      nil
    end
  end

end
