class Book < ApplicationRecord
 
  belongs_to :user
  validates :title, presence: true, length: { minimum: 1 }, uniqueness: true
  validates :body, presence: true
  validates :body,length: { minimum: 1, maximum: 200 }
end


 
 