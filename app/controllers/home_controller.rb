require 'date'
class HomeController < ApplicationController
  helper EventsHelper

  def index
    @event = Event.last
  end

  def about

  end
end
