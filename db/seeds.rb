# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# タグ検索
Tag.find_or_create_by!({ name: 'anime' })
Tag.find_or_create_by!({ name: 'horror' })
Tag.find_or_create_by!({ name: 'action' })
Tag.find_or_create_by!({ name: 'comedy' })
Tag.find_or_create_by!({ name: 'love' })
Tag.find_or_create_by!({ name: 'fantasy' })
Tag.find_or_create_by!({ name: 'kids' })
Tag.find_or_create_by!({ name: 'others' })


olivia = Customer.find_or_create_by!(email: "olivia@example.com") do |customer|
  customer.name = "Olivia"
  customer.password = "password"
  customer.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-customer1.jpg"), filename:"sample-customer1.jpg")
end

james = Customer.find_or_create_by!(email: "james@example.com") do |customer|
  customer.name = "James"
  customer.password = "password"
  customer.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-customer2.jpg"), filename:"sample-customer2.jpg")
end

lucas = Customer.find_or_create_by!(email: "lucas@example.com") do |customer|
  customer.name = "Lucas"
  customer.password = "password"
  customer.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-customer3.jpg"), filename:"sample-customer3.jpg")
end

record = PostMovie.find_or_create_by!(title: "ヒーロー物語") do |post_movie|
  post_movie.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
  post_movie.impression = "かっこよかった！"
  post_movie.customer = olivia
  post_movie.star = 3
end

record.tags << Tag.where(name: 'action')
record.save

record = PostMovie.find_or_create_by!(title: "こい") do |post_movie|
  post_movie.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg")
  post_movie.impression = "感動した…"
  post_movie.customer = james
  post_movie.star = 2
end

record.tags << Tag.where(name: 'love')
record.save

record = PostMovie.find_or_create_by!(title: "いかさまゲーム") do |post_movie|
  post_movie.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg")
  post_movie.impression = "ハラハラして面白かった！"
  post_movie.customer = lucas
  post_movie.star = 4
end

record.tags << Tag.where(name: 'action')
record.tags << Tag.where(name: 'comedy')
record.save

record = PostMovie.find_or_create_by!(title: "廃墟") do |post_movie|
  post_movie.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post4.jpg"), filename:"sample-post4.jpg")
  post_movie.impression = "怖かったけど面白かった。"
  post_movie.customer = lucas
  post_movie.star = 4
end

record.tags << Tag.where(name: 'horror')
record.save

record = PostMovie.find_or_create_by!(title: "死神") do |post_movie|
  post_movie.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post5.jpg"), filename:"sample-post5.jpg")
  post_movie.impression = "怖かったけどまたみたい！！"
  post_movie.customer = lucas
  post_movie.star = 5
end

record.tags << Tag.where(name: 'horror')
record.save


# 管理者ログイン設定
Admin.find_or_create_by!(email: 'admin@admin') do |admin|
  admin.email='admin@admin'
  admin.password='testtest'
end