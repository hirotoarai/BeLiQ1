
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
  profile_image: File.open("./public/images/とくろ.jpg"),
  },

  {
  name: "ah2",
  introduction: "プログラミング初心者です",
  password: "ah9403252",
  profile_image: File.open("./public/images/指名手配.jpg"),
  },

  {
  name: "サンタクロース",
  introduction: "１２月は忙しいです",
  password: "santakurosu",
  profile_image: File.open("./public/images/サンタクロース.jpg"),
  },

  {
  name: "サーカス団",
  introduction: "サーカス団員です",
  password: "sakasudan",
  profile_image: File.open("./public/images/サーカス団.jpg"),
  },

  {
  name: "名探偵",
  introduction: "職業は探偵です。",
  password: "meitantei",
  profile_image: File.open("./public/images/名探偵.jpg"),
  },

  {
  name: "テニス選手",
  introduction: "ポニテ好き",
  password: "tenisusensyu",
  profile_image: File.open("./public/images/テニス選手.jpg"),
  },

  {
  name: "二児の父",
  introduction: "双子の男女",
  password: "nijinotiti",
  profile_image: File.open("./public/images/二児の父.jpg"),
  },

  {
  name: "令和の侍",
  introduction: "銃刀法を守ります。",
  password: "reiwanosamurai",
  profile_image: File.open("./public/images/令和の侍.jpg"),
  },

  {
  name: "某国の王様",
  introduction: "国を一つ所持",
  password: "boukokunooosama",
  profile_image: File.open("./public/images/某国の王様.jpg"),
  },

  {
  name: "磯野波平",
  introduction: "５６際既婚",
  password: "isononamihei",
  profile_image: File.open("./public/images/磯野波平.jpg"),
  },

  {
  name: "神経外科医",
  introduction: "普段は医者です。",
  password: "shinkeigekai",
  profile_image: File.open("./public/images/神経外科医.jpg"),
  },

  {
  name: "アシンメトリー",
  introduction: "新社会人です。",
  password: "ashinmetori",
  profile_image: File.open("./public/images/アシンメトリー.jpg"),
  },

  {
  name: "カレー好き",
  introduction: "インド出身２６歳。",
  password: "karezuki",
  profile_image: File.open("./public/images/カレー好き.jpg"),
  },

  {
  name: "コメント好き",
  introduction: "コメント好きです。",
  password: "komentzuki",
  profile_image: File.open("./public/images/コメント好き.jpg"),
  },

  {
  name: "諜報員",
  introduction: "某国から某国へ",
  password: "tyouhouin",
  profile_image: File.open("./public/images/諜報員.jpg"),
  },

  {
  name: "警察官",
  introduction: "生涯現役",
  password: "keisatukan",
  profile_image: File.open("./public/images/警察官.jpg"),
  },

  {
  name: "自宅警備員",
  introduction: "在宅勤務中",
  password: "jitakukeibiin",
  profile_image: File.open("./public/images/自宅警備員.jpg"),
  },

  {
  name: "好青年",
  introduction: "好青年とよく言われます",
  password: "kouseinen",
  profile_image: File.open("./public/images/好青年.jpg"),
  },

  {
  name: "歯科助手",
  introduction: "歯科助手です",
  password: "shikajosyu",
  profile_image: File.open("./public/images/歯科助手.jpg"),
  },

  {
  name: "社長令嬢",
  introduction: "実家がお金持ち",
  password: "syatyoureijou",
  profile_image: File.open("./public/images/社長令嬢.jpg"),
  },

  {
  name: "女子高生",
  introduction: "jk2",
  password: "joshikouninen",
  profile_image: File.open("./public/images/女子高生.jpg"),
  },

  {
  name: "占い師",
  introduction: "今年大殺界突入！！",
  password: "uranaishi",
  profile_image: File.open("./public/images/占い師.jpg"),
  },

  {
  name: "正岡子規",
  introduction: "正岡子規と申します",
  password: "masaokashiki",
  profile_image: File.open("./public/images/正岡子規.jpeg"),
  },

  {
  name: "入院中",
  introduction: "骨折しました。",
  password: "nyuuintyuu",
  profile_image: File.open("./public/images/入院中.jpg"),
  }])

  User.all.each do |user|
    user.posts.create!(
    category: '質問',
    title: '初質問します。東京都排水条例について',
    body: '東京都排水条例について',
    )
  end
