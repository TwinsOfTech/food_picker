class Game
  include DataMapper::Resource

  property :id, Serial
  property :address, String, :length => 255, :required => true
  property :state, String, :required => true
  property :zip, Integer, :required => true
  property :finished, Boolean, :default => false

  has n, :game_users
  has n, :game_restaurants
  #has n, :users, :through => :game_users

end
