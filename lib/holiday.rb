require 'pry'

  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter].each do |holiday, item|
    item << supply
  end
  #alternatively:
  #holiday_hash[:winter][:christmas] << supply
  #holiday_hash[:winter][:new_years] << supply
end

def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring].each do |holiday, item|
    item << supply
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  array = []
  holiday_hash[:winter].each do |holiday, item|
    array << item
  end
  array.flatten
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, season_value|
    puts "#{season.to_s.capitalize}:"
    season_value.each do |holiday, item|
      array = holiday.to_s.split("_")
      capitalized_array = []
      array.each do |value|
        capitalized_array << value.capitalize
      end

      holiday = capitalized_array.join(" ")
      item = item.join(", ")
      puts "  #{holiday}: #{item}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  array = []
  holiday_hash.each do |season, season_value|
    season_value.each do |holiday, item|
      item.each do |value|
        if value == "BBQ"
          array << holiday
        end
      end
    end
  end
  array
end
