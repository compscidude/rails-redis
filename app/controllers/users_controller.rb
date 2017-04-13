class UsersController < ApplicationController

    include UsersHelper

    def index
        # fetch users from the redis server
        @Users ||= fetch_users
    end     

    def create
        100.times {
                score = sprintf "%.2f", rand() * 5
                user = User.create(name: Faker::Name.name, score: score)
                add_to_redis(user)
        }
       redirect_to root_path
    end 

    def delete
        users = User.order("RANDOM()").limit(100)
        users.each do |user|
            if (user.destroy)
                remove_from_redis(user)
            end 
        end 
        redirect_to root_path
    end

    def toggle
        redis_toggle
        redirect_to root_path
    end 
    

    


end
