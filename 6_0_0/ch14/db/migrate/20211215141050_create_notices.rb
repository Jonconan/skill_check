class CreateNotices < ActiveRecord::Migration[6.0]
  def change
    create_table :notices do |t|
      t.references :user, null: false, foreign_key: true, comment: '通知先ユーザー'
      t.string :message, null: false, comment: '通知内容'
      t.integer :levels, null: false, default: 0, comment: '通知の警告レベル'
      t.boolean :is_read, null: false, default: false, comment: '読んだか？（当課題では未使用）'

      t.timestamps
    end
  end
end
