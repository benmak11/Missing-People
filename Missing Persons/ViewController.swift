//
//  ViewController.swift
//  Missing Persons
//
//  Created by Baynham Makusha on 5/7/16.
//  Copyright © 2016 Ben Makusha. All rights reserved.
//

import UIKit
import ProjectOxfordFace

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var selectedImg: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let imagePicker = UIImagePickerController()
    let baseURL = "http://localhost:6069/img/"
    let missingPeople = [
        "person1.jpg",
        "person2.jpg",
        "person3.jpg",
        "person4.jpg",
        "person5.jpg",
        "person6.png"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        imagePicker.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(loadPicker(_:)))
        tap.numberOfTapsRequired = 1
        selectedImg.addGestureRecognizer(tap)
    }

    @IBAction func checkForMatch(sender: AnyObject) {
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return missingPeople.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PersonCell", forIndexPath: indexPath) as! PersonCell
        
        let url = "\(baseURL)\(missingPeople[indexPath.row])"
        cell.configureCell(url)
        return cell
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            selectedImg.image = pickedImage
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func loadPicker(gesture: UITapGestureRecognizer) {
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }

}

