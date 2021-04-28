//
//  diary.swift
//  original
//
//  Created by AIKA MATSUI on 2021/03/29.
//

import Foundation
import RealmSwift

class diary: Object {
    @objc dynamic var date: String = ""
    @objc dynamic var feeling: Int = 0
    @objc dynamic var contents: String = ""

}
