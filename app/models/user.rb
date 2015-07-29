class User < ActiveRecord::Base
  has_many :user_songs
  has_many :songs, through: :user_songs
  has_secure_password

  validates :username, presence: true,
                       uniqueness: true

  enum role: %w(default admin)
end
