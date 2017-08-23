class Category < ApplicationRecord
  has_many :post, dependent: :nullify
end
