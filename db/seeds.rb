# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "This will take a bit..."

10000.times do 
  machine_id = Faker::Internet.uuid

  Metric.create({ category: 'os_version', value: Faker::App.version, machine_id: machine_id, created_at: Faker::Time.between_dates(from: Date.today - 30, to: Date.today, period: :all) })
  Metric.create({ category: 'ram_usage', value: Faker::Number.between(from: 20, to: 100), machine_id: machine_id, created_at: Faker::Time.between_dates(from: Date.today - 30, to: Date.today, period: :all) })
  Metric.create({ category: 'cpu_usage', value: Faker::Number.decimal(l_digits: 2, r_digits: 2), machine_id: machine_id, created_at: Faker::Time.between_dates(from: Date.today - 30, to: Date.today, period: :all) })
  Metric.create({ category: 'powershell_version', value: rand(5.0...15.0).round(1), machine_id: machine_id, created_at: Faker::Time.between_dates(from: Date.today - 30, to: Date.today, period: :all) })
  Metric.create({ category: 'syncro_live_connectable', value: (Faker::Boolean.boolean)? "yes" : "no", machine_id: machine_id, created_at: Faker::Time.between_dates(from: Date.today - 30, to: Date.today, period: :all) })
  Metric.create({ category: 'remote_logins', value: Faker::Number.between(from: 0, to: 50), machine_id: machine_id, created_at: Faker::Time.between_dates(from: Date.today - 30, to: Date.today, period: :all) })
  Metric.create({ category: 'updates_enabled', value: (Faker::Boolean.boolean)? "yes" : "no", machine_id: machine_id, created_at: Faker::Time.between_dates(from: Date.today - 30, to: Date.today, period: :all) })
  Metric.create({ category: 'windows_defender_enabled', value: (Faker::Boolean.boolean)? "yes" : "no", machine_id: machine_id, created_at: Faker::Time.between_dates(from: Date.today - 30, to: Date.today, period: :all) })
  Metric.create({ category: 'last_updated', value: Faker::Date.between(from: 1.month.ago, to: Date.today), machine_id: machine_id, created_at: Faker::Time.between_dates(from: Date.today - 30, to: Date.today, period: :all) })
  Metric.create({ category: 'average_ping', value: Faker::Number.between(from: 20, to: 1500), machine_id: machine_id, created_at: Faker::Time.between_dates(from: Date.today - 30, to: Date.today, period: :all) })
end
