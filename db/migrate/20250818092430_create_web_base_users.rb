class CreateWebBaseUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :web_base_users do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
