class AddJtiToRecruiters < ActiveRecord::Migration[6.0]
  def change
    add_column :recruiters, :jti, :string, null: false
    add_index :recruiters, :jti, unique: true
  end
end
