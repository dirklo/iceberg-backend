class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :company
  
  def company
    CompanySerializer.new(self.object.company)
  end
end
