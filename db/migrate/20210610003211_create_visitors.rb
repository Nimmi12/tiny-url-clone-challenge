class CreateVisitors < ActiveRecord::Migration[6.0]
  def change
    create_table :visitors do |t|
      t.references :shortened_url, null: false, foreign_key: true
      t.string :ip_address
      t.integer :no_of_visits

      t.timestamps
    end
  end
end
