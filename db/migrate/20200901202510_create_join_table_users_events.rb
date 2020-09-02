class CreateJoinTableUsersEvents < ActiveRecord::Migration[6.0]
  def change
    create_join_table :events, :users do |t|
    end
  end
end
