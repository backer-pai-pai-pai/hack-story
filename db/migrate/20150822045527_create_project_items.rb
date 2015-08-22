class CreateProjectItems < ActiveRecord::Migration
  def change
    create_table :project_items do |t|
      t.belongs_to :project, index: true, foreign_key: true
      t.integer :position
      t.text :excerpt
      t.datetime :occurred_at

      t.timestamps null: false
    end
  end
end
