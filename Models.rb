class User < ActiveRecord::Base
    has_many :posts
    has_one :address
    has_one :profile
end

class Post < ActiveRecord::Base
    belongs_to :user
end

class Address <ActiveRecord::Base
    has_one :user
end

class Profile <ActiveRecord::Base
    has_one :user
end
