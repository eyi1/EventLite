class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :event_id
end
