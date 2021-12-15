class Notice < ApplicationRecord
  belongs_to :user

  # 初ログインを通知するメソッド
  def first_sign_in
    self.message = "初回ログインありがとうございます。"
    self.save
  end
end
