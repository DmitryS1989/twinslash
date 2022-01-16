# frozen_string_literal: true

# class
class DropTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :admin_users
    drop_table :active_admin_comments
  end
end
