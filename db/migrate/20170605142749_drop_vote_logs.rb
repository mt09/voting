class DropVoteLogs < ActiveRecord::Migration[5.0]
  def change
    drop_table :vote_logs
  end
end
