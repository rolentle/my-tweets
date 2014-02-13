class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :text
      t.references :user, index: true
      t.datetime :sent_at

      t.timestamps
    end
  end
end
