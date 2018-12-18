class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :location, :starts, :ends, :description
  
  has_many :users
  has_many :comments
end