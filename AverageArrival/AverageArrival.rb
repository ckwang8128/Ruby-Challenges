require 'date'

def average_time_of_day(list_of_times)

  #convert all of the times to pure seconds. 
  times_in_seconds = list_of_times.collect { |time| convert_to_seconds(DateTime.parse(time))  }

  #collect the average seconds
  avg_seconds =  times_in_seconds.inject { |sum, x| sum + x}/times_in_seconds.length

  #convert back to the usual method. 
  puts Time.at(avg_seconds).gmtime.strftime("%I:%M%p").downcase
end

def convert_to_seconds(time)
    #The 'time' argument is an instance of the DateTime class
    return time.hour() * 3600 + time.min()*60 + time.sec()
end


average_time_of_day(["11:51pm", "11:56pm", "12:01am", "12:06am", "12:11am"])
