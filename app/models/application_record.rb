# The ApplicationRecord class is used to assigned a class as an abstract_class
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
