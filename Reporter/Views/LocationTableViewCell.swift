//
//  LocationTableViewCell.swift
//  Reporter
//
//  Created by David Bowles on 22/09/2018.
//  Copyright © 2018 David Bowles. All rights reserved.
//

import Foundation
import UIKit

class CustomLocationTableViewCell: UITableViewCell {
    var street : String?
    var town : String?
    var postcode : String?
    var country : String?
    
    var streetView :UITextView = {
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.font = UIFont(name:"Avenir", size:22)
        return textView
        
    }()
    
    var townView :UITextView = {
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.font = UIFont(name:"Avenir", size:22)
        return textView
        
    }()
    
    var postcodeView :UITextView = {
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.font = UIFont(name:"Avenir", size:22)
        return textView
    
    }()
    
    var countryView :UITextView = {
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.font = UIFont(name:"Avenir", size:22)
        return textView
    
    }()
    
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(streetView)
        self.addSubview(townView)
        self.addSubview(postcodeView)
        self.addSubview(countryView)
        
        streetView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        streetView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        streetView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        streetView.bottomAnchor.constraint(equalTo: townView.topAnchor).isActive = true
        
        townView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        townView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        townView.topAnchor.constraint(equalTo: streetView.bottomAnchor).isActive = true
        townView.bottomAnchor.constraint(equalTo: postcodeView.topAnchor).isActive = true
        
        postcodeView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        postcodeView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        postcodeView.topAnchor.constraint(equalTo: townView.bottomAnchor).isActive = true
        postcodeView.bottomAnchor.constraint(equalTo: countryView.topAnchor).isActive = true
        
        countryView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        countryView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        countryView.topAnchor.constraint(equalTo: postcodeView.bottomAnchor).isActive = true
        countryView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
    
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let street = street {
            streetView.text = street
        }
        
        if let town = town {
            townView.text = town
        }
        
        if let postcode = postcode {
            postcodeView.text = postcode
        }
        if let country = country {
            countryView.text = country
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
