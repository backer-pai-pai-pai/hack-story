class ProjectItem < ActiveRecord::Base
  belongs_to :project
  has_many :images
end
