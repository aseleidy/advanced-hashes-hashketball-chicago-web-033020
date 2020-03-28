# Write your code here!
require 'pry'

def game_hash 
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        { :player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1,
        },
        { :player_name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7,
        },
        { :player_name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15,
        },
        { :player_name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5,
        }, 
        { :player_name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1,
        }
        ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        { :player_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2,
        },   
        { :player_name => "Bismack Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10,
        },
        { :player_name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5,
        },
        { :player_name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0,
        },
        { :player_name => "Kemba Walker",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12,
        }
        ]
    }
  }
  hash 
end 

def num_points_scored(name)
  game_hash.each do |two_teams, team_info|
    team_info[:players].each do |index|
      if name == index[:player_name]
        return index[:points]
      end 
    end 
  end 
  return "Sorry, this player does not play for either team."
end 
     
def shoe_size(name)
  game_hash.each do |two_teams, team_info|
    team_info[:players].each do |index|
      if name == index[:player_name]
        return index[:shoe]
      end 
    end 
  end 
  return "Sorry, this player does not play for either team."
end 

def team_colors(team_name)
  game_hash.each do |two_teams, team_info|
    if team_name == team_info[:team_name]
      return team_info[:colors]
    end 
  end 
end 

def team_names
teams_array = []  
  game_hash.each do |two_teams, team_info|
      teams_array.push((team_info[:team_name]).to_s)
  end 
  return teams_array
end 

def player_numbers(team_name)
jersey_numbers = []  
  game_hash.each do |two_teams, team_info|
    team_info[:players].each do |index|
      if team_name == team_info[:team_name]
        jersey_numbers.push(index[:number])
      end 
    end 
  end 
  return jersey_numbers
end 

def player_stats(name)
  game_hash.each do |two_teams, team_info|
    team_info[:players].each do |index|
      if name == index[:player_name]
        index.shift
        return index
      end 
    end 
  end 
end 

def big_shoe_rebounds
shoe_size = 0 
player = nil 
rebounds = 0 
  game_hash.each do |two_teams, team_info|
    team_info[:players].each do |index|
      if shoe_size < index[:shoe]
        shoe_size = index[:shoe]
        player = index[:player_name]
        rebounds = index[:rebounds]
      end
    end 
  end 
  return rebounds 
end 

def most_points_scored
points = 0 
player = nil
  game_hash.each do |two_teams, team_info|
    team_info[:players].each do |index|
      if points < index[:points]
        points = index[:points]
        player = index[:player_name]
      end
    end 
  end 
  return player
end 

def winning_team
first_team = 0
second_team = 0 
  game_hash.each do |two_teams, team_info|
    team_info[:players].each do |index|
      if team_info[:team_name] == "Brooklyn Nets"
          first_team += index[:points]
      else 
          second_team += index[:points]
      end 
    end 
  end 
  if first_team > second_team
    return "Brooklyn Nets"
  else 
    return "Charlotte Hornets"
  end 
end 

def player_with_longest_name
name_length = 0
player_name = nil
  game_hash.each do |two_teams, team_info|
    team_info[:players].each do |index|
      combined_name = index[:player_name].delete(' ')
      if name_length < combined_name.length 
        name_length = combined_name.length 
        player_name = index[:player_name]
      end 
    end 
  end 
  return player_name
end 

def long_name_steals_a_ton?
most_steals = 0
steals_player = nil  
  game_hash.each do |two_teams, team_info|
    team_info[:players].each do |index|
      if most_steals < index[:steals] 
        most_steals = index[:steals] 
        steals_player = index[:player_name]
      end 
    end 
  end
  return (steals_player == player_with_longest_name)
end 

