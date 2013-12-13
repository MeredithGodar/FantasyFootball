class StatsController < ApplicationController
	before_filter :set_current_user
  def show
    puts("ATTEMPTING TO FIND A PLAYER FOR YOU")
    id = params[:id] # retrieve player ID from URI route
    @player = Player.find(id) # look up player by unique ID
    puts("FOUND PLAYER, FOUND PLAYER, FOUND PLAYER, FOUND PLAYER")
    puts(@player)
    #puts(@player.stat.pass_att)
    # will render app/views/stats/show.<extension> by default
  end
=begin  
  def get(player)
    puts("ENTERED STATS CREATE FOR")
    puts(stat.player[:id])
    time = DateTime.now
    gameDay = time - time.wday
    gameNum = 0
    
    while(game < 14)
      date = gameDay.year.to_s() + '%.2d' % gameDay.month + '%.2d' % gameDay.day + '%.2d' % gameNum
      url = "http://www.nfl.com/liveupdate/game-center/#{date}/#{date}_gtd.json"
      game = JSON.load(open(url))
      stats = findStats(game, stat.player[:id])
      if(stats != nil)
        break
      else
        game = game + 1
      end
    end
    if(stats == nil)
      gameDay = gameDay - 3
      date = gameDay.year.to_s() + '%.2d' % gameDay.month + '%.2d' % gameDay.day + '%.2d' % gameNum
      url = "http://www.nfl.com/liveupdate/game-center/#{date}/#{date}_gtd.json"
      game = JSON.load(open(url))
      stats = findStats(game, stat.player.id[:id])
    end
    if(stats == nil)
      gameDay = gameDay + 4
      date = gameDay.year.to_s() + '%.2d' % gameDay.month + '%.2d' % gameDay.day + '%.2d' % gameNum
      url = "http://www.nfl.com/liveupdate/game-center/#{date}/#{date}_gtd.json"
      game = JSON.load(open(url))
      stats = findStats(game, stat.player.id[:id])
    end
    
    return stats = mapStats(stats)
    #@current_user.(Player.find_by_id(stat.player.id[:id])).create_stat(stats)
  end
  
  def mapStats(map)
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
  
  def findStats(obj, key)
    i = 0;
    type = ["passing", "rushing", "kicking", "receiving", "fumbles"]
    stats = Array.new()
    while(i < 5)
      stats[i] = nested_hash_value(nested_hash_value(obj, type[i]), key)
      i = i + 1
    end
    return stats
  end
    
  def nested_hash_value(obj,key)
    if obj.respond_to?(:key?) && obj.key?(key)
      obj[key]
    elsif obj.respond_to?(:each)
      r = nil
      obj.find{ |*a| r=nested_hash_value(a.last,key) }
      r
    end
  end
=end
end
