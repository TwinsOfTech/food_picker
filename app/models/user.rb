class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String, :required => true

  has n, :game_users
  #has n, :games, :through => :game_users

end
