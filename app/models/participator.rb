class Participator < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  validates_uniqueness_of :user_id, :scope =>  :event_id
  validates :user, :event, :presence => true

  attr_accessible :attended, :as => [:default, :admin]
  attr_accessible :user_id, :event_id, :invited, :as => :admin
end
