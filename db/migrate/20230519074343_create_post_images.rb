class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|
      #t.integer :id はしない。idは『デフォルト』である。
      t.text :caption
      t.string :shop_name
      t.integer :user_id
      t.timestamps
    end
  end
end
