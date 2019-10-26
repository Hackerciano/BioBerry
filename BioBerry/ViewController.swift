//
//  ViewController.swift
//  BioBerry
//
//  Created by Diego Graciano on 25/10/19.
//  Copyright © 2019 Diego Graciano. All rights reserved.
//

import UIKit
import Cards

struct Feeds: Decodable {
    let feeds: [Feed]?
}

struct Feed: Decodable {
    let creation: String?
    let entryId: Int?
    let field1: String?
    let field2: String?
    let field3: String?
    let field4: String?
}

class ViewController: UIViewController {
    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var tempLabel: UILabel!
    var temp: String = ""
    var hum: String = ""
    var press: String = ""
    public var response: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.background.layer.backgroundColor = UIColor.systemBackground.cgColor
        
        let jsonUrlString =  "https://api.thingspeak.com/channels/895281/feeds.json?api_key=RIXNO1S0FISMWAP2&results=1"
        
        guard let url = URL(string: jsonUrlString) else
            { return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }

//            let dataAsString = String(data: data, encoding: .utf8)
//            print(dataAsString)
            
            
            do {
                let course = try JSONDecoder().decode(Feeds.self, from: data)
                self.temp = course.feeds![0].field2!
                self.hum = course.feeds![0].field3!
                self.press = course.feeds![0].field4!
            } catch let jsonErr {
                print("Error serializing json: ", jsonErr)
            }
            
            self.writeToLabels()
        }.resume()
        
        // FINISHES VIEW DID LOAD
        
        
    }

    func writeToLabels() {
        
        
        print("Temperature : \(self.temp)")
        print("Humidity : \(self.hum)")
        print("Pressure : \(self.press)")
        //self.tempLabel.text = self.temp
        
    }

}

