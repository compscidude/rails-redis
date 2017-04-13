class User < ApplicationRecord


    default_scope { order(score: :desc) }
    
end


