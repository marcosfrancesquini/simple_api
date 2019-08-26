class HighlightController < ApplicationController
    def show
        #verifing if data was gaven
        if params[:latitude].blank? || params[:longitude].blank?
            render json: {message: "Latitude and Longitude is required"}, status: 401
            return;
        end

        latitude =  params[:latitude]
        longitude =  params[:longitude]
        responseStyle = 'short'
        citySize = 'cities15000'
        radius = 10
        maxRows = 5
        username = 'marcos'

        url = URI.escape("http://api.geonames.org/findNearbyPlaceNameJSON?lat=#{latitude}&lng=#{longitude}&style=#{responseStyle}&cities=#{citySize}&radius=#{radius}&maxRows=#{maxRows}&username=#{username}")
        nearbyCities = JSON.parse(HTTParty.get(url).body)
        points = []
        cities = nearbyCities["geonames"]
        if cities.present?
            cities = cities.map{|n|n["name"]}
            cities.each_with_index do |cidade, index|
                points << cidade
            end
        end
    
        render json: points, status: 200
    end
end
