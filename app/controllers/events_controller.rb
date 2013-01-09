require 'date'
class EventsController < ApplicationController
  load_and_authorize_resource

  def index

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  def attend
    result = @event.attend current_user

    respond_to do |format|
      format.html { redirect_to @event }
      format.json { render json: { result: result }, location: @event }
    end
  end

  def apply
    result = @event.apply current_user

    respond_to do |format|
      format.html { redirect_to @event }
      format.json { render json: { result: result }, location: @event }
    end
  end

  def pairing
    @pair_result = @event.pair

    respond_to do |format|
      format.html
      format.json { render json: @pair_result }
    end
  end

end
