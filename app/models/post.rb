class Post < ApplicationRecord
    belong_to: user
    has_many: comments
    has_many: likes
end