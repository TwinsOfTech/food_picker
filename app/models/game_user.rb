class GameUser
  include DataMapper::Resource

  property :id, Serial
  property :user_id, Integer, :required => true
  property :game_id, Integer, :required => true
  property :name, String, :required => true

  belongs_to :user
  belongs_to :game

end
