class AttendanceSerializer < ActiveModel::Serializer
    attributes :id
    
    belongs_to :user, serializer: AttendanceUserSerializer
    #belongs_to :event, serializer: AttendanceEventSerializer
end