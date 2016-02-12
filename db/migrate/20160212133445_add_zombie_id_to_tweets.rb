class AddZombieIdToTweets < ActiveRecord::Migration
  def change
  	add_column :tweets, :zombie_id, :integer
  	add_index :tweets, :zombie_id
  end
end
