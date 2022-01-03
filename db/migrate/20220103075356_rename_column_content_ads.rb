class RenameColumnContentAds < ActiveRecord::Migration[6.1]
  def change
    change_table :ads do |t|
      t.rename :content, :body
    end
  end
end
