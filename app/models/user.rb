class User < ApplicationRecord
  has_secure_password
  has_many :post,  dependent: :nullify
  has_many :comment, dependent: :nullify
end
