class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      # t.に続くのがカラムの型、その右側にシンボルで記載されるものがカラム名
      # 長文のcontentカラムを追加
      t.text :content
      # 真か偽か判別するbooleanで既読したかのcheckedカラム追加
      t.boolean :checked
      # 投稿日時（デフォルト)
      t.timestamps
    end
  end
end
