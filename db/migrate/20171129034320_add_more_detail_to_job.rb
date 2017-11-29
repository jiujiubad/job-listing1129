class AddMoreDetailToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :wage_upper, :integer
    add_column :jobs, :wage_lower, :integer
    add_column :jobs, :contact, :string
    add_column :jobs, :is_hidden, :boolean, default: false
  end
end
