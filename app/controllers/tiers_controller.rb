class TiersController < ApplicationController

    def index 
        @tiers = Tier.all 
    end 
end
