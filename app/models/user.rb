class User < ApplicationRecord
    has_many :photos
    has_many :user_groups
    has_many :groups, through: :user_groups
    has_many :posts
    has_many :comments, through: :posts
    has_one_attached :avatar
    has_secure_password
    validates :username, presence: true, uniqueness: :true

    def to_param
        name
    end
end
