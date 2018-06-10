require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
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
  # return the second element in the 4th of July array
  holiday_hash.each do |season, holidays|
    if season == :summer
      holidays.each do |holiday, decoration|
        return (holidays[holiday])[1]
      end
    end
  end
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash.each do |season, holidays|
    if season == :winter
      holidays.each do |holiday, decoration|
        holidays[holiday].push(supply)
      end
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |season, holidays|
    if season == :spring
      holidays.each do |holiday, decoration|
        holidays[holiday].push(supply)
      end
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  arrayOfSupplies = []
  appendedArray = []
  counter = 0
  holiday_hash.each do |season, holidays|
    if season == :winter
      holidays.each do |holiday, decoration|
        arrayOfSupplies.push(decoration)
      end
    end
  end
  while counter < arrayOfSupplies.length()
    appendedArray.concat(arrayOfSupplies[counter])
    counter = counter + 1
  end
  return appendedArray
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.collect do |season, holidays|
    puts ("#{season}:").capitalize!
    holidays.collect do |holiday, decorations|
      #Use Conditional .split("_")
      if "#{holiday}".include? "_"
        holidayArray = "#{holiday}".split("_")
        stringPrint = "  "
        counter = 0
        while counter < holidayArray.length() - 1
         stringPrint =  stringPrint + (("#{holidayArray[counter]} ").capitalize!)
         counter = counter + 1
        end
          puts stringPrint + (("#{holidayArray.last()}: ").capitalize!) + "#{decorations.join(", ")}"
      else
        puts "  " + (("#{holiday}: ").capitalize!) + "#{decorations.join(", ")}"
      end
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holidayArray = []
  holiday_hash.each do |seasons, holidays|
    holidays.each do |holiday, decorations|
      if decorations.include? "BBQ"
        holidayArray.push(holiday)
      end
    end
  end
  return holidayArray
end
