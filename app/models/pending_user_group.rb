class PendingUserGroup < ApplicationRecord
    belongs_to :user
    belongs_to :group
end
