class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.references :album, index: true

      t.timestamps
    end
  end
end
