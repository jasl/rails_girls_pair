module EventsHelper
  def able_to_apply?(event)
    event.date > Date.today and can? :apply, event and not event.applied?(current_user)
  end

  def able_to_attend?(event)
    event.date == Date.today and can? :attend, event and not event.attended?(current_user)
  end
end
