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
  password: '000111',
  password_confirmation: '000111',
  first_name: "太郎",
  last_name: "山田",
  first_name_kana: "タロウ",
  last_name_kana: "ヤマダ",
  first_name_roman: "TARO",
  last_name_roman: "YAMADA",
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
  password: '000222',
  password_confirmation: '000222',
  first_name: "華子",
  last_name: "田中",
  first_name_kana: "ハナコ",
  last_name_kana: "タナカ",
  first_name_roman: "HANAKO",
  last_name_roman: "TANAKA",
  birthday: "1990-04-25",
  postcode: "1000014",
  prefecture_code: "13",
  address_city: "千代田区",
  address_street: "永田町1-7-1",
  address_building: "国会議事堂101",
  nickname: "タナカハナコやで",
  is_valid: true,
)

User.create!(
  account_id: 'users3',
  email: 'users3@user.com',
  password: '333333',
  password_confirmation: '333333',
  first_name: "和久",
  last_name: "青山",
  first_name_kana: "カズヒサ",
  last_name_kana: "アオヤマ",
  first_name_roman: "KAZUHISA",
  last_name_roman: "AOYAMA",
  birthday: "1989-12-25",
  postcode: "2310001",
  prefecture_code: "14",
  address_city: "横浜市中区",
  address_street: "新港1-1",
  address_building: "赤レンガ倉庫404",
  nickname: "青山和久やで",
  is_valid: true,
)

User.create!(
  account_id: 'users4',
  email: 'users4@user.com',
  password: '000444',
  password_confirmation: '000444',
  first_name: "瞳",
  last_name: "岡崎",
  first_name_kana: "ヒトミ",
  last_name_kana: "オカザキ",
  first_name_roman: "HITOMI",
  last_name_roman: "OKAZAKI",
  birthday: "1996-11-10",
  postcode: "2390801",
  prefecture_code: "14",
  address_city: "横須賀市",
  address_street: "馬堀海岸4-1-23",
  is_valid: true,
)

User.create!(
  account_id: 'users5',
  email: 'users5@user.com',
  password: '000555',
  password_confirmation: '000555',
  first_name: "蒼甫",
  last_name: "白鳥",
  first_name_kana: "ソウスケ",
  last_name_kana: "シラトリ",
  first_name_roman: "SOSUKE",
  last_name_roman: "SHIRATORI",
  birthday: "1970-01-23",
  postcode: "3570112",
  prefecture_code: "11",
  address_city: "飯能市",
  address_street: "大字下名栗917",
  address_building: "大松閣205",
  is_valid: true,
)