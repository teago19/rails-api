class CreateStoredUrls < ActiveRecord::Migration[7.1]
  def change
    create_table :stored_urls do |t|

      t.timestamps
    end
  end
end
