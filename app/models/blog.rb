class Blog < ApplicationRecord
	mount_uploader :image, BlogUploader
end
