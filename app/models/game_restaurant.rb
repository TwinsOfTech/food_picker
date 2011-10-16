class GameRestaurant
  include DataMapper::Resource

  property :id, Serial
  property :game_id, Integer, :required => true
  property :name, String, :length => 255, :required => true

  belongs_to :game
  #has n, :game_restaurant_votes

end
