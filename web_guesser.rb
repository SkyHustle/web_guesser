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
  guess = guess.to_i
    if    guess - random_number > 5
      "Way too high!"
    elsif random_number < guess
      "Too high"
    elsif random_number - guess > 5
      "Way too low"
    elsif random_number > guess
      "Too low"
    else
      "Correct! You Win!"
    end
end