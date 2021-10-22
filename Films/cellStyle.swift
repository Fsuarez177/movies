//
//  cellStyle.swift
//  Films
//
//  Created by Francis Suarez on 21/10/21.
//

import Foundation
import UIKit



class CellStyle: UITableViewCell {
    
    var link : TableViewController?
    
    var cell: [Cell] = []
    var favListArray:NSMutableArray = []
    var tableView: UITableView!
    
    var celda: Cell?{
       didSet{
  
        imageFilm.image = celda?.imgFilm
        labelTittle.text = celda?.nameFilm
        labelDirector.text = celda?.directorFilm
        labelCategory.text = celda?.categoryFilm
        labelTime.text = celda?.durationFilm

        
        }
    }
    
    
    let labelTittle: UILabel = {
           
           let label = UILabel()
                label.text = "Titanic"
                label.textColor = .black
                label.font = UIFont (name: "Futura", size: 18)
                
                label.translatesAutoresizingMaskIntoConstraints = false
                return label

}()
  let labelDirector: UILabel = {
               
               let label = UILabel()
               label.text = "Alfred Hitchcock, 1970"
                label.textColor = .darkGray
               label.font = UIFont (name: "Futura", size: 17)
               label.translatesAutoresizingMaskIntoConstraints = false
 
               return label
  }()
  let labelCategory: UILabel = {
         
         let label = UILabel()
         label.text = "Suspense"
    label.textColor = .darkGray
         label.font = UIFont (name: "Futura", size: 17)
         label.translatesAutoresizingMaskIntoConstraints = false

         return label

}()


    let labelTime: UILabel = {
           
           let label = UILabel()
           label.text = "120 seconds"
        label.textColor = .darkGray
           label.font = UIFont (name: "Futura", size: 17)
           label.translatesAutoresizingMaskIntoConstraints = false

           return label

}()
let imageFilm: UIImageView = {

        let imageView = UIImageView()
        imageView.clipsToBounds = true
//        imageView.layer.cornerRadius = 30
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
       
        imageView.contentMode = .scaleAspectFit

        return imageView
  

    }()
    
    let buttonStar: UIButton = {
        let buttonSt = UIButton(type: .system)
        buttonSt.setImage(#imageLiteral(resourceName: "star.png"), for: .normal)
        buttonSt.tintColor = .systemOrange
//        buttonSt.addTarget(self, action: #selector(marcadoFavorito), for: .touchUpInside)
//            buttonStar.frame = CGRect(x: 100, y: 100 , width: 50, height: 50)
        buttonSt.translatesAutoresizingMaskIntoConstraints = false
        
    
    return buttonSt
}()
    
    
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init (style: style, reuseIdentifier: reuseIdentifier)
    
    
    
    
    self.addSubview(imageFilm)
    imageFilm.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
    imageFilm.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
    imageFilm.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15) .isActive = true
    imageFilm.widthAnchor.constraint(equalToConstant: 100) .isActive = true
    imageFilm.heightAnchor.constraint(equalToConstant: 100) .isActive = true
      
    self.addSubview(labelTittle)
    
    labelTittle.leftAnchor.constraint(equalTo: imageFilm.rightAnchor, constant: 22).isActive = true
    labelTittle.heightAnchor.constraint(equalToConstant:20).isActive = true
    labelTittle.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -22).isActive = true

//let screenply = contentView.frame.width
//if screenply <= 380 {
//    labelTittle.font = UIFont (name: "Futura", size: 12)
//   }



    self.addSubview(labelDirector)
    
    labelDirector.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
    labelDirector.heightAnchor.constraint(equalToConstant: 20).isActive = true
    labelDirector.leftAnchor.constraint(equalTo: imageFilm.rightAnchor, constant: 22).isActive = true
    labelDirector.topAnchor.constraint(equalTo: labelTittle.bottomAnchor, constant: 2).isActive = true
//    let screenTeam = contentView.frame.width
//    if screenTeam <= 380 {
//        labelDirector.font = UIFont (name: "Futura", size: 11.5)
//         }

    
        self.addSubview(labelCategory)
    
    labelCategory.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
    labelCategory.heightAnchor.constraint(equalToConstant: 20).isActive = true
    labelCategory.leftAnchor.constraint(equalTo: imageFilm.rightAnchor, constant: 22).isActive = true
    labelCategory.topAnchor.constraint(equalTo: labelDirector.bottomAnchor, constant: 2).isActive = true
//    let screenTeamm = contentView.frame.width
//    if screenTeamm <= 380 {
//        labelCategory.font = UIFont (name: "Futura", size: 11.5)
//         }

//     self.addSubview(labelTime)
    
    self.addSubview(buttonStar)
    buttonStar.heightAnchor.constraint(equalToConstant: 40).isActive = true
    buttonStar.widthAnchor.constraint(equalToConstant: 40).isActive = true
    buttonStar.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive = true
    buttonStar.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    
    

  }
  
  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
      
      // para celdas personalizadas siempre hacen falta estos dos metodos.
 }
  
}
