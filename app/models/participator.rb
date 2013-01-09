class Participator < ActiveRecord::Base
  belongs_to :user
  belongs_to :event, :counter_cache => :participators_count

  validates_uniqueness_of :user_id, :scope =>  :event_id
  validates :user, :event, :presence => true

  attr_accessible :invited, :applied, :attended, :as => [:default, :admin]
  attr_accessible :user_id, :event_id, :as => :admin
end
