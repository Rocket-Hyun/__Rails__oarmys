# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'


Category.create(name: '시사')
Category.create(name: '연예')
Category.create(name: '경제')
Category.create(name: '축구')
Category.create(name: '야구')

admin_user = User.create( name: "관리자", email: 'admin@naver.com', password: '139742685')
admin_user.tag_list.add("master")
admin_user.save



# csv_text = File.read(Rails.root.join('lib', 'seeds', 'user(0906).csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'UTF-8')
# csv.each do |row|
#   s = User.new
#   s.email = row['email']
#   s.name = row['name']
#   s.password = row['password']
#   s.agree = row['agree']
#   s.save
#   puts "#{s.email},#{s.name} saved"
# end
#
# csv_text = File.read(Rails.root.join('lib', 'seeds', 'membershipreal(0906).csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'UTF-8')
# csv.each do |row|
#   k = Membership.new
#   k.user_id = row['user_id']
#   k.s_name = row['s_name']
#   k.s_date = row['s_date']
#   k.s_birth = row['s_birth']
#   k.s_type = row['s_type']
#   k.phone = row['phone']
#   k.save
#   puts "#{k.s_name}, #{k.user.name} saved"
# end


# csv_text = File.read(Rails.root.join('lib', 'seeds', 'news(0906).csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'UTF-8')
# csv.each do |row|
#   s = Letter.new
#   s.title = row['l_date']+'의 뉴스'
#   s.content = row['content']
#   s.category_id = row['category_id']
#   s.l_date = row['l_date']
#   s.save
#   puts "#{s.title} saved"
# end
