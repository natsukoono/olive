class Comment < ApplicationRecord
  attachment :image
  belongs_to :user
  belongs_to :spot
end
