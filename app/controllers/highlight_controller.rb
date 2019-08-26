class HighlightController < ApplicationController
    def show
        #verifing if data was gaven
        if params[:latitude].blank? || params[:longitude].blank?
            render json: {message: "Latitude and Longitude is required"}, status: 401
            return;
        end
        
        points = []
        points << {
            latitude: 34567,
            longitude: -6587,
            name: "Night Club"
        }

        points << {
            latitude: 47552,
            longitude: -4244,
            name: "Big River"
        }

        points << {
            latitude: 98552,
            longitude: -3244,
            name: "Japanese food"
        }
        render json: points, status: 200
    end
end
