class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :rut
      t.string :name
      t.string :last_name
      t.string :age
      t.string :course

      t.timestamps
    end
  end
end
