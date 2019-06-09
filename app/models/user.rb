class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
    has_many :events, dependent: :destroy    
    has_many :attendances
    has_many :events, through: :attendances, dependent: :destroy
    after_create :welcome_send
    has_one_attached :avatar

    def welcome_send
      UserMailer.welcome_email(self).deliver_now
    end  

end
