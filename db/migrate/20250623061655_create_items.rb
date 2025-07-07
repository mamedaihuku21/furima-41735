class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string  :title,            null: false
      t.text    :explanation ,     null: false
      t.integer :category_id,      null: false
      t.integer :status_id,        null: false
      t.integer :shipping_cost_id, null:false
      t.integer :prefecture_id,    null: false
      t.integer :handing_time_id,  null: false
      t.integer :price,            null: false
      t.references :user,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
