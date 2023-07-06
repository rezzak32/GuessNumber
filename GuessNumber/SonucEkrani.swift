//
//  SonucEkrani.swift
//  GuessNumber
//
//  Created by Rezzak on 6.07.2023.
//

import UIKit

class SonucEkrani: UIViewController {
    
    @IBOutlet weak var imageResult: UIImageView!
    @IBOutlet weak var labelResult: UILabel!
    
    var result:Bool?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "Sonuç"
        
        
        print(result!)
        
        if result == true {
            labelResult.text = "You Won!"
            imageResult.image = UIImage(named: "mutlu_resim")
        } else {
            labelResult.text = "You Lost"
            imageResult.image = UIImage(named: "uzgun_resim")
        }
    }
    
    @IBAction func playAgain(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)    }
    


}
