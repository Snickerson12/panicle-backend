class Photo < ApplicationRecord
    belongs_to :user
    belongs_to :group
    has_one_attached :photo_file
end
