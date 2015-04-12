namespace :db do
  desc "Fill the database up with goodness."
  task populate: :environment do
    make_types
    make_tags
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