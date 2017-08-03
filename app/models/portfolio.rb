class Portfolio < ApplicationRecord
    has_many :technologies
    include Placeholder #concern's module
    validates_presence_of :title, :body, :main_image, :thumb_image

    def self.angular
        where(subtitle: "Angular")
    end

    #Best practice to keep all logic for the model, Becuase the controller should only manage the data flow
    scope :ruby_on_rails_portfolio_items , ->  { where(subtitle: "Ruby On Rails") }

    after_initialize :set_defaults

    def set_defaults
        self.main_image ||= Placeholder.image_generator(height:600, width:400)
        self.thumb_image ||= Placeholder.image_generator(height:350, width:200)
    end

end
