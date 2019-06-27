import Cocoa

typealias  TeamData  =  (  teamId:  Int64?,  city:  String?,  nickName:  String?, abbreviation:  String?)
typealias  PlayerData  =  (  playerId:  Int64?,  firstName:  String?, lastName:  String?,  number:  Int?,  teamId:  Int64?, position:  Positions?)

enum  Positions:  String  {
    case  pitcher  =  "Pitcher"
    case  catcher  =  "Catcher"
    case  firstBase  =  "First  Base"
    case  secondBase  =  "Second  Base"
    case  thirdBase  =  "Third  Base"
    case  shortstop  =  "Shortstop"
    case  leftField  =  "Left  Field"
    case  centerField  =  "Center  Field"
    case  rightField  =  "Right  field"
    case  designatedHitter  =  "Designated  Hitter"
}


enum  DataAccessError:  Error  {
    case  datastoreConnectionError
    case  insertError
    case deleteError
    case searchError
    case  nilInData
}

protocol  DataHelper  {
    associatedtype  T
    static  func  insert(_  item:  T)  throws  ->  Int64
    static  func  delete(_  item:  T)  throws  ->  Void
    static  func  findAll()  throws  ->  [T]?
}

struct  TeamDataHelper:  DataHelper  {
    typealias  T  =  TeamData
    static  var  teamData:  [T]  =  []
    
    static  func  insert(_  item:  T)  throws  ->  Int64  {
        guard  item.teamId  !=  nil  &&  item.city  !=  nil  &&  item.nickName  !=
            nil  &&  item.abbreviation  !=  nil  else  {
                throw  DataAccessError.nilInData
        }
        teamData.append(item)
        return  item.teamId!
    }

    static  func  delete  (_  item:  T)  throws  ->  Void  {
        guard  let  id  =  item.teamId  else  {
            throw  DataAccessError.nilInData
        }
        let  teamArray  =  teamData
        for  (index,  team)  in  teamArray.enumerated()  where  team.teamId  ==  id  {
            teamData.remove(at:  index)
            return
        }
        throw  DataAccessError.deleteError
    }

    static  func  findAll()  throws  ->  [T]?  {
        return  teamData
    }

    static  func  find(_  id:  Int64)  throws  ->  T?  {
        for  team  in  teamData  where  team.teamId  ==  id  {
            
            return  team
        }
        return  nil
    }

}

struct PlayerDataHelper: DataHelper {
    typealias T = PlayerData
    static var playerData: [T] = []
    
    static func insert(_ item: T) throws -> Int64 {
        guard item.playerId != nil && item.firstName != nil && item.lastName != nil && item.teamId != nil && item.position != nil else {
            throw DataAccessError.nilInData
        }
        playerData.append(item)
        return item.playerId!
    }
    static func delete (_ item: T) throws -> Void {
        guard let id = item.playerId else {
            throw DataAccessError.deleteError
        }
        let playerArray = playerData
        for (index, player) in playerArray.enumerated() where player.playerId == id {
            playerData.remove(at: index)
        }
    }
    
    static func findAll() throws -> [T]? {
        return playerData
    }
    static func find(_ id: Int64) throws -> T? {
        for player in playerData where player.playerId == id {
            return player
        }
        return nil
    }
    
}

struct  Team  {
    var  teamId:  Int64?
    var  city:  String?
    var  nickName:String?
    var  abbreviation:String?
}

struct  Player  {
    var  playerId:  Int64?
    var  firstName:  String?
    var  lastName:  String?
    var  number:  Int?
    var  teamId:  Int64?  {
        didSet  {
            if  let  t  =  try?  TeamBridge.retrieve(teamId!)  {
                team  =  t
            }
        }
    }
    var  position:  Positions?
    var  team:  Team?
    
    init(playerId:  Int64?,  firstName:  String?,  lastName:  String?,  number: Int?,  teamId:  Int64?,  position:  Positions?)  {
        self.playerId  =  playerId
        self.firstName  =  firstName
        self.lastName  =  lastName
        self.number  =  number
        self.teamId  = teamId
        self.position  =  position
        if  let  id  =  self.teamId  {
            if  let  t  =  try?  TeamBridge.retrieve(id)  {
                team  =  t
            }
        }
    }
}

struct  TeamBridge  {
    static  func  save(_  team:  inout  Team)  throws  {
        let  teamData  =  toTeamData(team)
        let  id  =  try  TeamDataHelper.insert(teamData)
        team.teamId  =  id
    }
    static  func  delete(_  team:  Team)  throws  {
        let  teamData  =  toTeamData(team)
        try  TeamDataHelper.delete(teamData)
    }
    static  func  retrieve(_  id:  Int64)  throws  ->  Team?  {
        if  let  t  =  try  TeamDataHelper.find(id)  {
            return  toTeam(t)
        }
        return  nil
    }
    static  func  toTeamData(_  team:  Team)  ->  TeamData  {
        return TeamData(teamId: team.teamId , city: team.city, nickName: team.nickName, abbreviation: team.abbreviation)
    }
    static  func  toTeam(_  teamData:  TeamData)  ->  Team  {
        return  Team(teamId:  teamData.teamId,  city:  teamData.city, nickName:  teamData.nickName,  abbreviation: teamData.abbreviation)
    }
}

struct  PlayerBridge  {
    static  func  save(_  player:  inout  Player)  throws  {
        let  playerData  =  toPlayerData(player)
        let  id  =  try  PlayerDataHelper.insert(playerData)
        player.playerId  =  id
    }
    static  func  delete(_  player:Player)  throws  {
        let  playerData  =  toPlayerData(player)
        try  PlayerDataHelper.delete(playerData)
    }
    static  func  retrieve(_  id:  Int64)  throws  ->  Player?  {
        if  let  p  =  try  PlayerDataHelper.find(id)  {
            return  toPlayer(p)
        }
        return  nil
    }
    static  func  toPlayerData(_  player:  Player)  ->  PlayerData  {
        return  PlayerData(playerId:  player.playerId,  firstName: player.firstName,  lastName:  player.lastName, number:  player.number,  teamId:  player.teamId, position:  player.position)
    }
    static  func  toPlayer(_  playerData:  PlayerData)  ->  Player  {
        return  Player(playerId:  playerData.playerId,  firstName: playerData.firstName,  lastName:  playerData.lastName, number:  playerData.number,  teamId:  playerData.teamId, position:  playerData.position)
    }
}

var  bos  =  Team(  teamId:  0,  city:  "Boston", nickName:  "Red  Sox",  abbreviation:  "BOS")

try?  TeamBridge.save(&bos)
var  ortiz  =  Player( playerId:  0,firstName:  "David",  lastName:  "Ortiz",  number:  34, teamId:  bos.teamId,  position:  Positions.designatedHitter)

try?  PlayerBridge.save(&ortiz)

if  let  team  =  try?  TeamBridge.retrieve(0)  {
    print("---  \(team.city)")
}

if  let  player  =  try?  PlayerBridge.retrieve(0)  {
    print("----  \(player.firstName)  \(player.lastName)  plays  for \(player.team?.city)")
}
