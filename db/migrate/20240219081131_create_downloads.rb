class CreateDownloads < ActiveRecord::Migration[7.2]
  def change
    create_table :downloads do |t|
      t.references :song, null: false, foreign_key: true
    end
  end
end
