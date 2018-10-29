//
//  ViewController.swift
//  UrlSessionExample
//
//  Created by Miguel Mexicano Herrera on 10/29/18.
//  Copyright © 2018 Miguel Mexicano Herrera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var request : URLRequest!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = "https://api.bitso.com/v3/ticker/?book=eth_mxn"
        self.generateRequest(url: url)
    }
    
    
    func generateRequest(url: String){
        guard let endpointUrl = URL(string: url) else {
            return
        }
        
        request = URLRequest(url: endpointUrl)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
      
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            do {
                let result = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:AnyObject]
                
                print("Result",result!)
                
            } catch {
                print("Error -> \(error)")
            }
        }
        
        
        task.resume()
        
        
        
    }


}

