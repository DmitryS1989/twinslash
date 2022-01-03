# frozen_string_literal: true

class RenameColumnBodyAds < ActiveRecord::Migration[6.1]
  def change
    change_table :ads do |t|
      t.rename :body, :body_ad
    end
  end
end
