# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Bookmark.destroy_all

users = User.create!(
    [
        { email: 'marin.jeremy@gmail.com', password: 'sabusushi', password_confirmation: 'sabusushi' },
        { email: 'tomoko1710@gmail.com', password: 'sabusushi', password_confirmation: 'sabusushi' }
    ]
)

Bookmark.create!(
    [
        {
            title: 'Japon 365',
            url: 'http://www.japon365.com',
            description: 'Photo blog about Japan',
            user: users.first
        },
        {
            title: 'Gaijin Japan',
            url: 'http://www.gaijinjapan.org',
            description: 'French blog about Japan',
            user: users.first
        },
        {
            title: 'GitHub',
            url: 'http://github.com',
            description: 'Online repositories',
            user: users.first
        },
        {
            title: 'Min Plume',
            url: 'http://www.min-plume.com',
            description: 'Shibuya 109 clothes brand',
            user: users.last
        },
        {
            title: 'OVNI',
            url: 'http://www.ovninavi.com',
            description: 'Japanese newspaper in France',
            user: users.last
        }
    ]
)
