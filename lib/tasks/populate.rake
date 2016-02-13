namespace :db do
  desc "Fill the database up with goodness."
  task populate: :environment do
    # make_types
    # make_tags
    if Rails.env.development?
      make_admin
    end
  end
end

def make_types
  Type.create!(name: 'Game')
  Type.create!(name: 'Deep Dive')
end

def make_tags
  Tag.create!(name: 'Grade 4')
  Tag.create!(name: 'Grade 5')
  Tag.create!(name: 'Grade 6')
  Tag.create!(name: 'Grade 7')
  Tag.create!(name: 'Grade 8')
  Tag.create!(name: 'Solve a Simpler Problem')
  Tag.create!(name: 'Extreme Cases')
  Tag.create!(name: 'Wishful Thinking')
  Tag.create!(name: 'CCSS.Math.Content.5.NF.A.1')
end

def make_admin
  user = User.create!(first_name:        'Travis',
                      last_name:         'Sperry',
                      email:             'travissperry1@gmail.com',
                      password:          'password')
  user.toggle(:admin)
  user.save!
end
