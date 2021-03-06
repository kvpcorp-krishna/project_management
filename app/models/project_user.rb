class ProjectUser < ActiveRecord::Base

	belongs_to :project
	belongs_to :user

	validates_uniqueness_of :id, :scope => [:user_id, :project_id]
end

