require 'date'
class HomeController < ApplicationController
  def index
    @event = Event.last
    @attended = user_signed_in? ? @event.participators.
        where(:user_id => current_user.id, :attended => true).exists? : false
  end
end
