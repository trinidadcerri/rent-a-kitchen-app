class AddUserToKitchens < ActiveRecord::Migration[7.0]
  def change
    add_reference :kitchens, :user, index: true
  end
end
