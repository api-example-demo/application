class PersonSerializer < ActiveModel::Serializer
  attributes :id, :rut, :name, :last_name, :age, :course
end
