module Roadmap

  def get_roadmap(road_map_id)
    url = "https://www.bloc.io/api/v1/roadmaps/#{road_map_id}"
    response = self.class.get(url, headers: {"authorization" => retrieve_token})
    # get body of data
    json = response.body
    #get ruby hash
    @rm = JSON.parse(json)
    return @rm
  end

  def get_checkpoint(cp_id)
    rm["sections"].each do |section|
        section["checkpoints"].each do |cp|
          return cp if cp["id"] == cp_id
        end
    end

  end

end
