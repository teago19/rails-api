class CreateShortUrls < ActiveRecord::Migration[7.1]
  def change
    create_table :short_urls do |t|
      t.string :origin_url
      t.string :code

      t.timestamps
    end
  end
end
