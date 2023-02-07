//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Neel Kishor Save on 06/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let buttonView: UIButton = {
        let buttonView = UIButton()
        buttonView.backgroundColor = .white
        buttonView.setTitle("Random Photo", for: .normal)
        buttonView.setTitleColor(.black, for: .normal)
        return buttonView
    }()
 
    
    let colors: [UIColor] = [
        .systemPink,
        .systemBlue,
        .systemGray,
        .systemCyan,
        .systemBrown,
        .systemOrange
        
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(imageView)
        imageView.frame = CGRect(x:0,y:0,width:300,height:300)
        imageView.center = view.center
        
        view.addSubview(buttonView)
        
        getRandomPhoto()
        buttonView.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        buttonView.frame = CGRect(x:30,y:view.frame.size.height-150-view.safeAreaInsets.bottom,width:view.frame.size.width-60,height:55)
        
    }
    
    @objc func didTapButton(){
        getRandomPhoto()
        
        view.backgroundColor = colors.randomElement()
        
    }
    
    func getRandomPhoto(){
        let urlString = "https:/source.unsplash.com/random/600x600"
        /*let url =  URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }*/
        
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
                if let data = data {
                     DispatchQueue.main.async{
                         self.imageView.image = UIImage(data: data)
                     }
                }
            }.resume()
        }
        
        
        //imageView.image = UIImage(data: data)
    }


}

