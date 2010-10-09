class CreateComentarios < ActiveRecord::Migration
  def self.up
    create_table :comentarios do |t|
      t.string :texto
      t.integer :user_id
      t.string :comentable_type
      t.integer :comentable_id

      t.timestamps
    end
  end

  def self.down
    drop_table :comentarios
  end
end
