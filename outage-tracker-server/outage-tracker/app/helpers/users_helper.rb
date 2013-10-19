module UsersHelper

  def send_push_message(device_token)

    APNS.host = 'gateway.push.apple.com'
    APNS.pem = 'app/assets/outagetracker_apns_production.pem'
    APNS.pass = '1insan'

    APNS.send_notification(device_token, alert: 'Elektriginiz kesildi', badge: 1, sound: 'default')

  end

  def send_push_message_dev(device_token)

    APNS.host = 'gateway.sandbox.push.apple.com'
    APNS.pem = 'app/assets/outagetracker_apns_development.pem'
    APNS.pass = '1insan'

    APNS.send_notification(device_token, alert: 'Elektriginiz kesildi', badge: 1, sound: 'default')

  end

end
