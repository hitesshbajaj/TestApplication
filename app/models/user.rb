class User < ApplicationRecord
  after_create :set_secret_code, unless: :is_admin?
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :secret_code

  validates_presence_of :first_name


  def set_secret_code
    if self.secret_code.present?
  	    self.secret_code.update_columns(is_used:true)
    else
        @code = SecretCode.create(code:"foobar",is_used:true)
        self.update_columns(secret_code_id: @code.id)
    end
  end

  def is_admin?
  	self.is_admin == true
  end
end


