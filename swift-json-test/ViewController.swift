//
//  ViewController.swift/Users/zhaonanli/Documents
//  swift-json-test
//
//  Created by Zhaonan Li on 11/2/16.
//  Copyright © 2016 Zhaonan Li. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let str: String = "[{\"fruit\": \"apple\", \"colors\": [\"green\", \"yellow\", \"red\"]}, {\"fruit\": \"banana\", \"colors\": [\"green\"]}]"
        let json: JSON = JSON(data: str.data(using: .utf8)!)
        
        if json == nil {
            print ("There is the error, when parsing the json string.")
        } else {
            print ("There is no error, when parsing the json string.")
            print (json)
        }
        
        let firstFruit = json[0]["fruit"]
        let firstFruitColors = json[0]["colors"]
        print ("The fruit = \(firstFruit)")
        print ("The color = \(firstFruitColors)")
        
        if json[0]["hello"].exists() {
            print ("The key = hello exists")
        } else {
            print ("The key = hello does not exists")
        }
        
        if json[0]["fruit"].exists() {
            print ("The key = fruit exists")
        } else {
            print ("The key = fruit does not exists")
        }
        
        
        if let secondFruitFirstColor = json[1]["colors"][0].string {
            print ("The first fruit's first color is \(secondFruitFirstColor)")
        } else {
            print ("There is no first color for the second fruit, error:\(json["colors"][2])")
        }
        
        if let secondFruitFifthColor = json[1]["colors"][4].string {
            print ("The fifth color for the second fruit = \(secondFruitFifthColor)")
        } else {
            print ("There is no fifth color for the second fruit, error:\(json[1]["colors"][4])")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

