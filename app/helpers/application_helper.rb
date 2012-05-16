module ApplicationHelper
	def full_title(page_title)
    base_title = site_title
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def site_title
  	title = "Skate Spots"
  end
end
