namespace :db do
  task populate: :environment do
    puts 'Users:'
    10.times do |t|
      user = User.new.tap do |u|
        u.name = Faker::HarryPotter.character
        u.email = Faker::Internet.email
        u.password = '123456'
        u.phone = '0991351355'
        u.age = rand(10..100)
        u.save!
      end
      puts user.name
    end

    puts 'Categories:'
    10.times do |t|
      category = Category.new.tap do |c|
        c.title = Faker::Movie.quote
        c.position = t
        c.save
      end
      puts category.title
    end

    puts 'Initiatives:'
    50.times do |t|
      initiative = Initiative.new.tap do |i|
        i.user_id = rand(1...User.count)
        puts rand(1...User.count)
        i.title = Faker::Lorem.sentence(10)
        i.short_description = Faker::Lorem.sentence(20)
        i.long_description = Faker::Lorem.sentence(50)
        i.general_sum = rand(100..10_000)
        i.finished_at = Time.current.to_date
        i.save!
      end
      p initiative.title
    end

    puts 'Categorizations:'
    50.times do |t|
      categorization = Categorization.new.tap do |i|
        i.initiative = t
        i.category = rand(1..10)
        i.save
      end
    end
  end
end
