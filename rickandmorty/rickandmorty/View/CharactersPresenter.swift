//
//  CharactersPresenter.swift
//  rickandmorty
//
//  Created by Kell Lanes on 29/08/21.
//

import Foundation
import UIKit


class CharacterPresenter {
    
    class func LabelStyle(textColor: UIColor,
                          fontSize: CGFloat,
                          weight: UIFont.Weight = .regular,
                          to labels: UILabel?...) {
        labels.forEach {
            label in label?.textColor = textColor
            label?.font = .systemFont(ofSize: fontSize, weight: weight)
        }
    }
    
    class func ConvertImageUrl(urlImage:String, imageView: UIImageView) {
        if let url = URL(string: urlImage) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async {
                    imageView.image = UIImage(data: data)
                }
            }
            task.resume()
            
        }
    }
    
    class func StatusColor(status: String, label: UILabel){
        switch status  {
        case "Alive":
            label.textColor = .statusAlive
        case "Dead":
            label.textColor = .statusDead
        case "unknown":
            label.textColor = .statusUnknown
        default:
            label.textColor = .lightColor
        }
    }
}

