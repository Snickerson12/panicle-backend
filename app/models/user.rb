class User < ApplicationRecord
    has_many :photos
    has_many :user_groups
    has_many :groups, through: :user_groups
    has_many :posts
    has_many :comments, through: :posts
    has_one_attached :avatar
end
