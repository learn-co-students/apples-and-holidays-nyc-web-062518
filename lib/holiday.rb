require 'pry'

holiday_supplies = {
  :winter => {
    :christmas => ["Lights", "Wreath"],
    :new_years => ["Party Hats"]
  },
  :summer => {
    :fourth_of_july => ["Fireworks", "BBQ"]
  },
  :fall => {
    :thanksgiving => ["Turkey"]
  },
  :spring => {
    :memorial_day => ["BBQ"]
  }
}


def second_supply_for_fourth_of_july(holiday_hash)
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash.each do |season, holiday|
    if season == :winter
      holiday.each_value do |supply_list|
        supply_list << supply
      end
    end
  end
  holiday_hash
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash.each do |season, holiday|
    if season == :spring
      holiday.each do |holiday_name, supply_list|
        if holiday_name == :memorial_day
          supply_list << supply
        end
      end
    end
  end
  holiday_hash
end


def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  updated_season = holiday_hash[season].merge(holiday_name => supply_array)
  holiday_hash[season] = updated_season
  holiday_hash
end


def all_winter_holiday_supplies(holiday_hash)
  winter_supplies = []
  holiday_hash[:winter].each_value do |value|
    winter_supplies << value
  end
  winter_supplies.flatten
end


def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, holiday|
    season = season.to_s.split.each { |word| word.capitalize!}
    season = season.join(" ")
    puts "#{season}:"
    holiday.each do |holiday_name, supplies|
      holiday_name = holiday_name.to_s.split('_').each {|word| word.capitalize!}
      holiday_name = holiday_name.join(" ")
      supplies = supplies.join(", ")
      puts "  #{holiday_name}: #{supplies}"
    end
  end
end


def all_holidays_with_bbq(holiday_hash)
  holidays_with_bbq = []
  holiday_hash.each do |season, holiday|
    holiday.each do |holiday_name, supplies|
      if supplies.include?("BBQ")
        holidays_with_bbq << holiday_name
      end
    end
  end
  holidays_with_bbq
end
