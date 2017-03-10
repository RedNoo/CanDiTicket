class Department < ActiveRecord::Base
  validates :title, presence: true
end
