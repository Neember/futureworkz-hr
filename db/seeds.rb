# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'Start seeding admin'
leave_data = { reason: 'Add Leave days for new year', status: :approved, category: :annual, start_day: "01-01-#{Time.now.year} 08:30".to_date, end_day: "31-12-#{Time.now.year} 17:30".to_date, total: 14, sub_cate: 'normal'}

admins_data = [
  { name: 'Vu Quang Thang', english_name: 'Martin', email: 'martin@futureworkz.com', personal_email: 'vuquangthang87@gmail.com', address: 'Viet Nam', phone_number: '0123213123', started_on: '2012/06/16', probation_end_on: '2012/08/16', designation: 'Coder' },
  { name: 'Jack', english_name: 'Jack', email: 'jack@futureworkz.com', personal_email: 'jack@futureworkz.com', address: 'Viet Nam', phone_number: '0123213123', started_on: '2012/06/16', probation_end_on: '2012/08/16', designation: 'Coder' },
  { name: 'Jackie', english_name: 'Jackie', email: 'jackie@futureworkz.com', personal_email: 'jackie@gmail.com', address: 'Viet Nam', phone_number: '034543534', started_on: '2014/06/16', probation_end_on: '2014/08/16', designation: 'HR' },
  { name: 'John', english_name: 'John', email: 'john@futureworkz.com', personal_email: 'tuananhasp@gmail.com', address: 'Viet Nam', phone_number: '034543534', started_on: '2014/06/16', probation_end_on: '2014/08/16', designation: 'HR' },
  { name: 'HR', english_name: 'HR', email: 'hr@futureworkz.com', personal_email: 'hr@example.com', address: 'Viet Nam', phone_number: '034543534', started_on: '2014/06/16', probation_end_on: '2014/08/16', designation: 'HR' }
]

admins_data.each do |admin_data|
  admin = Staff.find_or_initialize_by(admin_data)
  admin.password = Random.rand(10000000..99999999999999)
  admin.is_admin = true
  admin.save!

  puts 'Adds annual and carry-over leaves'
  leave = Leave.find_or_initialize_by(leave_data.merge(staff_id: admin.id))
  leave.save
  puts 'Leaves seeded'
end

puts 'Admin seeded'






