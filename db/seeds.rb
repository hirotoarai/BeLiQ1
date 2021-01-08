# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  Admin.create!(
  name: "koro",
  password: "korokoro"
  )

  User.create!([{
  name: "ah",
  introduction: "プログラミング勉強中",
  password: "ah940325",
  profile_image: File.open("./app/assets/images/どくろ.jpg"),
  },

  {
  name: "ah2",
  introduction: "プログラミング初心者です",
  password: "ah9403252",
  profile_image: File.open("./app/assets/images/指名手配.jpg"),
  },

  {
  name: "サンタクロース",
  introduction: "１２月は忙しいです",
  password: "santakurosu",
  profile_image: File.open("./app/assets/images/サンタクロース.jpg"),
  },

  {
  name: "サーカス団",
  introduction: "サーカス団員です",
  password: "sakasudan",
  profile_image: File.open("./app/assets/images/サーカス団.jpg"),
  },

  {
  name: "名探偵",
  introduction: "職業は探偵です。",
  password: "meitantei",
  profile_image: File.open("./app/assets/images/名探偵.jpg"),
  },

  {
  name: "テニス選手",
  introduction: "ポニテ好き",
  password: "tenisusensyu",
  profile_image: File.open("./app/assets/images/テニス選手.jpg"),
  },

  {
  name: "二児の父",
  introduction: "双子の男女",
  password: "nijinotiti",
  profile_image: File.open("./app/assets/images/二児の父.jpg"),
  },

  {
  name: "令和の侍",
  introduction: "銃刀法を守ります。",
  password: "reiwanosamurai",
  profile_image: File.open("./app/assets/images/令和の侍.jpg"),
  },

  {
  name: "某国の王様",
  introduction: "国を一つ所持",
  password: "boukokunooosama",
  profile_image: File.open("./app/assets/images/某国の王様.jpg"),
  },

  {
  name: "磯野波平",
  introduction: "５６際既婚",
  password: "isononamihei",
  profile_image: File.open("./app/assets/images/磯野波平.jpg"),
  },

  {
  name: "神経外科医",
  introduction: "普段は医者です。",
  password: "shinkeigekai",
  profile_image: File.open("./app/assets/images/神経外科医.jpg"),
  },

  {
  name: "アシンメトリー",
  introduction: "新社会人です。",
  password: "ashinmetori",
  profile_image: File.open("./app/assets/images/アシンメトリー.jpg"),
  },

  {
  name: "インド人です",
  introduction: "インド出身２６歳。",
  password: "indojindes",
  profile_image: File.open("./app/assets/images/インド人です.jpg"),
  },

  {
  name: "コメント好き",
  introduction: "コメント好きです。",
  password: "komentzuki",
  profile_image: File.open("./app/assets/images/コメント好き.jpg"),
  },

  {
  name: "スパイです",
  introduction: "某国から某国へ",
  password: "supaides",
  profile_image: File.open("./app/assets/images/スパイです.jpg"),
  },

  {
  name: "警察官",
  introduction: "生涯現役",
  password: "keisatukan",
  profile_image: File.open("./app/assets/images/警察官.jpg"),
  },

  {
  name: "警備員です",
  introduction: "在宅勤務中",
  password: "keibiindes",
  profile_image: File.open("./app/assets/images/警備員です.jpg"),
  },

  {
  name: "好青年",
  introduction: "好青年とよく言われます",
  password: "kouseinen",
  profile_image: File.open("./app/assets/images/好青年.jpg"),
  },

  {
  name: "歯科助手",
  introduction: "歯科助手です",
  password: "shikajosyu",
  profile_image: File.open("./app/assets/images/歯科助手.jpg"),
  },

  {
  name: "社長令嬢",
  introduction: "実家がお金持ち",
  password: "syatyoureijou",
  profile_image: File.open("./app/assets/images/社長令嬢.jpg"),
  },

  {
  name: "女子高２年",
  introduction: "jk2",
  password: "joshikouninen",
  profile_image: File.open("./app/assets/images/女子高２年.jpg"),
  },

  {
  name: "占い師",
  introduction: "今年大殺界突入！！",
  password: "uranaishi",
  profile_image: File.open("./app/assets/images/占い師.jpg"),
  },

  {
  name: "正岡子規",
  introduction: "正岡子規と申します",
  password: "masaokashiki",
  profile_image: File.open("./app/assets/images/正岡子規.jpeg"),
  },

  {
  name: "入院中",
  # introduction: "骨折しました。",
  password: "nyuuintyuu",
  profile_image: File.open("./app/assets/images/入院中.jpg"),
  }])

  User.all.each do |user|
    user.posts.create!(
    category: '質問',
    title: '投稿タイトルのテスト投稿タイトルのテスト',
    body: '投稿本文のテスト投稿本文のテスト',
    )
  end