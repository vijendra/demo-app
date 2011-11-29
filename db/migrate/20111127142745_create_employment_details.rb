class CreateEmploymentDetails < ActiveRecord::Migration
  def change
    create_table :employment_details do |t|
      t.string :title
      t.string :company
      t.string :department
      t.string :job_function
      t.date :from_date
      t.date :to_date
      t.text :description
      t.integer :user_id
      
      t.timestamps
    end
  end
end
