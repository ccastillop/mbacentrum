class CreateMedias < ActiveRecord::Migration
  def self.up
    create_table :medias do |t|
      t.integer :user_id
      t.string :nombre
      t.text :descripcion
      t.string :tipo
      t.string :archivo_file_name
      t.string :archivo_content_type
      t.integer :archivo_file_size
      t.datetime :archivo_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :medias
  end
end
