# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.destroy_all
Network.destroy_all


## USERS ##
users = [ {:first_name => 'Giorgia', :last_name => 'Willits',
           :phone_number => '7148759292', :email => 'gw@berkeley.edu',
           :password => 'gw'},
          {:first_name => 'Valeriya', :last_name => 'Imeshiva',
           :phone_number => '+14444444444', :email => 'vi@berkeley.edu',
           :password => 'vi'},
          {:first_name => 'Anne', :last_name => 'Zeng',
           :phone_number => '7147884536', :email => 'az@berkeley.edu',
           :password => 'az'},
          {:first_name => 'Pauline', :last_name => 'Duprat',
           :phone_number => '+14444444444', :email => 'pd@berkeley.edu',
           :password => 'pd'},
          {:first_name => 'Lauren', :last_name => 'Capelluto',
           :phone_number => '+15555555555', :email => 'lc@berkeley.edu',
           :password => 'lc'},
          {:first_name => 'Eric', :last_name => 'Nelson',
           :phone_number => '+11111111111', :email => 'en@berkeley.edu',
           :password => 'en'},
          {:first_name => 'Aran', :last_name => 'Bahl',
           :phone_number => '+12222222222', :email => 'ab@berkeley.edu',
           :password => 'ab'},
          {:first_name => 'Shane', :last_name => 'Barrat',
           :phone_number => '+13333333333', :email => 'sb@berkeley.edu',
           :password => 'sb'},
          {:first_name => 'Jerry', :last_name => 'Chen',
           :phone_number => '+13333333333', :email => 'jc@berkeley.edu',
           :password => 'jc'},
          {:first_name => 'Kelly', :last_name => 'Liu',
           :phone_number => '+13333333333', :email => 'kl@berkeley.edu',
           :password => 'kl'},
          {:first_name => 'James', :last_name => 'Uejo',
           :phone_number => '+13333333333', :email => 'ju@berkeley.edu',
           :password => 'ju'},
          {:first_name => 'Jordan', :last_name => 'Wing',
           :phone_number => '+13333333333', :email => 'jw@berkeley.edu',
           :password => 'jw'}
           ]

user_instances = []
users.each do |user|
    u = User.create!(user)
    u.save
    user_instances << u
end

gige = User.find_by_first_name("Giorgia")
val = User.find_by_first_name("Valeriya")
paul = User.find_by_first_name("Pauline")
anne = User.find_by_first_name("Anne")
lauren = User.find_by_first_name("Lauren")
eric = User.find_by_first_name("Eric")
aran = User.find_by_first_name("Aran")
shane = User.find_by_first_name("Shane")
jerry = User.find_by_first_name("Jerry")
kelly = User.find_by_first_name("Kelly")
james = User.find_by_first_name("James")
jordan = User.find_by_first_name("Jordan")


## NETWORKS  ##
networks = { gige => [val, paul, anne, lauren, eric, aran, shane, jerry, kelly, james, jordan],
             val => [gige, paul, anne, lauren, eric, aran, shane],
             paul => [val, gige, anne, lauren, eric, aran, shane],
             anne => [val, gige, paul, lauren, eric, aran, shane],
             lauren => [val, gige, paul, anne, eric, aran, shane],
             eric => [val, gige, paul, anne, lauren, aran, shane, jerry, kelly, james, jordan],
             aran => [val, gige, paul, anne, eric, lauren, shane],
             shane => [val, gige, paul, anne, eric, lauren, aran],
             jerry => [gige, kelly, james, jordan, eric],
             kelly => [gige, jerry, james, jordan, eric],
             james => [gige, kelly, jerry, jordan, eric],
             jordan => [gige, kelly, james, jerry, eric] }



network_instances = []
networks.each do |user, friends|
    n =  Network.create!(:user => user)
    friends.each do |friend|
        n.users << friend
    end
    n.save
    network_instances << n
end



## GROUPS ##
groups = { :GDI => [gige, val, paul, anne, lauren],
             :ATO => [eric, aran, shane, gige],
             :CSTA => [jerry, kelly, james, jordan] }
             
group_instances = []
groups.each do |groupname, friends|
    g = Group.create!(:name => groupname)
    friends.each do |friend|
        g.users << friend
    end
    g.save
    group_instances << g
end             


## POSTS  ##
posts = { {:description => "LETS DRIIINNKKKK", :user => gige} => [ato, gdi],
          {:description => "Who's gonna be home at 8pm?", :user => val} => [gdi],
          {:description => "Anyone want to grab lunch tomorrow?", :user => paul} => [ato, gdi],
          {:description => "Come see my cats", :user => gige} => [ato, gdi],
          {:description => "I have a dinner", :user => anne} => [ato, gdi],
          {:description => "Beer die tomorrow", :user => aran} => [ato]}

post_instances = []
posts.each do |post_hash, groups|
    new_post =  Post.create!(post_hash)
    groups.each do |group|
        new_post.groups << group
    end
    new_post.save
    post_instances << new_post
end


## EVENTS  ##
events = {
 
}
