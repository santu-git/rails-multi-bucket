class News < ApplicationRecord
  belongs_to :organization
  has_one_attached :featured 
end
