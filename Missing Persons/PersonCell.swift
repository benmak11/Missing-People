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
            }
        }
    }
    
    func configureCell(imgUrl: String){
        
        if let url = NSURL(string: imgUrl) {
            downloadImage(NSURL(string: imgUrl)!)
        }
        
    }
        
    
}
