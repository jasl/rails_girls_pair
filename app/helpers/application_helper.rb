module ApplicationHelper

  def print_error_messages resource
    return '' if resource.errors.empty?
    errors = resource.errors.full_messages.uniq
    messages = errors.map { |msg| content_tag(:li, msg) }.join
    if errors.count > 1
      sentence = I18n.t("errors.messages.not_saved.other",
                        :count => errors.count)
    else
      sentence = I18n.t("errors.messages.not_saved.one")
    end

    html = <<-HTML
    <div class="alert alert-error">
      <a class="close" data-dismiss="alert"><i class="icon-remove"></i></a>
      <strong>#{sentence}</strong>
      <ul>
        #{messages}
      </ul>
    </div>
    HTML

    html.html_safe
  end

  def notice_message
    flash_messages = []
    flash.each do |type, message|
      if message
        type = :success if type == :notice
        html = <<-HTML
        <div class=\"alert fade in alert-#{type}\">
          <a class="close" data-dismiss="alert"><i class="icon-remove"></i></a>
          #{message}
        </div>
        HTML
        flash_messages << html
      end
    end
    flash_messages.join("\n").html_safe
  end

  def set_title(title = "", is_root = false)
    if is_root
      title_str = title
    else
      title_str = "#{title} - "
    end

    content_for :title do
      title_str
    end
  end

  def has_specified_javascript(js = controller_path)
    content_for :js do
      javascript_include_tag js
    end
  end

  def has_specified_stylesheet(css = controller_name)
    content_for :css do
      stylesheet_link_tag css, :media => "all"
    end
  end
end
