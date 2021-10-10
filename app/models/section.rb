class Section < ApplicationRecord
  belongs_to :course
  has_many :lessons, :dependent => :destroy
end
