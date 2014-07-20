class AddCorrectToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :correct, :boolean, default: false
    add_column :posts, :default, :false
  end
end
