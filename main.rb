require_relative 'lib/game'
require_relative 'lib/save_load_menu'

puts "Hello!\n This is Hangman in the console\nby jlcarg\n\n\n"

unless Dir.children('save_files').empty?
  puts 'Would you like to load a previous game? Type Y if yes'
  answer = gets.chomp
end

if answer == 'Y'
  puts "Which save file would like to return to?\n\n"
  SaveLoadMenu.show_save_files_arr.each do |filename|
    puts filename
  end
  puts "Type the save file number to select it\n"
  save_file_number = gets.chomp.to_i
  save_file_object = SaveLoadMenu.load_game save_file_number
  game = Game.new(save_file_object.board, save_file_object.player)
  puts "\nOkay, your game will restart in 3 seconds\n"
  puts '3'
  sleep 1
  puts '2'
  sleep 1
  puts '1'
  sleep 1
  system('clear')
else
  game = Game.new
end

game.start
