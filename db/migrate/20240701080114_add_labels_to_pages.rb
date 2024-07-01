class AddLabelsToPages < ActiveRecord::Migration[8.0]
  def change
    add_column :pages, :labels, :text, array: true, default: []
  end
end
