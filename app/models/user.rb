class User < ApplicationRecord
  validates :access_token, presence: true
end
