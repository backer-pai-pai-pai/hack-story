class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.belongs_to :project_item, index: true, foreign_key: true
      t.string :item_photo

      t.timestamps null: false
    end
  end
end
