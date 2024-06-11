//
//  USCFeedCell.swift
//  Masque
//
//  Created by Jason Zheng on 4/5/17.
//  Copyright © 2017 Jason Zheng. All rights reserved.
//

import UIKit
import SwiftyJSON
import FBSDKCoreKit

class USCFeedCell : NearMeCell {
    override func hardCodeData(){
        
        let params = ["fields": "description, end_time, name, place, start_time, id, attending_count, declined_count, cover"]
        let graphRequest = FBSDKGraphRequest(graphPath: "theQuASA/events" , parameters: params)
        _ = graphRequest?.start(completionHandler: 	{
            (connection, result, error) -> Void in
            if (error == nil){
                self.posts = [Post]()
                let json = JSON(result!)
//                print(json)
                for (index,subJson):(String, JSON) in json["data"] {
                    let post = Post()
                    post.setDescription(description: subJson["description"].stringValue)
                    post.name = subJson["name"].stringValue
                    post.statusImageName = subJson["cover"]["source"].stringValue
                    let quasaPhotoURL = "https://scontent.xx.fbcdn.net/v/t1.0-1/p50x50/17458186_1267974996648203_6951156693000357520_n.png?oh=c5dc8527932dc00d4bd10596a9c9f211&oe=59888CEB"
                    post.profileImageName = quasaPhotoURL
                    let placeName = subJson["place"]["name"]
                    let addressJson = subJson["place"]["location"]
                    let location = Location()
                    if(addressJson != JSON.null){
                        if(addressJson["street"] != JSON.null){
                            location.city = addressJson["street"].stringValue + ", " + addressJson["city"].stringValue + ", " +
                                addressJson["zip"].stringValue
                            location.state = addressJson["state"].stringValue
                        }else{
                            location.city = placeName.stringValue
                            location.state = ""
                        }
                    }else{
                        location.city = placeName.stringValue
                        location.state = ""
                    }
                    post.location = location
                    post.numLikes = subJson["attending_count"].int! as NSNumber
                    post.numComments = subJson["declined_count"].int! as NSNumber
                    post.startTime = subJson["start_time"].stringValue
                    post.endTime = subJson["end_time"].stringValue
                    
                    self.posts.append(post)
                }
                self.collectionView.alwaysBounceVertical = true
                self.collectionView.backgroundColor = UIColor(white: 0.95, alpha: 1)
                self.collectionView.register(FeedCell.self, forCellWithReuseIdentifier: self.cellId)
                self.collectionView.reloadData()
            }else{
                print(error!)
            }
        })
//        collectionView.alwaysBounceVertical = true
//        collectionView.backgroundColor = UIColor(white: 0.95, alpha: 1)
//        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: cellId)
    }

}
