class CreateVideoFile < ActiveRecord::Migration

  def up
    create_table "refinery_video_files", :force => true do |t|
      t.string   "file_name"
      t.integer  "file_size"
      t.string   "file_ext"
      t.string   "file_uid"
      t.string   "file_mime_type"
      t.integer  "video_id"
      t.datetime "created_at",     :null => false
      t.datetime "updated_at",     :null => false
      t.string   "external_url"
      t.boolean  "use_external"
    end

  end

  def down

    drop_table :refinery_videos

  end

end
