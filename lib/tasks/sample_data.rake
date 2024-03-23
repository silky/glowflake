# frozen_string_literal: true

require 'faker'

namespace :db do
  desc 'Drop and recreate the db'
  task reset: %i[drop create migrate seed] do
    puts 'Database reset!'
  end

  desc 'Generate some sample data'
  task generate_sample_data: :environment do
    puts 'Creating tags ...'
    tags = (1..10).map do
      Tag.create(name: Faker::Verb.past,
                 colour: Faker::Color.hex_color)
    end

    puts 'Creating people and work-updates ...'
    8.times do
      p = Person.create(name: Faker::Name.name,
                        image: 'default-person.png',
                        email: Faker::Internet.email(domain: 'localhost'))
      n = rand(1..10)

      n.times do
        update = WorkUpdate.create(person_id: p.id,
                                   content: Faker::Markdown.sandwich(sentences: 3))
        tag = tags.sample
        k = rand(0..5)
        k.times do
          TagWorkUpdate.create(tag_id: tag.id,
                               work_update_id: update.id)
        rescue ActiveRecord::RecordNotUnique
          # Silently ignore! It's okay, and in the worst case this update has
          # no tags, which is fine.
        end
      end
    end
  end
end
