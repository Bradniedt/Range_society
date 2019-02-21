class UserDecorator < Draper::Decorator
  decorates_association :destinations
  delegate_all
  def list_last_ten
    if last_ten_destinations.empty?
      h.content_tag(:h4, "You have no trips")
    else
      h.content_tag(:ul, last_ten_destinations.each do |d|
        h.content_tag(:li, d.name)
      end)
    end
  end
  def last_ten_destinations
    object.destinations.limit(10).order(id: :asc)
  end
end
