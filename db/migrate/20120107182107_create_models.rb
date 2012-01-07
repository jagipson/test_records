class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :name
      t.string :description
      t.string :url
      t.text :notes

      t.timestamps
    end
  end
end
