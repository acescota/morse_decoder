class CreateMorseCodes < ActiveRecord::Migration
  def change
    create_table :morse_codes do |t|
      t.string :code
      t.string :translation

      t.timestamps
    end
  end
end
