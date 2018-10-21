class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:survey_taker, :survey_admin]
  after_initialize :set_default_role, :if => :new_record?
  has_many :answers

  # Sets the default role
  def set_default_role
    self.role ||= :survey_taker
  end
end
