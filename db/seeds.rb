20.times do |n|
  user = User.new(name: "test#{n}", email: "test#{n}@example.com", password: "password")
  user.skip_confirmation!
  user.save!
  20.times do |m|
    #ランダムな数字を出す
    num = rand(1000..100000)
    # 100で割ったあまりを出す
    num2 = num % 100
    # ランダムな数字から余を引くと、10以下を切り捨てる数字ができる
    price = num - num2
    Item.create!(
      name: "アイテム#{m}",
      price: price,
      user_id: user.id
    )
  end
end


