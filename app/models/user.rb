class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader

  has_many :reservations, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable, :async, :recoverable

  validates :username, :presence => true, :uniqueness => true
  validates :key, :presence => true, acceptance: { accept: Figaro.env.secret_registration_key }
  validates_presence_of   :avatar
  validates_integrity_of  :avatar
  validates_processing_of :avatar


  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

end
