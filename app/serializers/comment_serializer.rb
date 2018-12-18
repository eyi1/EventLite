class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content
  
  belongs_to :event, serializer: CommentEventSerializer
  belongs_to :user, serializer: CommentUserSerializer
end
