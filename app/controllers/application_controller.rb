class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageContent

  before_action :set_copyright

  def set_copyright
    @copyright = NatthakitViewTool::Renderer.copyright 'Natthakit Iewprasert', 'All rights reserved' 
  end
end

module NatthakitViewTool
    class Renderer
        def self.copyright name, msg
            "&copy; #{Time.new.year} | <b>#{name}</b> #{msg}".html_safe
        end
    end
end