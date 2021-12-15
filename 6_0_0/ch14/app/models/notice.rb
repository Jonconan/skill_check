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
end
