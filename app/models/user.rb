class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  has n, :game_users
  #has n, :games, :through => :game_users

end
