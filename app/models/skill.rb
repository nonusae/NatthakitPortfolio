class Skill < ApplicationRecord
    include Placeholder #concern's module
    validates_presence_of :title, :percent_untilized
    
end
