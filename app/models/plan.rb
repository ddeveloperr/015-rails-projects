class Plan < ActiveRecord::Base
    has_many :users # users is plural
end