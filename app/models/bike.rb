class Bike < ActiveRecord::Base

    belongs_to :user
    has_many :components
    accepts_nested_attributes_for :components

    validates_presence_of :model
    validate :check_components

    def check_components
      if components[0].category == "" || components[0].model == "" || components[1].category == "" || components[1].model == "" 
        return errors.add :base, "Must Include 2 Componenets"
      end
    end

end
