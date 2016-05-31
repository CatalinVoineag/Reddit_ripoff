module AlertsHelper
  def self.getErrorAlertMessages(model)
    msg = ''

    if model.errors.any?
      msg = '<ul>'
      model.errors.messages.each do |message|
        message.second.each do |m|
            msg << '<li>'
            msg << corrected_first(model, message)
            msg << ' '
            msg << m 
            msg << '</li>'
        end
      end
    end
    msg << '</ul>'
    return msg.html_safe
  end


  def self.corrected_first(model, message)
    attr = message.first
    #custom_defaults = [:default_integer, :default_datetime, :default_decimal, :default_boolean, :default_string, :default_text]

   # if model.class == LocationGroup && attr == :slug
    #  'Code'

      message.first.to_s.titleize
    
  end
end
