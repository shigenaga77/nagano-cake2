class RenameMaikingStatusToMakingStatusInOrderDetails < ActiveRecord::Migration[6.1]
  def change
    rename_column :order_details, :maiking_status, :making_status
  end
end
