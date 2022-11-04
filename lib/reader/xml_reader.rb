class Xml_Reader

  #Task 1: (XML Handling)

  require 'ostruct'
  require 'active_support/core_ext/hash'
  require 'active_support'

  result = OpenStruct.new #creating OpenStruct
  
  xml = Hash.from_xml(File.open('tmp/xml_uncompressed.xml')) #BY HASH

  xml.values[0]["Body"].each do |key, value|
    
    hotel_reservation = value["HotelReservations"]["HotelReservation"]
    room_stay = hotel_reservation["RoomStays"]["RoomStay"]

    result.id = hotel_reservation["ResGlobalInfo"]["HotelReservationIDs"]["HotelReservationID"][1]["ResID_Value"]
    result.external_id = hotel_reservation["ResGlobalInfo"]["HotelReservationIDs"]["HotelReservationID"][0]["ResID_Value"]
    result.state = hotel_reservation["ResStatus"]
    result.rate_plan = room_stay["RatePlans"]["RatePlan"]
    result.services = room_stay["Services"]["Service"].join(",")
    
  end

  puts result

  #below is the result
  #<OpenStruct id="53501327-1", external_id="1085", state="Reserved", rate_plan={"RatePlanCode"=>"AAA", "PriceViewableInd"=>"true", "RatePlanDescription"=>{"Text"=>"AAA Discount Rate"}, "RatePlanInclusions"=>{"TaxInclusive"=>"false"}, "MealsIncluded"=>{"MealPlanIndicator"=>"true"}}, services="LateCheckOut,Spa Access,Minibar,TourismCard">

end