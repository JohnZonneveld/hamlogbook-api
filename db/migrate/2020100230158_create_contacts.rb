class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.string :owncall
      t.string :station_callsign
      t.string :my_gridsquare
      t.string :call
      t.string :band
      t.string :freq
      t.string :freq_rcvd
      t.string :mode
      t.string :submode
      t.string :modegroup
      t.date :qso_date
      t.time :time_on
      t.boolean :qsl_rcvd
      t.date :qsl_rdate
      t.string :dxcc
      t.string :country 
      t.string :iota
      t.string :gridsquare
      t.string :state
      t.string :cnty
      t.string :cqz
      t.string :ituz
      t.string :park

      t.timestamps
    end
  end
end
