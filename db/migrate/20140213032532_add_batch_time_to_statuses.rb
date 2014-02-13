class AddBatchTimeToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :batch_time, :datetime
  end
end
