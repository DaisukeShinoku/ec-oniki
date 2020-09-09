# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  account_id: 'users1',
  email: 'users1@user.com',
  password: '123456',
  password_confirmation: '123456',
  first_name: "太郎",
  last_name: "山田",
  first_name_kana: "タロウ",
  last_name_kana: "ヤマダ",
  first_name_roman: "TARO",
  last_name_roman: "YAMADA",
  gender: true,
  birthday: "1992-03-23",
  postcode: "1638001",
  prefecture_code: "13",
  address_city: "新宿区",
  address_street: "西新宿2-8-1",
  address_building: "都庁302",
  nickname: "ヤマダタロウやで",
  is_valid: true,
)

User.create!(
  account_id: 'users2',
  email: 'users2@user.com',
  password: '654321',
  password_confirmation: '654321',
  first_name: "華子",
  last_name: "田中",
  first_name_kana: "ハナコ",
  last_name_kana: "タナカ",
  first_name_roman: "HANAKO",
  last_name_roman: "TANAKA",
  gender: false,
  birthday: "1990-04-25",
  postcode: "1000014",
  prefecture_code: "13",
  address_city: "千代田区",
  address_street: "永田町1-7-1",
  address_building: "国会議事堂101",
  nickname: "タナカハナコやで",
  is_valid: true,
)