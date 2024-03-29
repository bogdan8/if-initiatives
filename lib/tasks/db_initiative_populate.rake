# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

namespace :db do
  task populate: :environment do
    10.times do
      User.new.tap do |u|
        u.name = Faker::HarryPotter.character
        u.email = Faker::Internet.email
        u.password = '123456'
        u.phone = '0991351355'
        u.age = rand(10..100)
        u.avatar = File.open(Rails.root + 'spec/support/photo.jpg')
        u.save!
        u.confirm
      end
      print '.'
    end

    5.times do |t|
      Category.new.tap do |c|
        c.title = Faker::Artist.name
        c.position = t
        c.save
      end
      print '.'
    end

    50.times do
      Initiative.new.tap do |i|
        i.user_id = rand(1..3)
        i.title = Faker::Lorem.sentence(10)
        i.short_description = Faker::Lorem.sentence(20)
        i.long_description = Faker::Lorem.sentence(100)
        i.general_sum = rand(100..10_000)
        i.finished_at = Time.current.to_date
        i.save!
      end
      print '.'
    end

    1.upto(50) do |t|
      Categorization.new.tap do |i|
        i.initiative_id = t
        i.category_id = rand(1..5)
        i.save
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
