class Article < ActiveRecord::Base
  attr_accessible :body, :title, :as => [:default, :admin]
end
