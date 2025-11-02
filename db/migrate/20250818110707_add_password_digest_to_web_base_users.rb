class AddPasswordDigestToWebBaseUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :web_base_users, :password_digest, :string
  end
end
