# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ユーザー

# 1
User.create!(
  account_id: 'admin_user',
  email: 'admin_user@oniki.com',
  password: 'oniki1124',
  password_confirmation: 'oniki1124',
  first_name: "管理者",
  last_name: "株式会社オニキ商事",
  first_name_kana: "カンリシャ",
  last_name_kana: "カブシキカイシャオニキショウジ",
  first_name_roman: "KANRISYA",
  last_name_roman: "ONIKISYOJI",
  birthday: "2020-09-07",
  postcode: "9050206",
  prefecture_code: "47",
  address_city: "国頭郡本部町",
  address_street: "本部町字石川４２４",
  address_building: "美ら海水族館430",
  nickname: "ONK SHOP",
  is_valid: true,
  admin: true
)

# 2
User.create!(
  account_id: 'users2',
  email: 'users2@user.com',
  password: '000222',
  password_confirmation: '000222',
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

# 3
User.create!(
  account_id: 'users3',
  email: 'users3@user.com',
  password: '000333',
  password_confirmation: '000333',
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

# 4
User.create!(
  account_id: 'users4',
  email: 'users4@user.com',
  password: '000444',
  password_confirmation: '000444',
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

# 5
User.create!(
  account_id: 'users5',
  email: 'users5@user.com',
  password: '000555',
  password_confirmation: '000555',
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

# 6
User.create!(
  account_id: 'users6',
  email: 'users6@user.com',
  password: '000666',
  password_confirmation: '000666',
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

# 7
User.create!(
  account_id: 'users7',
  email: 'users7@user.com',
  password: '000777',
  password_confirmation: '000777',
  first_name: "菊生",
  last_name: "尾上",
  first_name_kana: "キクオ",
  last_name_kana: "オガミ",
  first_name_roman: "KIKUO",
  last_name_roman: "OGAMI",
  birthday: "2000-12-31",
  postcode: "9000021",
  prefecture_code: "47",
  address_city: "那覇市",
  address_street: "泉崎１丁目２−２",
  address_building: "沖縄県庁 独身寮302号室",
  is_valid: true,
  guest: true
)

# 8
User.create!(
  account_id: 'users8',
  email: 'users8@user.com',
  password: '000888',
  password_confirmation: '000888',
  first_name: "達也",
  last_name: "猪俣",
  first_name_kana: "タツヤ",
  last_name_kana: "イノマタ",
  first_name_roman: "TATSUYA",
  last_name_roman: "INOMATA",
  birthday: "1999-01-01",
  postcode: "0600808",
  prefecture_code: "1",
  address_city: "札幌市北区",
  address_street: "北８条西５丁目",
  address_building: "北大学生寮302",
  is_valid: true,
  admin: true,
  guest: true
)

# エリア

# 1
Area.create!(
  name: '北海道'
)

# 2
Area.create!(
  name: '東北'
)

# 3
Area.create!(
  name: '北関東'
)

# 4
Area.create!(
  name: '首都圏'
)

# 5
Area.create!(
  name: '北陸'
)

# 6
Area.create!(
  name: '甲信越'
)

# 7
Area.create!(
  name: '東海'
)

# 8
Area.create!(
  name: '近畿'
)

# 9
Area.create!(
  name: '山陽・山陰'
)

# 10
Area.create!(
  name: '四国'
)

# 11
Area.create!(
  name: '九州'
)

# 12
Area.create!(
  name: '沖縄'
)

# カテゴリー

# 1
Category.create!(
  name: '食べもの',
  is_valid: true
)

# 2
Category.create!(
  name: '飲みもの',
  is_valid: true
)

# 3
Category.create!(
  name: '雑貨',
  is_valid: true
)

# 4
Category.create!(
  name: '美容グッズ',
  is_valid: true
)

# 商品

# 1
Product.create!(
  category_id: "3",
  area_id: "1",
  name: "シャケを咥えた熊の置物",
  introduction: "バンクシーが北海道滞在中に制作したと言われている幻の作品です。限定１体のみの超限定品！
  「木彫りの熊の時代」と言われるほどここ数年間で一般的になってきた商品ですが、高級品を飾ってこそ玄関に箔がつくというもの。
  お父様方、この商品を通じて一家の大黒柱としての威厳をグッと高めませんか？",
  price: "10000000",
  is_valid: true,
  image: open("#{Rails.root}/db/fixtures/kuma03.jpeg")
)

# 2
Product.create!(
  category_id: "2",
  area_id: "6",
  name: "よなよなエール(24本)",
  introduction: "クラフトビールの王道の味わいを追求した、アメリカンペールエール。
  アロマホップ「カスケード」のグレープフルーツのようなフレッシュな香りと、やさしいモルトの甘みが特徴です。
  ビールが喉をとおったあとも、香りが心地よくとどまりつづけるよう醸造しました。お得な２４本セットでの販売！！",
  price: "6000",
  is_valid: true,
  image: open("#{Rails.root}/db/fixtures/yona01.jpeg")
)

# 3
Product.create!(
  category_id: "1",
  area_id: "11",
  name: "れんとゼリー",
  introduction: "奄美黒糖焼酎「れんと」がゼリーになりました！透き通るおいしさ、甘さ控えめスイーツゼリー。ツルっととろける美味しさが絶妙です。
  お酒が好きだったけれど、諦めていた方へ、「食べる喜び」を届けたい。そんな思いを込めて、毎晩の晩酌代わりに召し上がって頂ければと思っています。
  ※10個入り１箱",
  price: "2600",
  is_valid: true,
  image: open("#{Rails.root}/db/fixtures/rento01.jpg")
)

# 4
Product.create!(
  category_id: "1",
  area_id: "8",
  name: "A5ランク神戸牛(1kg)",
  introduction: "「今日はいい肉が食べたい」そんなあなたに朗報です！
  厳しい厳しい品質検査を通過したA5ランクの神戸牛をご用意しました。
  ステイホームでご自宅で過ごす日々が続く今日この頃、お家でできる贅沢の選択肢としていかがでしょうか。
  1kgで25000円の破格とお値段で買えるのは今だけ！",
  price: "25000",
  is_valid: true,
  image: open("#{Rails.root}/db/fixtures/kobe02.png")
)

# 5
Product.create!(
  category_id: "3",
  area_id: "2",
  name: "【岩手県】最高級徳利",
  introduction: "「今日はお酒注文しようかな」、ちょっと待って！
  お酒をこよなく愛する方であれば、それを注ぐ器にもこだわりたいですよね？
  岩手県山田町で生産された徳利は緻密に計算された曲線美が人の目を惹いて離さない最高品質の逸品です。
  本物がわかるあなたにこそ手に取ってもらいたい至極の名品です。",
  price: "5000",
  is_valid: true,
  image: open("#{Rails.root}/db/fixtures/tokkuri01.jpg")
)

# 6
Product.create!(
  category_id: "1",
  area_id: "3",
  name: "【北関東限定】柿の種",
  introduction: "北関東と言えばコレ！限定柿の種セット「4種類x4袋=16袋」がお安くなりました！！
  限りなく濃厚でお菓子の範疇を超えたとされる旨チーズ。ピリっと辛さが効いたわさび風味。北関東はコレと言われるほどの餃子風味。お酒のつまみとして最適な梅しそ味。
  あなたの好みはどの味でしょうか？？",
  price: "3000",
  is_valid: true,
  image: open("#{Rails.root}/db/fixtures/kakitane01.jpg")
)

# 7
Product.create!(
  category_id: "2",
  area_id: "12",
  name: "オリオンビール【24本】",
  introduction: "三ツ星かざして高々と、ビールに託したウチナーの、夢と飲むから美味しいさ、オジー自慢のオリオンビール。
  なんくるないさやってみれ、ワッター自慢のオリオンビール。卒業祝いであっり乾杯！就職祝いであっり乾杯！誕生祝いであっり乾杯！
  オジー自慢のオリオンビール！オジーと一緒にあっり乾杯！",
  price: "3000",
  is_valid: true,
  image: open("#{Rails.root}/db/fixtures/orion01.jpg")
)

# 8
Product.create!(
  category_id: "4",
  area_id: "5",
  name: "畑の国のアリス",
  introduction: "農業に従事する女性たちの声から生まれた、石川県産のやさしさいっぱいのハンドクリーム。
  ハンドクリームを塗った手で直接食材に触れてもいいように、すべて食べることのできる成分のみで作り、無味無臭にも気を配りました。
  紫外線カット効果のある成分が手を守り、日焼けを軽減してくれます。",
  price: "1500",
  is_valid: true,
  image: open("#{Rails.root}/db/fixtures/alice01.jpeg")
)

# 9
Product.create!(
  category_id: "3",
  area_id: "9",
  name: "倉敷ジーンズ",
  introduction: "言わずとしれた国産ジーンズブランド。2020秋冬シーズンの新作が早くも入荷しました。
  日本人の体型を最大限カッコよく見せることを追求した独特のシルエットは、他の海外産のジーンズでは実現不可能なクオリティです。
  ジーンズを最大限に楽しみたい大人の男性にぴったりです。",
  price: "15000",
  is_valid: true,
  image: open("#{Rails.root}/db/fixtures/kurasiki01.jpeg")
)

# 10
Product.create!(
  category_id: "3",
  area_id: "4",
  name: "【原宿】熊のぬいぐるみ",
  introduction: "インスタ女子に大人気の原宿セレクトショップ「NUIGURUMI-TOKYO」から限定アイテムが入荷しました。
  このぬいぐるみを持って電車に乗ればインスタグラマー達の視線を集めること間違いなしの超バズりアイテムです。
  このチャンスを活かさないのはもったいないですよ！今すぐご購入を！",
  price: "15000",
  is_valid: true,
  image: open("#{Rails.root}/db/fixtures/kuma01.jpg")
)

# 11
Product.create!(
  category_id: "4",
  area_id: "10",
  name: "今治フェイスタオル(4枚)",
  introduction: "ONK SHOPPINGでも大人気の今治タオルセットですが、
  今期のタオル生地は職人も「タオル人生を通じて、これ以上のものは見たことのない至極の逸品」と語るほどのクオリティ。
  このタオルを使ってしまうともう他を使えなくなるかも？さらに進化した今治タオルの肌触りをぜひ体験してください！",
  price: "7000",
  is_valid: true,
  image: open("#{Rails.root}/db/fixtures/imabari01.jpg")
)

# 12
Product.create!(
  category_id: "2",
  area_id: "7",
  name: "ちゃレンジ(24缶)",
  introduction: "お茶の生産日本一、みかんの生産でも全国3位の静岡が誇るソウルドリンク！
  「静岡の人だけでなく全国の人を、ちゃレンジで幸せにしたい」というメーカーの熱い思いから満を持してのONK SHOPPING出店！
  期間限定のサービスプライス、みかんとお茶のハーモニーをお楽しみください！",
  price: "1800",
  is_valid: true,
  image: open("#{Rails.root}/db/fixtures/cha01.jpg")
)