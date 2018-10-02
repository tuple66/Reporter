//
//  Data Model.swift
//  Reporter
//
//  Created by David Bowles on 12/09/2018.
//  Copyright © 2018 David Bowles. All rights reserved.
//

import Foundation
import RealmSwift

class Client:Object{
    
   @objc dynamic var name: String = ""
    let addresses = List<Address>()
    
}
