def current_time
  time = Time.new
  time.strftime("%T")
end

def say_hello(name, health=100)
 puts  "I'm #{name.capitalize} with a health of #{health} as of #{current_time}"
end

say_hello("larry", 60)
say_hello("curly", 125)
say_hello("moe")
say_hello("shemp", 90)

