class AddUpvoteToChirps < ActiveRecord::Migration[6.0]
  def change
    add_column :chirps, :upvote, :integer, default: 0
  end
end
