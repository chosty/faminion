class GcmNotificator

  def self.push_fav(user, current_user)
    unless user.device_code.blank?
      destination = user.device_code
      data = { message: "#{current_user}さんがいいね！しました" }
      GCM.send_notification( destination, data )
    end
  end

  def self.push_reply(user, current_user)
    unless user.device_code.blank?
      destination = user.device_code
      data = { message: "#{current_user}さんがコメントしました" }
      GCM.send_notification( destination, data )
    end
  end

  def self.push_post(current_user)
    @users = current_user.family_users
    destination = [ ]
    @users.each do | user |
      unless user.device_code.blank?
        destination.add(user.device_code)
      end
    end
    if destination
      data = { message: "#{current_user}さんが投稿しました" }
      GCM.send_notification( destination, data )
    end
  end

end
