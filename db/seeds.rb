f1 = Family.create(name: "大橋")
f1.create_family_code
f2 = Family.create(name: "坂尾")
f2.create_family_code

u1 = User.create(family_id: f1.id,  name: "大橋亮太", birthday: "1992-02-7", gender: 1, role: 3, email: "test1@test.com", password: "1234")
u2 = User.create(family_id: f1.id,  name: "大橋啓子", birthday: "1970-02-03", gender: 2, role: 2, email: "test2@test.com", password: "1234")
u3 = User.create(family_id: f2.id,  name: "たくまさ", birthday: "1991/07/27", gender: 1, role: 3, email: "test3@test.com", password: "1234")
u4 = User.create(family_id: f2.id,  name: "きみこ", birthday: "1970-05-27", gender: 1, role: 3, email: "test4@test.com", password: "1234")
u5 = User.create(family_id: f2.id,  name: "けんゆう", birthday: "1995-05/16", gender: 1, role: 3, email: "test5@test.com", password: "1234")

e1 = Event.create(family_id: f1.id, scheduled_at: u1.birthday, name: "亮太の誕生日")
e2 = Event.create(family_id: f2.id, scheduled_at: u3.birthday, name: "たくまさの誕生日")
e3 = Event.create(family_id: f2.id, scheduled_at: u4.birthday, name: "きみこの誕生日")
e4 = Event.create(family_id: f2.id, scheduled_at: u5.birthday, name: "けんゆうの誕生日")
EventTargetUser.create(event_id: e1.id, user_id: u1.id)
EventTargetUser.create(event_id: e2.id, user_id: u3.id)
EventTargetUser.create(event_id: e3.id, user_id: u4.id)
EventTargetUser.create(event_id: e4.id, user_id: u5.id)

p1 = Post.create(family_id: f2.id, user_id: u5.id, reply_post_id: nil, post_favs_count: 0, content: "九州新幹線快適すぎwwww")
p2 = Post.create(family_id: f2.id, user_id: u4.id, reply_post_id: nil, post_favs_count: 0, content: "久しぶりに博多でラーメン食べてきました！やっぱりラーメンは博多ばい！")
p3 = Post.create(family_id: f2.id, user_id: u3.id, reply_post_id: p2.id, post_favs_count: 0, content: "福岡のラーメン恋しい...つらい...")
p4 = Post.create(family_id: f2.id, user_id: u5.id, reply_post_id: nil, post_favs_count: 0, content: "アイアムアヒーローめっちゃおもしろかった")
p5 = Post.create(family_id: f2.id, user_id: u4.id, reply_post_id: nil, post_favs_count: 0, content: "GW、デパ地下の北海道物産展行ってきました！今夜はカニですよ〜")
p6 = Post.create(family_id: f2.id, user_id: u5.id, reply_post_id: p5.id, post_favs_count: 0, content: "季節外れすぎる...")

pf1 = PostFav.create(post_id: p1.id, user_id: u1.id)
pf2 = PostFav.create(post_id: p3.id, user_id: u3.id)
