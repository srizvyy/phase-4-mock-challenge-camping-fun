class SignupSerializer < ActiveModel::Serializer
  attributes :id, :time, :camper_id, :activity_id
end
