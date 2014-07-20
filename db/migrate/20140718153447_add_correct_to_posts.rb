class AddCorrectToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :correct, :boolean, default: false
  end
end
