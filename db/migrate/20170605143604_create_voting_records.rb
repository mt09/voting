class CreateVotingRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :voting_records do |t|
      t.references :candidate, foreign_key: true
      t.string :ip_address

      t.timestamps null: false
    end
  end
end
