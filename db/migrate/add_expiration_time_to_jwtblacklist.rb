class AddExpirationTimeToJWTBlacklist < ActiveRecord::Migration
  def change
    add_column :jwt_blacklist, :exp, :datetime, null: false
  end
end