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
validate :duration_is_a_multiple_of_five


validates :start_date, presence: true
validate :start_date_cannot_be_in_the_past

 # Method to prevent creating past events

  def start_date_cannot_be_in_the_past

    if start_date.present? && start_date < Date.today

      errors.add(:start_date, "L'évènement ne peut pas être créer dans le passé.")

    end

  end

  

  # Method to verify multiple of 5

  def duration_is_a_multiple_of_five

    unless duration.present? && duration % 5 == 0

      errors.add(:duration, "Doit être un multiple de 5")

    end

  end


end 
