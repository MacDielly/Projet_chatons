class User < ApplicationRecord
  has_many :orders
  has_many :items, through: :order

  after_create :welcome_send

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def welcome_send
   UserMailer.welcome_email(self).deliver_now
  end
  
end