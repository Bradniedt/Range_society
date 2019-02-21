class UserDecorator < Draper::Decorator
  decorates_association :destinations
  delegate_all
  def list_last_ten
    if last_ten_destinations.empty?
      h.content_tag(:h4, "You have no trips")
    else
      last_ten_destinations.map do |d|
        h.content_tag(:div, "Trip Name: #{d.name}", class: 'destination').html_safe
      end.join.html_safe
    end
  end

  def last_ten_destinations
    object.destinations.limit(10).order(id: :desc)
  end
end 
