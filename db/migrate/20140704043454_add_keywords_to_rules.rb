class AddKeywordsToRules < ActiveRecord::Migration
  def change
    add_column :rules, :keywords, :string
  end
end
