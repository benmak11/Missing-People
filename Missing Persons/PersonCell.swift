//
//  PersonCell.swift
//  Missing Persons
//
//  Created by Baynham Makusha on 5/7/16.
//  Copyright © 2016 Ben Makusha. All rights reserved.
//

import UIKit

class PersonCell: UICollectionViewCell {
    
    
    @IBOutlet weak var personImage: UIImageView!
    var person: Person!
    
    func getDataFromUrl(url: NSURL, completion: ((data: NSData?, response: NSURLResponse?, error: NSError?) -> Void)) {
        
        NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            
            completion(data: data, response: response, error: error)
            }.resume()
    }
    
    func downloadImage(url: NSURL) {
        
        getDataFromUrl(url) { (data, response, error) in
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                guard let data = data where error == nil else { return }
                self.personImage.image = UIImage(data: data)
                self.person.personImg = self.personImage.image
                
            }
        }
    }
    
    func configureCell(person: Person){
        self.person = person
        if let url = NSURL(string: "\(baseURL)\(person.personImageUrl!)") {
            downloadImage(url)
        }
        
    }
    
    func setSelected() {
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor.yellowColor().CGColor
        
        self.person.downloadFaceId()
    }
    
    func deSelect() {
        self.layer.borderWidth = 0
        self.layer.borderColor = nil
        
        self.person.downloadFaceId()
    }
        
    
}
