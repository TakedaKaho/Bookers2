class Book < ApplicationRecord
    belongs_to :user #~に属するという意味だからモデル名（単数）
end
