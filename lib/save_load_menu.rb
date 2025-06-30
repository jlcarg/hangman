require 'yaml'
require 'date'

class SaveLoadMenu
  def self.serialize(current_game)
    YAML.dump(current_game)
  end

  def self.write_save_file(yaml, player_name, date, save_number)
    File.open("save_files/#{save_number}_#{player_name}_#{date}.txt", 'w') do |file|
      file.write(yaml)
    end
  end

  def self.save_game(current_game)
    player_name = current_game.player.player_name
    date = DateTime.now.strftime('%d-%m-%Y %H:%M').gsub(' ', '_')
    number_of_save_files = Dir.children('save_files').length
    save_number = number_of_save_files + 1
    yaml = serialize(current_game)

    write_save_file(yaml, player_name, date, save_number)
  end

  def self.show_save_files_arr
    Dir.children('save_files').sort
  end

  def self.load_game(save_number)
    # Subtract 1 so it matches array starting from 0
    path = show_save_files_arr[save_number - 1]
    YAML.load File.open("save_files/#{path}", 'r'), permitted_classes: [Game, Board, Player]
  end
end
