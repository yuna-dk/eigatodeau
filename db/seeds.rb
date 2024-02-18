# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者ログイン設定
Admin.find_or_create_by!(email: 'admin@admin') do |admin|
  admin.email='admin@admin'
  admin.password='testtest'
end

# タグ検索
Tag.create([
    { name: 'anime'},
    { name: 'horror'},
    { name: 'action'},
    { name: 'comedy'},
    { name: 'love'},
    { name: 'fantasy'},
    { name: 'kids'},
    { name: 'others'}
    ])
