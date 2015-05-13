require 'sinatra'
require 'sinatra/reloader'

random_number = rand(50)

get '/' do
  guess   = params["guess"]
  message = guess_checker(guess, random_number)
  erb     :index, :locals => {:message => message}
end

def guess_checker(guess, random_number)
  return "Guess a number from 0 to 50" if guess == nil
  return "Cheater!! The winning number is #{random_number}" if guess.downcase == "cheat"
  return "Input field takes a number up to 2-digits" if guess.match(/[a-zA-Z]/) != nil
  
  guess = guess.to_i  
    if guess - random_number > 5
      "#{guess} is Way too high!"
    elsif random_number < guess
      "#{guess} is Too high"
    elsif random_number - guess > 5
      "#{guess} is Way too low"
    elsif random_number > guess
      "#{guess} is Too low"
    else
      "#{guess} is Correct! You Win!!"
    end
end