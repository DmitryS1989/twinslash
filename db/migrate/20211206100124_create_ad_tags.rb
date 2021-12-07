# frozen_string_literal: true

class CreateAdTags < ActiveRecord::Migration[6.1]
  def change
    create_table :ad_tags do |t|
      t.belongs_to :ad, null: false, foreign_key: true
      t.belongs_to :tag, null: false, foreign_key: true

      t.timestamps
    end
    add_index :ad_tags, %i[ad_id tag_id], unique: true
  end
end
