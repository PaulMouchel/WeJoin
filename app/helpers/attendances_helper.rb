module AttendancesHelper
  def events_ajax_previous_link
  	puts"%"*100
  	puts params
    ->(param, date_range) { link_to raw("&laquo;"), {param => date_range.first - 1.day}, remote: :true}
  end

  def events_ajax_next_link
  	puts"t"*100
  	puts params
    ->(param, date_range) { link_to raw("&raquo;"), {param => date_range.last + 1.day}, remote: :true}
  end
end