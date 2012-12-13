class User < ActiveRecord::Base
  extend OmniauthCallbacks
  
  has_many :authorizations, :dependent => :destroy
  


  devise :database_authenticatable, :registerable,                              
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable


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
end