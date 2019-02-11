class User < ApplicationRecord

	has_many :attendances
	has_many :events, through: :attendances
	has_many :events, foreign_key: 'admin_id'


#  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }

# validates :user_name, presence: true, length: { minimum: 2 }
# validates :encrypted_password,  presence: true, length: { in: 1...15 }

after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end



end
