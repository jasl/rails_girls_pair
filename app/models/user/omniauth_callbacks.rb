# encoding: utf-8                                                                 
class User                                                                      
  module OmniauthCallbacks                                                      
    ["github","google_oauth2","twitter","facebook"].each do |provider|          
      define_method "find_or_create_for_#{provider}" do |response|              
        uid = response["uid"]                                                   
        data = response["info"]                                                 
                                                                                
        if user = Authorization.where("provider" => provider , "uid" => uid).first.try(:user)
          user                                                                  
        elsif user = User.find_by_email(data["email"])                          
          user.authorizations << Authorization.new(:provider => provider, :uid => uid )
          user                                                                  
        else                                                                    
          user = User.new(email: data["email"], username: data['nickname'] || data['name'])
                                                                                                                                                                                     
          if user.save(:validate => false)                                      
            user.authorizations << Authorization.new(:provider => provider, :uid => uid )
            return user                                                         
          else                                                                  
            Rails.logger.warn("User.create_from_hash 失败，#{user.errors.inspect}")
            return nil                                                          
          end                                                                   
        end                                                                     
      end                                                                       
    end                                                                         
  end                                                                           
end