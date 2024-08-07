# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 1つ目のサンプルデータ
Book.find_or_create_by!(title: "Sample Book 1") do |book|
  book.body = "素晴らしい内容の本です。"
  book.address = "東京都千代田区丸の内1丁目" 
  book.zipcode = "100-0005" # 郵便番号を追加
end


# 3つ目のサンプルデータ
Book.find_or_create_by!(title: "Sample Book 3") do |book|
  book.body = "深い洞察力が感じられる本です。"
  book.address = "大阪府大阪市淀川区西中島5-16-1" # 住所を追加
  book.zipcode = "532-0011" # 郵便番号を追加
end
