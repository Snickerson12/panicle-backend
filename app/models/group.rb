class Group < ApplicationRecord
    has_many :user_groups
    has_many :users, through: :user_groups
    has_many :posts
    has_many :comments, through: :posts
    has_many :pending_user_groups
end
