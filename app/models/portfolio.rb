class Portfolio < ApplicationRecord
    validates_presence_of :title, :body, :main_image, :thumb_image


    def self.angular
        where(subtitle: "Angular")
    end

    #Best practice to keep all logic for the model, Becuase the controller should only manage the data flow
    scope :ruby_on_rails_portfolio_items , ->  { where(subtitle: "Ruby On Rails") }
end
