class Book < ApplicationRecord
    belongs_to :user #~に属するという意味だからモデル名（単数）
    validates :title, presence: true
    validates :body, presence: true, length: { maximum: 200 }
    scope :latest, -> {order(created_at: :desc)}
    scope :old, -> {order(created_at: :asc)}
    
end
