###########################################################
def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Kemba Walker" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      } 
    }
  }
end
###########################################################
def all_players
  game_hash[:home][:players].merge(game_hash[:away][:players])
end

def player_stats(name)
  all_players[name]
end
###########################################################
############################
def num_points_scored(name)
  player_stats(name)[:points]
end

def shoe_size(name)
  player_stats(name)[:shoe]
end
############################
##########################HELPER METHODS#################################
def all_teams
  game_hash.values
end

def find_team(team_name)
  all_teams.find { |team| team[:team_name] == team_name }
end

def team_names
  all_teams.map { |team| team[:team_name] }
end
#########################################################################
############################
def team_colors(team_name)
  find_team(team_name)[:colors]
end

def player_numbers(team_name)
  find_team(team_name)[:players].map {|name, stats| stats[:number]}
end
############################
##########################

def player_w_max_stat(stat) #player with the max of a given stat
  all_players.max_by { |name, stats| stats[stat] }[0]
end

def team_stats(location) #total stats of given (home/away )team
  array=[]
  game_hash[location][:players].each do |player, player_hash|
    array << player_hash
  end
  array.reduce {|info, h| info.merge(h) {|_,v1,v2| v1 + v2 }}
end
###########################################################
############################
def big_shoe_rebounds
  player_stats(player_w_max_stat(:shoe))[:rebounds]
end

def most_points_scored
  player_w_max_stat(:points)
end

def winning_team
  if team_stats(:home)[:points] > team_stats(:away)[:points]
    return team_names[0]
  else
    return team_names[1]
  end
end

def player_with_longest_name
  all_players.keys.max_by { |name| name.length }
end

def long_name_steals_a_ton?
  player_w_max_stat(:steals) == player_with_longest_name
end
############################
###########################################################