//
//  Model.swift
//  BioBerry
//
//  Created by Diego Graciano on 26/10/19.
//  Copyright © 2019 Diego Graciano. All rights reserved.
//

import Foundation


public struct SensorResponse: Codable {
    
    public let id: Int
    public let name: String
    public let description: String
    public let latitude: String
    public let longitude: String
    public let field1: String
    public let field2: String
    public let field3: String
    public let field4: String
    public let creation: String
    public let updated: String
    public let lastEntry: String
    public let feeds: [feed]
}
public struct feed: Codable {
    
    public let creationDate: String
    public let entryId: Int
    public let light: String
    public let temp: String
    public let hum: String
    public let press: String
}
