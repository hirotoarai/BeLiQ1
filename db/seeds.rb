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
  name: "アシンメトリー",
  introduction: "新社会人です。",
  password: "ashinmetori",
  profile_image: File.open("./app/assets/images/アシンメトリー.jpg"),
  },

  {
  name: "インド人です",
  introduction: "インド出身２６歳。",
  password: "indojindes",
  profile_image: File.open("./app/assets/images/インドの富豪.jpg"),
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
  profile_image: File.open("./app/assets/images/スパイ.jpg"),
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
  profile_image: File.open("./app/assets/images/警備員.jpg"),
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