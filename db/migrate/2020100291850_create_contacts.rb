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
      t.string :freq_rcvd, :default => '-'
      t.string :mode
      t.string :submode, :default => '-'
      t.string :modegroup, :default => '-'
      t.date :qso_date
      t.time :time_on
      t.boolean :qsl_rcvd, :default => false
      t.date :qsl_rdate, :default => '-'
      t.string :dxcc, :default => '-'
      t.string :country
      t.string :iota, :default => '-'
      t.string :gridsquare
      t.string :state, :default => '-'
      t.string :cnty, :default => '-'
      t.string :cqz, :default => '-'
      t.string :ituz, :default => '-'
      t.string :park, :default => '-'

      t.timestamps
    end
  end
end
