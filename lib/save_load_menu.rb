require 'yaml'
require 'date'

class SaveLoadMenu
  def self.serialize(current_game)
    YAML.dump(current_game)
  end

  def self.write_save_file(yaml, player_name, date, save_number)
    puts Dir.pwd
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

  def self.deserialize(yaml)
    YAML.parse(yaml)
  end

  def self.load_game(save_number)
    File.open('save_files.txt', 'r') do |file|
      array_of_saves = file.readlines
      array_of_saves[save_number]
    end
  end
end
