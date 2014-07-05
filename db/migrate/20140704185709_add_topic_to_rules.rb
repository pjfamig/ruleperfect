class AddTopicToRules < ActiveRecord::Migration
  def change
    add_column :rules, :topic, :string
  end
end
