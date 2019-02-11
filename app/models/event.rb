class Event < ApplicationRecord
	has_many :attendances
	has_many :users, through: :attendances
	belongs_to :admin, class_name: 'User'

validates :title, presence: true, length: { in: 5..140}

validates :description, presence: true, length: { in: 20..1000}

validates :price, presence: true
validates_numericality_of :price, :greater_than => 1, :less_than => 1000


validates :location, presence: true


validates :duration, presence: true
validate :duration_is_a_multiple_of_5


validates :start_date, presence: true
validate :event_cant_be_in_the_past

	def event_cant_be_in_the_past
		if start_date < Date.today 
			puts "Bah non la date n est pas valide, essaie encore"
		end
	end 


	def duration_is_a_multiple_of_5
		if duration % 5 != 0 && duration < 0
			puts "La duree de l evenement n est pas valide car cela doit etre un multiple de 5"
		end 
	end


end 
