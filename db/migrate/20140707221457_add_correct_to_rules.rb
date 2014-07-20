class AddCorrectToRules < ActiveRecord::Migration
  def change
    add_column :rules, :correct, :boolean, default: false
  end
end
