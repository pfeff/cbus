class CreateGoogleAccounts < ActiveRecord::Migration
  def change
    create_table :google_accounts do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :name
      t.string :email
      t.string :nickname
      t.string :first_name
      t.string :last_name
      t.string :location
      t.string :image

      t.timestamps null: false
    end
  end
end
