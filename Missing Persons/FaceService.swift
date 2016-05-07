//
//  FaceService.swift
//  Missing Persons
//
//  Created by Baynham Makusha on 5/7/16.
//  Copyright © 2016 Ben Makusha. All rights reserved.
//

import Foundation
import ProjectOxfordFace

class FaceService {
    
    static let instance = FaceService()
    
    let client = MPOFaceServiceClient(subscriptionKey: "492e375dcab14e56ab5a84316390a2aa")
}
