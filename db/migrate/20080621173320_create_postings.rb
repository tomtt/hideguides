class CreatePostings < ActiveRecord::Migration
  def self.up
    create_table :postings do |t|
      t.string :title
      t.text :body
      t.boolean :posted_from_poi
      t.integer :location_posted_from
      t.references :wall
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :postings
  end
end
