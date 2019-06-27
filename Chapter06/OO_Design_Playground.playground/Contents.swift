import Cocoa

enum  TerrainType {
    case  land
    case  sea
    case  air
}

class  Vehicle  {
    fileprivate  var  vehicleTypes  =  [TerrainType]()
    fileprivate  var  vehicleAttackTypes  =  [TerrainType]()
    fileprivate  var  vehicleMovementTypes  =  [TerrainType]()
    fileprivate  var  landAttackRange  =  -1
    fileprivate var seaAttackRange = -1
    fileprivate var airAttackRange = -1
    fileprivate  var  hitPoints  =  0
    
    func  isVehicleType(type:  TerrainType)  ->  Bool  {
        return  vehicleTypes.contains(type)
    }
    func  canVehicleAttack(type:  TerrainType)  ->  Bool  {
        return  vehicleAttackTypes.contains(type)
    }
    func  canVehicleMove(type:  TerrainType)  ->  Bool  {
        return  vehicleMovementTypes.contains(type)
    }
    func  doLandAttack()  {}
    func  doLandMovement()  {}
    
    func  doSeaAttack()  {}
    func  doSeaMovement()  {}
    
    func  doAirAttack()  {}
    func  doAirMovement()  {}
    
    func  takeHit(amount:  Int)  {  hitPoints  -=  amount  }
    func  hitPointsRemaining()  ->Int  {  return  hitPoints  }
    func  isAlive()  ->  Bool  {  return  hitPoints  >  0  ?  true  :  false  }

}

class  Tank:  Vehicle  {
    override  init()  {
        super.init()
        vehicleTypes  =  [.land]
        
        vehicleAttackTypes  =  [.land]
        vehicleMovementTypes  =  [.land]
        landAttackRange  =  5
        hitPoints  =  68
    }
    
    override  func  doLandAttack()  {
        
        print("Tank  Attack")
    }
    override  func  doLandMovement()  {
        print("Tank  Move")
    }
}

class  Amphibious:  Vehicle  {
    override  init()  {
        super.init()
        vehicleTypes  =  [.land,  .sea]
        vehicleAttackTypes  =  [.land,  .sea]
        vehicleMovementTypes  =  [.land,  .sea]
        
        landAttackRange  =  1
        seaAttackRange  =  1
        
        hitPoints  =  25
    }
    override  func  doLandAttack()  {
        print("Amphibious  Land  Attack")
        
        
    }
    override  func  doLandMovement()  {
        print("Amphibious  Land  Move")
    }
    override  func  doSeaAttack()  {
        print("Amphibious  Sea  Attack")
    }
    override  func  doSeaMovement()  {
        print("Amphibious  Sea  Move")
    }
}

class  Transformer:  Vehicle  {
    override  init()  {
        super.init()
        vehicleTypes  =  [.land,  .sea,  .air]
        vehicleAttackTypes  =  [.land,  .sea,  .air]
        vehicleMovementTypes  =  [.land,  .sea,  .air]
        
        landAttackRange = 7
        seaAttackRange = 10
        airAttackRange  =  12
        
        hitPoints  =  75
    }
    
    override  func  doLandAttack()  {
        print("Transformer  Land  Attack")
    }
    override  func  doLandMovement()  {
        print("Transformer  Land  Move")
    }
    
    override  func  doSeaAttack()  {
        print("Transformer  Sea  Attack")
    }
    override  func  doSeaMovement()  {
        print("Transformer  Sea  Move")
    }
    
    override  func  doAirAttack()  {
        print("Transformer  Air  Attack")
    }
    override  func  doAirMovement()  {
        print("Transformer  Air  Move")
    }
}

var  vehicles  =  [Vehicle]()

var vh1 = Amphibious()
var vh2 = Amphibious()
var  vh3  =  Tank()
var  vh4  =  Transformer()

vehicles.append(vh1)
vehicles.append(vh2)
vehicles.append(vh3)
vehicles.append(vh4)

for  (index,  vehicle)  in  vehicles.enumerated()  {
    if  vehicle.isVehicleType(type:  .air)  {
        print("Vehicle  at  \(index)  is  Air")
        if  vehicle.canVehicleAttack(type:  .air)  {
            vehicle.doAirAttack()
        }
        
        if  vehicle.canVehicleMove(type:  .air)  {
            vehicle.doAirMovement()
        }
    }
    
    if  vehicle.isVehicleType(type:  .land){
        print("Vehicle  at  \(index)  is  Land")
        
        if  vehicle.canVehicleAttack(type:  .land)  {
            vehicle.doLandAttack()
        }
        if  vehicle.canVehicleMove(type:  .land)  {
            vehicle.doLandMovement()
        }
    }
    if  vehicle.isVehicleType(type:  .sea)  {
        print("Vehicle  at  \(index)  is  Sea")
        if  vehicle.canVehicleAttack(type:  .sea)  {
            vehicle.doSeaAttack()
        }
        if  vehicle.canVehicleMove(type:  .sea)  {
            vehicle.doSeaMovement()
        }
    }
}


for  (index,  vehicle)in  vehicles.enumerated()  where vehicle.isVehicleType(type:  .air)  {
    if  vehicle.isVehicleType(type:  .air)  {
        print("**Vehicle  at  \(index)  is  Air")
        if  vehicle.canVehicleAttack(type:  .air)  {
            vehicle.doAirAttack()
        }
        
        if  vehicle.canVehicleMove(type:  .air)  {
            vehicle.doAirMovement()
        }
    }
}
