# Handles formatting of mailing info
# Includes formatting of recipients
# Parsing recipient variables from html
class MailingSerializer
  attr_accessor :mailing

  def initialize(mailing)
    @mailing = mailing
  end

  def campaign_data
    return {} unless mailing.presence

    {
      from: mailing.from,
      html: mailing.html,
      recipient_variables:
    }
  end

  def recipient_variables
    recipient_vars = {}
    subscribers = @mailing.subscribers

    subscribers.each do |subscriber|
      recipient_vars.merge!(subscribers_info(subscriber))
    end

    recipient_vars
  end

  def subscribers_info(subscriber)
    subscriber_hash = { name: subscriber.full_name.to_s }
    subscriber_hash.merge!(html_vars)

    {
      "#{subscriber.email}": subscriber_hash
    }
  end

  def html_vars
    html = @mailing.html
    vars_with_fallback = html.scan(/{{*\s*[a-zA-Z0-9_ ]*\s*\|*\s*fallback:*\s*\'.*?\'*\s*}}/).to_a
    vars = {}
    vars_with_fallback.each do |var|
      variable_name = variable_name(var)
      fallback_value = fallback(var)

      vars.merge!({ "#{variable_name}": { fallback: fallback_value.to_s } })
    end
    vars
  end

  def variable_name(var)
    variable_name = var.match(/{{*\s*[a-zA-Z0-9_]*\s*\|/)
    variable_name.to_s.gsub(/[^a-zA-Z0-9_]/, '')
  end

  def fallback(var)
    fallback = var.match(/\'+[a-zA-Z0-9_ ]*.+\'/)
    fallback.to_s.gsub(/[^a-zA-Z0-9_]/, '')
  end
end
