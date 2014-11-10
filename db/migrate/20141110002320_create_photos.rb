class CreatePhotos < ActiveRecord::Migration
  def up
    create_table :photos do |t|
        t.integer "user_id"
        t.boolean "is_checked"
      t.timestamps
    end
  end

  def down
    drop_table :photos
  end
end
