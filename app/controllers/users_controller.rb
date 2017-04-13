class UsersController < ApplicationController

    include UsersHelper
    after_action :refetch_users

    def index
        # fetch users from our redis
        @Users ||= fetch_users
    end     

    def create
      100.times {
            score = sprintf "%.2f", rand() * 5
            User.create(name: Faker::Name.name, score: score)
       }
       redirect_to root_path
    end 

    def delete
       users = User.order("RANDOM()").limit(100)
       users.each do |user|
            user.destroy
        end 
        redirect_to root_path
    end
    


end
