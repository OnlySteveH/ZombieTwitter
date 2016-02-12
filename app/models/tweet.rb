class Tweet < ActiveRecord::Base
	belongs_to :zombie
	validates :status, presence: true
end
