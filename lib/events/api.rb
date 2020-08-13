class API 

    def self.get_events(zipcode)
        # make sure to add a begin rescue incase of errors or nil returns
        key = "MuSMMvgVvwIcGzKAor9PYshCDqKVHFRL"
        url = "https://app.ticketmaster.com/discovery/v2/events.json?postalCode=#{zipcode}&apikey=#{key}"
        response = HTTParty.get(url)
        response["_embedded"]["events"].each do |e| 
            name =  e["name"]
            url = e["url"]
            Event.new(name, url)
        end 
        # hash = {
        #     "name": response["_embedded"]["events"][0]["name"],
        #     "url": response["_embedded"]["events"][0]["url"]
        # }
    end 
end 