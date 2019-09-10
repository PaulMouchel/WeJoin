module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
      <strong>
       #{pluralize(resource.errors.count, "error")} must be fixed
      </strong>
      #{messages}
      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">×</span>
    </button>
    </div>
    HTML

    html.html_safe
  end
end
