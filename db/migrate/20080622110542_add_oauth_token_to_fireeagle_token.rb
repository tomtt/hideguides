class AddOauthTokenToFireeagleToken < ActiveRecord::Migration
  def self.up
    add_column(:fireeagle_tokens, :oauth_token, :string)
  end

  def self.down
    remove_column(:fireeagle_tokens, :oauth_token)
  end
end
