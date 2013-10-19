class Api::OutageController < ApplicationController

  skip_before_filter :verify_authenticity_token
  include UsersHelper

  def list
    @outages = Outage.all
    render json: @outages
  end

  def tcall

    user_inst_id = params[:inst_id]

    puts '[INFO] : transmitting new trouble call request to OMS server'

    require 'net/http'

    url = URI.parse('http://www.halilayyildiz.com:8080/fablebox/api/fable/list?inst_id=' + user_inst_id)
    req = Net::HTTP::Get.new(url.path)
    res = Net::HTTP.start(url.host, url.port) { |http|
      http.request(req)
    }

    puts '[INFO] : response from OMS server'
    puts res.body


    puts '[INFO] : complete new trouble call'
    render json: 'accepted new tcall from user ->' + user_inst_id, status: :accepted
  end

  def new
    oms_outage_id = params[:outageId]
    oms_outage_desc = params[:desc]
    oms_outage_start_date = params[:sdate]
    oms_outage_end_date = params[:edate]
    oms_outage_location = params[:location]
    oms_outage_aff_cust_count = params[:aff_cust]
    oms_outage_lat = params[:lat]
    oms_outage_long = params[:long]
    oms_affected_customers = params[:affectedCustomers].split(',')

    outage = Outage.new(outage_id:oms_outage_id, description:oms_outage_desc, start_date:oms_outage_start_date,
                        end_date:oms_outage_end_date, location:oms_outage_location, affected_customers:oms_outage_aff_cust_count,
                        lat:oms_outage_lat, long:oms_outage_long)
    outage.save

    oms_affected_customers.each { |val|
      aff_cust = AffectedCustomer.new(outage_id:oms_outage_id, inst_id:val);
      aff_cust.save
    }

    #send push notifications
    users = User.where('installation_id IN (?)', oms_affected_customers)
    users.each { |user|
      send_push_message(user.push_id)
      puts '[INFO] : notification sent to user -> ' + user.installation_id
    }

    render json: 'OK', status: :accepted
  end


end