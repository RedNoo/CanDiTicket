class SlaPlan < ActiveRecord::Base
  validates :title, presence: true
  validates :responsetime, presence: true
end
