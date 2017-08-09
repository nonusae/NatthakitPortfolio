module ApplicationHelper
    def login_helper style = ''
         unless current_user.is_a?(GuestUser) 
           link_to "Logout",destroy_user_session_path, method: :delete, class: style 
         else
           (link_to "Register",new_user_registration_path, class: style) +
           " ".html_safe + 
           (link_to "Login",new_user_session_path , class: style) 
           # use plus becauase ruby return last value from method
         end         
    end

    def source_helper(layout_name)
        if session[:source]
            greeting = "Thank for visiting me from #{session[:source]} and you are on #{layout_name} layout"
            content_tag(:p,greeting, class: "source-greeting")
        end
    end

    def copyright_generator
      NatthakitViewHelperTool::Renderer.copyright 'Natthakit Iewprasert', 'All rights reserved' 
    end

end
