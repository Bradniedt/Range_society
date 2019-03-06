module ApplicationHelper
  def ranges
    [5, 10, 15, 20, 25, 30, 35, 40, 45, 50]
  end

  def activities
    ["Food", "Museums", "Concerts", "Parks"]
  end

  def clean_for_popup(string)
    return string.gsub(/\s/, " ") if string.class == String
    string
  end

  def self.strip_tags(string)
    ActionController::Base.helpers.strip_tags(string)
  end
end
