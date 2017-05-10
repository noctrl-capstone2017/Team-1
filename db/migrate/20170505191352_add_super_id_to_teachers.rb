class AddSuperIdToTeachers < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :super_id, :integer, default: 0
  end
end
