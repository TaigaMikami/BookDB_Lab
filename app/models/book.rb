class Book < ApplicationRecord
  validates :title, presence: true

  default_scope -> { order(title: :desc) }
end
