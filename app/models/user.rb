class User < ApplicationRecord
  has_secure_password

  has_many :comments
  has_many :posts

  validates :email, uniqueness: true, format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
end
