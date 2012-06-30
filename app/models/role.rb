class Role < ActiveRecord::Base
  attr_accessible :role, :user
  belongs_to :user
end
