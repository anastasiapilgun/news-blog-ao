# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

class Seeder
  def self.seed
    User.destroy_all
    Post.destroy_all
    # Comment.destroy_all
    Image.destroy_all

    create_users
    create_posts
    # create_comments
  end

  def self.create_users
    create_admin_user
    2.times do |i|
      user = User.new(name: "First_#{i} Last_#{i}")
      user.email = "email#{i}@example.com"
      user.password = user.password_confirmation = "password"
      user.save!
    end
  end

  def self.create_admin_user
    user = User.new(name: "Admin 1")
    user.email = "admin1@example.com"
    user.password = user.password_confirmation = "adminpassword"
    user.role = User::ADMIN_ROLE
    user.save!
  end

  def self.create_posts
    Rake::Task['parse:music-news'].invoke
  end

  # def self.create_comments
  # end
end

Seeder.seed
