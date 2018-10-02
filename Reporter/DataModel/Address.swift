//
//  Address.swift
//  Reporter
//
//  Created by David Bowles on 19/09/2018.
//  Copyright © 2018 David Bowles. All rights reserved.
//

import Foundation
import RealmSwift

class Address:Object {
    @objc dynamic var street:String = ""
    @objc dynamic var town:String = ""
    @objc dynamic var postcode:String = ""
    @objc dynamic var country:String = ""
     var parentClient = LinkingObjects(fromType: Client.self, property: "addresses")
}
