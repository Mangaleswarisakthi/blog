class Article < ApplicationRecord
has_many :comments,dependent: :destroy

validates :title, :presence => true, :length => {:minimum => 6}
  validates :text, :length => {:minimum => 20}
end
