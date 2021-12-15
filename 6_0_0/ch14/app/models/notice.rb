class Notice < ApplicationRecord
  belongs_to :user

  # 初ログインを通知するメソッド
  def first_sign_in
    self.message = "初回ログインありがとうございます。"
    self.save
  end

  # フォローされたことを通知するメソッド
  def new_follower_notices(user_name: nil)
    self.message = "#{user_name}さんにフォローされました"
    self.save
  end

  # フォローされたことを通知するメソッド　但し複数人からフォローされた際の更新用メソッド
  def update_message_follower_notice(newest_followers: nil)
    # この区間で最初にフォローしてくれた人の名前
    user_name = newest_followers.order(created_at: :asc).first.name
    # 他○名なので、直近のフォロワー数から -1 する
    followers_count = newest_followers.count - 1

    self.message = "#{user_name}さん他#{followers_count}名にフォローされました"
    self.save
  end
end
