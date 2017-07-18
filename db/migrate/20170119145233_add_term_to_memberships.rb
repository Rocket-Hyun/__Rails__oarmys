class AddTermToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :term, :integer, :default => 0
  end
end
