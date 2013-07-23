# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Bookmark.destroy_all
Stickyboard.destroy_all
Velibstation.destroy_all
Newsstream.destroy_all

users = User.create!(
    [
        {
            email: 'demo@sabu.fr',
            password: 'password',
            password_confirmation: 'password',
            country: 'Australia',
            town: 'Kununurra'
        }
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
            title: 'Le Monde',
            url: 'http://www.lemonde.fr',
            description: 'French newspaper',
            user: users.first
        },
        {
            title: 'GitHub',
            url: 'http://github.com',
            description: 'Online repositories',
            user: users.first
        },
        {
            title: 'Sabu Portfolio',
            url: 'http://sabu.fr',
            description: 'Jeremy Marin portfolio',
            user: users.first
        },
        {
            title: 'OVNI',
            url: 'http://www.ovninavi.com',
            description: 'Japanese newspaper in France',
            user: users.first
        }
    ]
)

Stickyboard.create!({content:'Your new stickyboard'})

Velibstation.create!(
    [
        {
            title: 'Rue Rossel',
            velib_station_id: 42704,
            user: users.first
        },
        {
            title: 'Boulevard Arago',
            velib_station_id: 13002,
            user: users.first
        },
        {
            title: 'Rue Chevaleret',
            velib_station_id: 13053,
            user: users.first
        }
    ]
)

Newsstream.create!(
    [
        {
            title: 'Le Monde',
            url: 'http://rss.lemonde.fr/c/205/f/3050/index.rss',
            user: users.first
        },
        {
            title: 'TechCrunch',
            url: 'http://feeds.feedburner.com/TechCrunch/startups',
            user: users.first
        }
    ]
)