class SMS
  def initialize(to_phone_number)
    @to_phone_number = to_phone_number
  end

  def client
    Twilio::REST::Client.new ENV['twilio_account_sid'], ENV['twilio_token']
  end

  def send(body)
    client.account.messages.create(
      :messaging_service_sid => ENV['twilio_messaging_service_sid'],
      :to => @to_phone_number,
      :body => body
    )
  end
end