class Api::NotificationController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def new

    APNS.host = 'gateway.sandbox.push.apple.com'
    APNS.pem  = 'app/assets/apns.pem'
    APNS.pass = '1insan'
    device_token = '<ccdf3714 c70b5b88 94725552 1dd23494 e111b4b1 5c094136 479133bb 6e1614aa>'

    #APNS.send_notification(device_token, 'Kesinti var yeeenn!')
    APNS.send_notification(device_token, alert:'Anaammm... Elektrik gitti !!!', badge:1, sound:'default')

  end

  def message
    # user = User.find_by 'id = ?', params[:id]
    user = User.find(params[:id])

    APNS.host = 'gateway.sandbox.push.apple.com'
    APNS.pem  = 'app/assets/apns.pem'
    APNS.pass = '1insan'
    device_token = user.push_id

    #APNS.send_notification(device_token, 'Kesinti var yeeenn!')
    APNS.send_notification(device_token, alert:'Anaammm... Elektrik gitti !!!', badge:1, sound:'default')

    render json:user
  end

end