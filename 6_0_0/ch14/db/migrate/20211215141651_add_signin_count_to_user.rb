class AddSigninCountToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :sign_in_count, :integer, default: 0, comment: 'ログインした回数'
  end
end
