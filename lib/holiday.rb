require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash.each do |season,holiday|
    holiday.each do |holiday,supplies|
      if holiday==:christmas||holiday==:new_years
        supplies << supply
      end
    end
  end
  holiday_hash
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash.each do |season,holidays|
    holidays.each do |holiday,supplies|
      if holiday == :memorial_day
        supplies << supply
      end
    end
  end
  holiday_hash
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name]=supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  list = []
  holiday_hash.each do |season, holidays|
     holidays.each do |holiday,supplies|
        if holiday==:christmas||holiday==:new_years
          list << supplies
        
      end
    end
  end
  list.flatten
  end




def symbol_to_string(symbol)
  our_string = symbol.to_s
  if our_string.include?"_"
    no_underscore_string = []
    our_string=our_string.split("_")
    counter=0
    our_string.each do |word|
      no_underscore_string[counter]=word.capitalize
      counter+=1
    end
    no_underscore_string = no_underscore_string.join(" ")
    no_underscore_string+=":"
    return no_underscore_string
  else 
    our_string=our_string.capitalize + ":"
    return our_string
  end
end


def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season,holidays|
    season_string = symbol_to_string(season)
    puts season_string
    holidays.each do |holiday,supplies|
      holiday_string = symbol_to_string(holiday)
      supplies_string = supplies.join(", ")
      puts "  #{holiday_string} #{supplies_string}"
    end
  end
end





def all_holidays_with_bbq(holiday_hash)
  holidays_with_bbq=[]
  counter=0
  holiday_hash.each do |season,holidays|
    holidays.each do |holiday,supplies|
      
      if supplies.include?"BBQ"
        holidays_with_bbq[counter]=holiday
        counter+=1
      end
    end
  end
  return holidays_with_bbq
end















