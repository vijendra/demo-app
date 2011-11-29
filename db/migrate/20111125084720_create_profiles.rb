class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.text :biography
      t.string :public_profile_url
      t.integer :user_id
      
      t.timestamps
    end
  end
end
