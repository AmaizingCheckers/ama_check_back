class ChangeColumnHistory < ActiveRecord::Migration[5.0]
  def change
    change_column :histories, :timestamp, :datetime, default: -> { 'NOW()' }
  end
end
