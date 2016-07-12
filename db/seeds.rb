# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

new_user = User.new(first_name: "coco", last_name: "robicheau", email: "cocor@gmail.com", photog: false)
new_user.save

new_user = User.new(first_name: "chase", last_name: "jarvis", email: "chase@jarvis.com", photog: true)
new_user.save

new_user = User.new(first_name: "davis", last_name: "duchemin", email: "duchemin@lightpixel.com", photog: true)
new_user.save

new_user = User.new(first_name: "JB", last_name: "sebrier", email: "tarteauxfraises@gmail.com", photog: false)
new_user.save
