class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
         
  before_save { self.email = email.downcase }
  after_initialize { self.role ||= :standard }
         
  has_many :wikis
  
  enum role: [:standard, :admin, :premium]
  
  
end
