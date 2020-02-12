class RoutesController < ApplicationController
    before_action :find_route, only: [:show]

    def index
        @routes = Route.all  
    end 


    def show
         
    end 

    private 

    def find_route 
       @route = Route.find(params[:id])
    end 
end
