class CreateFireeagleTokens < ActiveRecord::Migration
  def self.up
    create_table :fireeagle_tokens do |t|
      t.string :token
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :fireeagle_tokens
  end
end
