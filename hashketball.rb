# Write your code here!
def game_hash
  ret_hash= {}
  ret_hash[:home] = {}
  ret_hash[:away] = {}
  ret_hash[:home][:team_name] = "Brooklyn Nets"
  ret_hash[:away][:team_name] = "Charlotte Hornets"
  ret_hash[:home][:colors] = ["Black", "White"]
  ret_hash[:away][:colors] = ["Turquoise", "Purple"]
  ret_hash[:home][:players] = 
  [{:player_name => "Alan Anderson", :number => 0,:shoe => 16,       :points => 22, :rebounds => 12, :assists => 12, 
        :steals => 3, :blocks => 1, :slam_dunks => 1},
   {:player_name => "Reggie Evans", :number => 30 ,:shoe => 14,     :points => 12, :rebounds => 12, :assists => 12, 
        :steals => 12, :blocks => 12, :slam_dunks => 7},
   {:player_name => "Brook Lopez", :number => 11,:shoe => 17,       :points => 17, :rebounds => 19, :assists => 10, 
        :steals => 3, :blocks => 1, :slam_dunks => 15},
   {:player_name => "Mason Plumlee", :number => 1,:shoe => 19,      :points => 26, :rebounds => 11, :assists => 6, 
        :steals => 3, :blocks => 8, :slam_dunks => 5},
   {:player_name => "Jason Terry", :number => 31,:shoe => 15,       :points => 19, :rebounds => 2, :assists => 2, 
        :steals => 4, :blocks => 11, :slam_dunks => 1}
  ]
  ret_hash[:away][:players] = 
  [{:player_name => "Jeff Adrien", :number => 4,:shoe => 18,         :points => 10, :rebounds => 1, :assists => 1, 
        :steals => 2, :blocks => 7, :slam_dunks => 2},
   {:player_name => "Bismack Biyombo", :number => 0 ,:shoe => 16,    :points => 12, :rebounds => 4, :assists => 7, 
        :steals => 22, :blocks => 15, :slam_dunks => 10},
   {:player_name => "DeSagna Diop", :number => 2,:shoe => 14,       :points => 24, :rebounds => 12, :assists => 12, 
        :steals => 4, :blocks => 5, :slam_dunks => 5},
   {:player_name => "Ben Gordon", :number => 8,:shoe => 15,      :points => 33, :rebounds => 3, :assists => 2, 
        :steals => 1, :blocks => 1, :slam_dunks => 0},
   {:player_name => "Kemba Walker", :number => 33,:shoe => 15,      :points => 6, :rebounds => 12, :assists => 12, 
        :steals => 7, :blocks => 5, :slam_dunks => 12}
  ]
  ret_hash
end

def num_points_scored(player)
  stats= game_hash
  away_hash = stats.select { |k, v| k== :away}
  away_player_array = away_hash[:away][:players]
  home_hash = stats.select { |k, v| k ==:home}
  home_player_array = home_hash[:home][:players]
  index = find_index(away_player_array, player)
  if index == nil 
    index = find_index(home_player_array, player)
    stats[:home][:players][index][:points]
  else
    stats[:away][:players][index][:points]
  end
end

def shoe_size(player)
    stats= game_hash
  away_hash = stats.select { |k, v| k== :away}
  away_player_array = away_hash[:away][:players]
  home_hash = stats.select { |k, v| k ==:home}
  home_player_array = home_hash[:home][:players]
  index = find_index(away_player_array, player)
  if index == nil 
    index = find_index(home_player_array, player)
    stats[:home][:players][index][:shoe]
  else
    stats[:away][:players][index][:shoe]
  end
end

def team_colors(team)
  colors= []
  stats = game_hash
  if stats[:home][:team_name] == team
    colors =stats[:home][:colors]
  else
    colors = stats[:away][:colors]
  end
  colors
end

def team_names
  stats = game_hash
  teams = []
  teams << stats[:home][:team_name]
  teams << stats[:away][:team_name]
  teams
end

def player_numbers(team)
  stats= game_hash
  team_nums = []
  player_array = []
  if stats[:home][:team_name]== team
    player_array = stats[:home][:players]
  else
    player_array = stats[:away][:players]
  end
  row = 0 
  while player_array[row] do
    team_nums << player_array[row][:number]
    row += 1
  end
  team_nums
end

def player_stats(player)
  stats= game_hash
  away_hash = stats.select { |k, v| k== :away}
  away_player_array = away_hash[:away][:players]
  home_hash = stats.select { |k, v| k ==:home}
  home_player_array = home_hash[:home][:players]
  index = find_index(away_player_array, player)
  flag = 0
  if index == nil 
    index = find_index(home_player_array, player)
    flag = 1
  end 
  player_hash = {}
  player_hash[player]={}
  away_player_array
  if flag == 0 
    away_player_array[index].each do |key, value|
      if key != :player_name
        player_hash[player][key]= value
      end
    end
  else
    home_player_array[index].each do |key, value|
      if key != :player_name
        player_hash[player][key] = value
      end
    end
  end
player_hash[player]
end 

def big_shoe_rebounds
  stats= game_hash
  away_hash = stats.select { |k, v| k== :away}
  away_player_array = away_hash[:away][:players]
  home_hash = stats.select { |k, v| k ==:home}
  home_player_array = home_hash[:home][:players]
  index = -2
  shoe_size = 0
  rebounds = 0 
  row = 0
  home = true 
  while home_player_array[row] do 
    if home_player_array[row][:shoe] > shoe_size
      shoe_size = home_player_array[row][:shoe]
      rebounds = home_player_array[row][:rebounds]
      index = row
    end 
    
    row += 1 
  end
  
  row = 0 
  while away_player_array[row] do 
    if away_player_array[row][:shoe] > shoe_size
      shoe_size = home_player_array[row][:shoe]
      rebounds = home_player_array[row][:rebounds]
      index = row
      home = false 
    end 
   
    row += 1 
  end
  
  if home 
    home_player_array[index][:rebounds]
  else
    away_player_array[index][:rebounds]
  end
end

def find_index(players, player_name)
  row = 0 
  while players[row] do 
    if players[row][:player_name]== player_name
      return row
    end 
    row += 1 
  end
  return nil
end









