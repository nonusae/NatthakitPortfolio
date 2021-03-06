class Portfolio < ApplicationRecord
    has_many :technologies
    accepts_nested_attributes_for :technologies,
                                  allow_destroy: true,
                                  reject_if: lambda { |attrs| attrs['name'].blank?} 
    #lambda mean we want to encapsulate the process and pass it to reject_if
    #For testing in console(Create portfolio with 2 technologies) : Portfolio.create!(title: "Foo", subtitle:"Bar", body:"Foobbar",technologies_attributes: [{name: 'foo'},{name: "bar"}])

    validates_presence_of :title, :body

    mount_uploader :thumb_image, PortfolioUploader
    mount_uploader :main_image, PortfolioUploader

    def self.angular
        where(subtitle: "Angular")
    end

    def self.by_position
        order("position ASC")
    end

    #Best practice to keep all logic for the model, Becuase the controller should only manage the data flow
    scope :ruby_on_rails_portfolio_items , ->  { where(subtitle: "Ruby On Rails") }

end