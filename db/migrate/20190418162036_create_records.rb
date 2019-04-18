class CreateRecords < ActiveRecord::Migration[5.2]
  def change

  	create_table :records do |t|
      t.text :name
      t.text :phone
      t.text :datestamp
      t.text :barber

        t.timestamps
    end
  end
end
