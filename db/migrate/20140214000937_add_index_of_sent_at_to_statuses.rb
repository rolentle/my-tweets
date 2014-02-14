class AddIndexOfSentAtToStatuses < ActiveRecord::Migration
  def change
    add_index :statuses, [:sent_at]
  end
end
