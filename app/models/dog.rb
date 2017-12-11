class Dog < ApplicationRecord
	belongs_to :user
	has_many :recipes 

	mount_uploader :avatar, AvatarUploader
end
