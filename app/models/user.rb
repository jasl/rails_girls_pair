class User < ActiveRecord::Base
  extend OmniauthCallbacks
  
  has_many :authorizations, :dependent => :destroy

  devise :database_authenticatable, :registerable,                              
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  validates :role, :presence => true, :inclusion => %w(tutor girl)

  attr_accessible :email, :password, :password_confirmation,
                  :nickname, :realname, :gender, :bio,
                  :role, :as => [:default, :admin]

  attr_accessible :managable, :as => :admin

  scope :tutors, where(:role => 'tutor')
  scope :girls, where(:role => 'girl')

  def bind_service(response)                                                    
    provider = response["provider"]                                             
    uid = response["uid"]                                                       
    authorizations.create(:provider => provider , :uid => uid )                 
  end

  def update_without_current_password(params, *options)                         
    params.delete(:current_password)                                            
                                                                                                                                                                                     
    if params[:password].blank?                                                 
      params.delete(:password)                                                  
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end                                                                         
                                                                                
    result = update_attributes(params, *options)                                
                                                                                
    clean_up_passwords                                                          
    result                                                                      
  end

  def to_s
    @display_name ||= self.nickname.blank? ? self.email.split('@')[0] : self.nickname
  end

  # for rails admin
  def name
    "#{self.role}-#{self.to_s}"
  end

end
