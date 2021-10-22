//
//  Cell.swift
//  Films
//
//  Created by Francis Suarez on 21/10/21.
//

import Foundation
import UIKit



class Cell {
   
    var imgFilm: UIImage
    var nameFilm: String
    var durationFilm: String
    var directorFilm: String
    var categoryFilm: String
    var sinopsisFilm: String
 

    
    
    init(imgFilm : UIImage, nameFilm: String, durationFilm: String, directorFilm: String, categoryFilm: String, sinopsisFilm: String){

    
    
    self.imgFilm = imgFilm
    self.nameFilm = nameFilm
    self.durationFilm = durationFilm
    self.directorFilm = directorFilm
    self.categoryFilm = categoryFilm
    self.sinopsisFilm = sinopsisFilm
    
    
    
    
    
    
    
   }
}
