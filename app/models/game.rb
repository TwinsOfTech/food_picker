class Game
  include DataMapper::Resource

  property :id, Serial
  property :address, String, :length => 255
  property :zip, Integer

  has n, :game_users
  #has n, :users, :through => :game_users

end
