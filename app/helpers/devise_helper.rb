module DeviseHelper
  def devise_error_messages!
    return "" unless devise_error_messages?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="error_explanation">
      <div class="col s12 m4 l2">
           <div class="card-panel deep-orange darken-1">
               <div class="row">
                   <div class="col l8 white-text">
                    <p>#{sentence}</p>
                    <ul>#{messages}</ul>
                  </div>
               </div>
           </div>
      </div>
    </div>
    HTML

    html.html_safe
  end

  def devise_error_messages?
    !resource.errors.empty?
  end

end
