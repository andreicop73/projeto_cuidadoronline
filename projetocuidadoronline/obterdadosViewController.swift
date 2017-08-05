//
//  obterdadosViewController.swift
//  projetocuidadoronline
//
//  Created by mac ssd on 04/08/17.
//  Copyright © 2017 mac ssd. All rights reserved.
//

import Foundation
import UIKit

class obterdadosViewController: UIViewController {
    
     var myuser:Usuarios?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func telalista(_ sender: Any) {
        
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let identifier = segue.identifier{
                switch identifier {
                case "listatable":
                    let dest = segue.destination as! listaUsuarioTableViewController
                    dest.myuser = myuser
                    
                default:
                    break;
                }
                
            }
            
        }

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


