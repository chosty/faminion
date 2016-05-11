class GcmNotificator

  def self.push_fav(user)
    destination = user.device_code
    data = { message: "#{current_user}さんがいいね！しました" }
    GCM.send_notification( destination, data )
  end

  def self.push_reply(user)
    destination = user.device_code
    data = { message: "#{current_user}さんがコメントしました" }
    GCM.send_notification( destination, data )
  end

  def self.push_post
    @users = current_user.family_users.array.delete(current_user)
    destination = [ ]
    @users.each do | user |
      destination.add(user.device_code)
    end
    data = { message: "#{current_user}さんが投稿しました" }
    GCM.send_notification( destination, data )
  end

end
