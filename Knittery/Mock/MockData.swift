//
//  MockData.swift
//  Knittery
//
//  Created by Cecilia Valenti on 2021-02-23.
//  Copyright © 2021 Cecilia Valenti. All rights reserved.
//

import Foundation

public struct MockData {
    
    static let smallPhoto = Photo(smallURL: "https://images4-f.ravelrycache.com/uploads/bhookedcrochet/438910714/Shell_Stitch_Crochet_Wrist_Warmers_small_best_fit.jpg",
                                  squareURL: "",
                                  thumbnailURL: "",
                                  mediumURL: "",
                                  id: 65508764)
    static let author = PatternAuthor(id: 63641,
                                      name: "B.hooked Crochet")
    static let pattern = Pattern(id: 246106044,
                                 name: "A mock pattern",
                                 attributes: nil,
                                 firstPhoto: MockData.smallPhoto,
                                 patternAuthor: MockData.author,
                                 photos: nil,
                                 notes: nil,
                                 yarnWeight: YarnWeight(name: "Worsted", wpi: "9"))
    
    static let patternList: [Pattern] = [
        MockData.pattern,
        Pattern(id: 466192,
                name: "Riptide Slouch Hat",
                attributes: nil,
                firstPhoto: Photo(smallURL: "https://images4-f.ravelrycache.com/uploads/Meladora/210279839/Riptide_Slouch_Hat_Browns_Display_pic_small.jpg",
                                  squareURL: "",
                                  thumbnailURL: "",
                                  mediumURL: "",
                                  id: 37577586),
                patternAuthor: PatternAuthor(id: 54114,
                                             name: "Meladoras Creations"),
                photos: nil,
                notes: "Some notes",
                yarnWeight: YarnWeight(name: "Worsted", wpi: "9")),
                Pattern(id: 782703,
                        name: "The Easy Poncho",
                attributes: nil,
                firstPhoto: Photo(smallURL:  "https://avatars-d.ravelrycache.com/ReVeDesignCo/744770848/ReVe_Design_Co_Logo_Big_Square3_-_with_GAL_tag_small.jpg",
                                  squareURL: "",
                                  thumbnailURL: "",
                                  mediumURL: "",
                                  id: 4309394),
                patternAuthor: PatternAuthor(id: 73437,
                                             name: "Fiona Langtry"),
                photos: nil,
                notes: "Notes notes",
                yarnWeight: YarnWeight(name: "Worsted", wpi: "9"))
    ]
}
