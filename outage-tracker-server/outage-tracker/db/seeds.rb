# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  # ruby encoding: utf-8
  Outage.create([{outage_id:"11", description:"Eryaman Dagitim Trafosu Ariza", location:"Ankara, Etimesgut", start_date:"2013-08-10 09:00:00",
                  end_date:"2013-08-10 13:00:00", address:"Ankara, Dikmen", affected_customers:3400, lat:39.9718, long:32.6486},
                 {outage_id:"12", description:"Batikent Trafo Arizasi", location:"Ankara, Yenimahalle", start_date:"2013-08-11 02:20:00",
                  end_date:"2013-08-11 09:10:00", address:"Ankara, Batikent", affected_customers:5600, lat:39.9881, long:32.7081}
                ])

