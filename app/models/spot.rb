class Spot < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  attachment :image
  has_many :favorites, dependent: :destroy
  has_many :wents, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
  validates :body,  length: { maximum: 200 }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  def went_by?(user)
    wents.where(user_id: user.id).exists?
  end

end
