# frozen_string_literal: true

class AddStateToAds < ActiveRecord::Migration[6.1]
  def change
    add_column :ads, :state, :integer, default: 0, null: false
    add_index :ads, :state
  end
end
