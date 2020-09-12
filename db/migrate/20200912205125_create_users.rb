class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :callsign
      t.string :password_digest
      t.string :email
      t.string :my_qth

      t.timestamps
    end
  end
end
