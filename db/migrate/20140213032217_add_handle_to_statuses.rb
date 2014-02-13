class AddHandleToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :handle, :string
  end
end
