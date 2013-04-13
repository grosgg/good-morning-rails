# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create!(
    [
        { email: 'marin.jeremy@gmail.com', password: 'sabusushi', password_confirmation: 'sabusushi' },
        { email: 'tomoko1710@gmail.com', password: 'sabusushi', password_confirmation: 'sabusushi' }
    ]
);
