class ActionView::Helpers::FormBuilder
  def error_message_for(field_name)
    current_object = self.object

    if current_object.errors[field_name].present?
      class_name = 'field_with_errors'
      "<div class=\"#{class_name}\">"\
      "#{current_object.errors[field_name].join("<br/>")}"\
      "</div>".html_safe
    end
  rescue
    nil
  end
end
