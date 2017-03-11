class Priority < ActiveRecord::Base
  validates :title, presence: true
end
