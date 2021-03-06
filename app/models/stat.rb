class Stat < ActiveRecord::Base
  attr_protected
  belongs_to :player
  
  def self.get(player)
  require 'open-uri'
  require 'date'
  require 'json'
    puts("ENTERED STATS CREATE FOR")
    puts(player[:gsis])
    time = DateTime.now
    gameDay = time - time.wday
    gameNum = 0
    flag = true
    while(gameNum < 14 and flag)
      puts(gameNum)
      date = gameDay.year.to_s() + '%.2d' % gameDay.month + '%.2d' % gameDay.day + '%.2d' % gameNum
      url = "http://www.nfl.com/liveupdate/game-center/#{date}/#{date}_gtd.json"
      game = JSON.load(open(url))
      stats = Stat.findStats(game, player[:gsis])
      puts("THIS IS STATS")
      puts(stats[0].class)
      puts(stats[1].class)
      puts(stats[2].class)
      puts(stats[3].class)
      puts(stats[4].class)
      puts(stats)
      if(stats[0].class != NilClass || stats[1].class != NilClass || stats[2].class != NilClass || stats[3].class != NilClass || stats[4].class != NilClass)
        #puts(game)
        flag = false
        break
      else
        gameNum = gameNum + 1
      end
    end
    if(stats[0].class == NilClass && stats[1].class == NilClass && stats[2].class == NilClass && stats[3].class == NilClass && stats[4].class == NilClass)
      gameDay = gameDay - 3
      date = gameDay.year.to_s() + '%.2d' % gameDay.month + '%.2d' % gameDay.day + '%.2d' % 0
      url = "http://www.nfl.com/liveupdate/game-center/#{date}/#{date}_gtd.json"
      game = JSON.load(open(url))
      stats = Stat.findStats(game, player[:gsis])
    end
    if(stats[0].class == NilClass && stats[1].class == NilClass && stats[2].class == NilClass && stats[3].class == NilClass && stats[4].class == NilClass)
      gameDay = gameDay + 4
      date = gameDay.year.to_s() + '%.2d' % gameDay.month + '%.2d' % gameDay.day + '%.2d' % 0
      url = "http://www.nfl.com/liveupdate/game-center/#{date}/#{date}_gtd.json"
      game = JSON.load(open(url))
      stats = Stat.findStats(game, player[:gsis])
    end
    puts("HERE IS THE FOUND STATS")
    puts(stats)
    return stats = Stat.mapStats(stats)
    #@current_user.(Player.find_by_id(stat.player.id[:id])).create_stat(stats)
  end
  
  def self.mapStats(map)
  stats = Hash.new()
    if(map[0] != nil)
      stats.merge!({:pass_att => map[0]["att"]})
      stats.merge!({:pass_comp => map[0]["cmp"]})
      stats.merge!({:pass_yrd => map[0]["yds"]})
      stats.merge!({:pass_td => map[0]["tds"]})
      stats.merge!({:int => map[0]["ints"]})
    else
      stats.merge!({:pass_att => 0})
      stats.merge!({:pass_comp => 0})
      stats.merge!({:pass_yrd => 0})
      stats.merge!({:pass_td => 0})
      stats.merge!({:int => 0})
    end
    if(map[1] != nil)
      stats.merge!({:rush_att => map[1]["att"]})
      stats.merge!({:rush_yrd => map[1]["yds"]})
      stats.merge!({:rush_td => map[1]["tds"]})
    else
      stats.merge!({:rush_att => 0})
      stats.merge!({:rush_yrd => 0})
      stats.merge!({:rush_td => 0})
    end
    if(map[2] != nil)
      stats.merge!({:kick_att => map[2]["fga"]})
      stats.merge!({:kick_fg => map[2]["fgm"]})
      stats.merge!({:kick_pat => map[2]["xpmade"]})
    else
      stats.merge!({:kick_att => 0})
      stats.merge!({:kick_fg => 0})
      stats.merge!({:kick_pat => 0})
    end
    if(map[3] != nil)
      stats.merge!({:rec => map[3]["rec"]})
      stats.merge!({:rec_yrd => map[3]["yds"]})
      stats.merge!({:rec_td => map[3]["tds"]})
    else
      stats.merge!({:rec => 0})
      stats.merge!({:rec_yrd => 0})
      stats.merge!({:rec_td => 0})
    end
    if(map[4] != nil)
      stats.merge!({:fumble => map[4]["lost"]})
    else
      stats.merge!({:fumble => 0})
    end
    return stats
  end
  
  def self.findStats(obj, key)
    i = 0;
    side = ["home", "away"]
    type = ["passing", "rushing", "kicking", "receiving", "fumbles"]
    stats = []
      while(i < 5)
        stats[i] = Stat.nested_hash_value(Stat.nested_hash_value(Stat.nested_hash_value(obj, side[0]), type[i]), key)
        i = i + 1
      end
    if(stats[0].class == NilClass && stats[1].class == NilClass && stats[2].class == NilClass && stats[3].class == NilClass && stats[4].class == NilClass)
      i = 0
      while(i < 5)
        stats[i] = Stat.nested_hash_value(Stat.nested_hash_value(Stat.nested_hash_value(obj, side[1]), type[i]), key)
        i = i + 1
      end
    end
    puts("THIS SHOULD BE THE RETURNED STATS")
    puts(stats)
    return stats
  end
    
  def self.nested_hash_value(obj,key)
    if obj.respond_to?(:key?) && obj.key?(key)
      obj[key]
    elsif obj.respond_to?(:each)
      r = nil
      obj.find{ |*a| r=nested_hash_value(a.last,key) }
      r
    end
  end
  
end
