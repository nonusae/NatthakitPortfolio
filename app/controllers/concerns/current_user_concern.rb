module CurrentUserConcern
    extend ActiveSupport::Concern

    def current_user
        #Overwrite the default method provided by devise for guest user
        # 'super' mean Dont change anything I simply want the exact same behaviours that we overwrite

        # Implement noObject pattern: if user exist old current user(which represent by super) 
        # will return true if not guest user in the right hand side will be create and come in
        
        super || guest_user
    end

    def guest_user
        # OpenStruct.new(name: "Guest User",
        #               first_name:"Guest" ,
        #               last_name: "User",
        #               email: "guest@guest.com" 
        #               )
        ## We first implement Openstruct to stiafy our condition for null object
        ## but we want to have real User object when integrate Petergate to app 

        guest = GuestUser.new
        guest.name = "Guest User"
        guest.first_name = "Guest"
        guest.last_name = "User"
        guest.email = "guest@example.com"
        guest
    end

end