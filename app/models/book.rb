class Book < ApplicationRecord
    belongs_to :user #~に属するという意味だからモデル名（単数）
    validates :title, presence: true
    validates :body, presence: true, length: { maximum: 200 }
    validates :address, presence: true
    #addressカラムの内容を緯度・経度に変換することを指定
    geocoded_by :address
    #バリデーションの実行後に変換処理を実行して、latitudeカラム・longitudeカラムに緯度・経度の値が入力される。
    after_validation :geocode
    
    scope :latest, -> {order(created_at: :desc)}
    scope :old, -> {order(created_at: :asc)}
    enum enumtable: { credit_card: 0, transfer: 1 }
end
