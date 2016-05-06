f1 = Family.create(name: "大橋")
f2 = Family.create(name: "坂尾")

u1 = User.create(family_id: f1.id,  name: "大橋亮太", birthday: "1992/02/17", gender: 1, role: 3, email: "test1@test.com", password: "1234")
u2 = User.create(family_id: f1.id,  name: "大橋啓子", birthday: "1970/02/03", gender: 2, role: 2, email: "test2@test.com", password: "1234")
u3 = User.create(family_id: f2.id,  name: "坂尾拓優", birthday: "1991/07/27", gender: 1, role: 3, email: "test3@test.com", password: "1234")

e1 = Event.create(family_id: f1.id, scheduled_at: u1.birthday, name: "亮太の誕生日")
e2 = Event.create(family_id: f2.id, scheduled_at: u3.birthday, name: "拓優の誕生日")
EventTargetUser.create(event_id: e1.id, user_id: u1.id)
EventTargetUser.create(event_id: e2.id, user_id: u3.id)

p1 = Post.create(family_id: f1.id, user_id: u2.id, reply_post_id: nil, post_favs_count: 0, content: "誕生日プレゼントもらったー")
p2 = Post.create(family_id: f1.id, user_id: u1.id, reply_post_id: p1.id, post_favs_count: 0, content: "いい話")
p3 = Post.create(family_id: f2.id, user_id: u3.id, reply_post_id: nil, post_favs_count: 0, content: "ライブよかった")

pf1 = PostFav.create(post_id: p1.id, user_id: u1.id)
pf2 = PostFav.create(post_id: p3.id, user_id: u3.id)
