//
//  DeitalViewController.swift
//  Films
//
//  Created by Francis Suarez on 21/10/21.
//

import Foundation
import UIKit


class DetailViewController : UIViewController {
    
  
//    var cell: Cell?
    let cellId = "cellId"
    var users: [Cell] = []
   
  
    
    var cell: Cell?{
      didSet{
        nameFilmFvc.text = self.cell?.nameFilm
        directorFilmFvc.text = self.cell?.directorFilm
        categoryFilmFvc.text = self.cell?.categoryFilm
        imageFilmFvc.image = self.cell?.imgFilm
        timeFilmFvc.text = self.cell?.durationFilm
        sinopsis.text = self.cell?.sinopsisFilm


          }
     }
    

    
    let labelUno: UILabel = {
    let labelun = UILabel()
        labelun.backgroundColor = .clear
        labelun.translatesAutoresizingMaskIntoConstraints = false
       
        return labelun
    }()


    let encabezado : UIButton = {
        let enca = UIButton()
        enca.layer.borderWidth = 0
        enca.setImage(#imageLiteral(resourceName: "encabezado"), for: .normal)
        enca.setTitle("Ayuda", for: .normal)
        enca.setTitleColor(.white, for: .normal)
        enca.backgroundColor = .white
        enca.layer.borderColor = UIColor.white.cgColor
        enca.imageView?.contentMode = .scaleToFill
        enca.contentMode = .center
        enca.translatesAutoresizingMaskIntoConstraints = false
  
          return enca

    }()
    
    var imageFilmFvc: UIImageView = {
     var perfilFoto = UIImageView()
     perfilFoto.clipsToBounds = true
     perfilFoto.layer.cornerRadius = 20
     perfilFoto.translatesAutoresizingMaskIntoConstraints = false
     perfilFoto.image = #imageLiteral(resourceName: "titanic")
     perfilFoto.layer.borderWidth = 5
        perfilFoto.layer.borderColor = UIColor.lightGray.cgColor
     perfilFoto.backgroundColor = .white
     perfilFoto.layer.masksToBounds = true
     perfilFoto.contentMode = UIView.ContentMode.scaleToFill
     return perfilFoto

             
    }()
     var nameFilmFvc: UILabel = {
        var label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = UIFont (name: "Futura", size: 30)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.sizeToFit()
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label

     }()
    let directorFilmFvc: UILabel = {
        var labelNombre = UILabel()
        labelNombre.text = ""
        labelNombre.textColor = .darkGray
        labelNombre.font = UIFont (name: "Futura", size: 19)
        labelNombre.textAlignment = .left
        labelNombre.numberOfLines = 0
        labelNombre.lineBreakMode = .byWordWrapping
        labelNombre.translatesAutoresizingMaskIntoConstraints = false
        return labelNombre
           
    }()
    let categoryFilmFvc: UILabel = {
        var label = UILabel()
        label.text = ""
        label.textColor = .darkGray
        label.font = UIFont (name: "Futura", size: 19)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
           
    }()
      let timeFilmFvc: UILabel = {
      var label = UILabel()
      label.text = ""
      label.textColor = .darkGray
      label.font = UIFont (name: "Futura", size: 19)
      label.textAlignment = .left
      label.numberOfLines = 0
      label.lineBreakMode = .byWordWrapping
      label.translatesAutoresizingMaskIntoConstraints = false
       return label
    
   }()
    
    let line: UILabel = {
    let label = UILabel()
        label.backgroundColor = .darkGray
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    
    }()
   
    
    let lineDos: UILabel = {
    let label = UILabel()
        label.backgroundColor = .darkGray
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    
    }()
 

      let sinopsis: UILabel = {
      var label = UILabel()
      label.text = "Aqui va la sinopsis"
      label.textColor = .black
      label.backgroundColor = .clear
      label.sizeToFit()
      label.textAlignment = .center
      label.clipsToBounds = true
//        label.layer.cornerRadius = 10
      label.font = UIFont (name: "Futura", size: 16)
      label.textAlignment = .left
      label.numberOfLines = 20
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    
      }()
   
    let lineTres: UILabel = {
    let label = UILabel()
        label.backgroundColor = .darkGray
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    
    }()
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.backgroundColor = .white
    
//        //        fondo con imagen:
//              let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
//              backgroundImage.image = UIImage(named: "fondo")
//              backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
//              self.view.insertSubview(backgroundImage, at: 0)
        
//        backButton:
        let button = UIButton(frame: CGRect(x: 25.0, y: 25, width: 35, height: 35))
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 6
//        button.layer.cornerRadius = 22.5
//          button.setTitle("⇦", for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "back"), for: .normal)
        button.addTarget(self, action: #selector(handleView), for: .touchUpInside)
        self.encabezado.addSubview(button)
    
        
 //    CONTRAINTS ------------------------------------------------------------------------------------------


         view.addSubview(encabezado)
         encabezado.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
         encabezado.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 20).isActive = true
         encabezado.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -10).isActive =  true
         encabezado.heightAnchor.constraint(equalToConstant: 140).isActive = true
         let screenencabe = view.frame.width
         let screenencabeDos = view.frame.height
      
    //     iphone 8 plus     (414x736)
        if screenencabe > 410 && screenencabeDos == 736 {
         encabezado.heightAnchor.constraint(equalToConstant: 140).isActive = true
        
        }
        
        view.addSubview(nameFilmFvc)
       nameFilmFvc.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20.0).isActive = true
       nameFilmFvc.topAnchor.constraint(equalTo: encabezado.bottomAnchor, constant: -40).isActive = true
        nameFilmFvc.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true

        let screenenTra = view.frame.width
        let screenenTraDos = view.frame.height
   
   //     iphone 8 plus     (414x736)
       if screenenTra > 410 && screenenTraDos == 736 {
           nameFilmFvc.font = UIFont(name: "Futura", size: 18)
       
       }
         

        view.addSubview(imageFilmFvc)

        imageFilmFvc.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20.0).isActive = true
        imageFilmFvc.topAnchor.constraint(equalTo: nameFilmFvc.bottomAnchor, constant: 20).isActive = true
        imageFilmFvc.widthAnchor.constraint(equalToConstant: 170 ).isActive = true
        imageFilmFvc.heightAnchor.constraint(equalToConstant: 190 ).isActive = true
        
        let screenPj = view.frame.width
        let screenpja = view.frame.height
            
   //     iphone 8 plus     (414x736)
       if screenPj > 410 && screenpja == 736 {
        imageFilmFvc.widthAnchor.constraint(equalToConstant: 100 ).isActive = true
        imageFilmFvc.heightAnchor.constraint(equalToConstant: 100 ).isActive = true
        imageFilmFvc.layer.cornerRadius = 20

       }
         
  
         
         view.addSubview(directorFilmFvc)
        directorFilmFvc.topAnchor.constraint(equalTo: nameFilmFvc.bottomAnchor, constant: 50).isActive = true
        directorFilmFvc.leftAnchor.constraint(equalTo: imageFilmFvc.rightAnchor, constant: 20.0).isActive = true
    
         let screenenPro = view.frame.width
         let screenenProDos = view.frame.height
      
    //     iphone 8 plus     (414x736)
        if screenenPro > 410 && screenenProDos == 736 {
            directorFilmFvc.font = UIFont(name: "Futura", size: 15)
            directorFilmFvc.topAnchor.constraint(equalTo: nameFilmFvc.bottomAnchor, constant: 5.0).isActive = true
        
        }
         
         view.addSubview(categoryFilmFvc)
        categoryFilmFvc.topAnchor.constraint(equalTo: directorFilmFvc.bottomAnchor, constant: 15).isActive = true
        categoryFilmFvc.leftAnchor.constraint(equalTo: imageFilmFvc.rightAnchor, constant: 20.0).isActive = true
        
         let screenenCiu = view.frame.width
         let screenenCiuDos = view.frame.height
     
    //     iphone 8 plus     (414x736)
        if screenenCiu > 410 && screenenCiuDos == 736 {
            categoryFilmFvc.font = UIFont(name: "Futura", size: 15)
            categoryFilmFvc.topAnchor.constraint(equalTo: directorFilmFvc.bottomAnchor, constant: 5.0).isActive = true
        
        }
         
         view.addSubview(timeFilmFvc)
        timeFilmFvc.leftAnchor.constraint(equalTo: imageFilmFvc.rightAnchor, constant: 20.0).isActive = true
        timeFilmFvc.topAnchor.constraint(equalTo: categoryFilmFvc.bottomAnchor, constant: 15).isActive = true
         
         let screenenEmp = view.frame.width
         let screenenEmpDos = view.frame.height
     
    //     iphone 8 plus     (414x736)
        if screenenEmp > 410 && screenenEmpDos == 736 {
            timeFilmFvc.font = UIFont(name: "Futura", size: 15)
            timeFilmFvc.topAnchor.constraint(equalTo: categoryFilmFvc.bottomAnchor, constant: 5.0).isActive = true
        
        }
         
         
         view.addSubview(line)
         line.topAnchor.constraint(equalTo: imageFilmFvc.bottomAnchor, constant: 10.0).isActive = true
         line.heightAnchor.constraint(equalToConstant: 1).isActive = true
         line.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
         line.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
             let screenLinee = view.frame.width
             let screenLineeOne = view.frame.height

 //        390x844 iphone12
         if screenLinee == 390 && screenLineeOne == 844{
             line.topAnchor.constraint(equalTo: imageFilmFvc.bottomAnchor, constant: 5.0).isActive = true
             line.heightAnchor.constraint(equalToConstant: 1).isActive = true
             line.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
             line.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true

         }
         
         view.addSubview(sinopsis)
        sinopsis.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 15.0).isActive = true
        sinopsis.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        sinopsis.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
         
         let screenDescri = view.frame.width
         let screenDescriDos = view.frame.height
    
     //     iphone 8 plus     (414x736)
         if screenDescri > 410 && screenDescriDos == 736 {
            sinopsis.font = UIFont(name: "Futura", size: 14)
            sinopsis.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 10).isActive = true
         }
        
         if screenDescri == 390 && screenDescriDos == 844 {
            sinopsis.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
            sinopsis.font = UIFont (name: "Futura", size: 15)
         }
         
         if screenDescri == 375 && screenDescriDos == 812{
            sinopsis.font = UIFont (name: "Futura", size: 14)
             
         }
         
         view.addSubview(lineDos)
         lineDos.topAnchor.constraint(equalTo: sinopsis.bottomAnchor, constant: 20.0).isActive = true
         lineDos.heightAnchor.constraint(equalToConstant: 1).isActive = true
         lineDos.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
         lineDos.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
         
         let screenLineDos = view.frame.width
         let screenLineDose = view.frame.height
  
     //     iphone 8 plus     (414x736)
         if screenLineDos > 410 && screenLineDose == 736 {
             lineDos.topAnchor.constraint(equalTo: sinopsis.bottomAnchor, constant: 10.0).isActive = true
         }
         
         if screenLineDos == 390 && screenLineDose == 844 {
             lineDos.topAnchor.constraint(equalTo: sinopsis.bottomAnchor, constant: 10.0).isActive = true
             lineDos.heightAnchor.constraint(equalToConstant: 1).isActive = true
             lineDos.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
             lineDos.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
         }

    
    
    
    
    }
 
@objc func handleView() {
          dismiss(animated: true, completion: nil)

    
    
    }
    
    
    
    
}
