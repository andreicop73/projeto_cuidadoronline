//
//  RecuperaViewController.swift
//  projetocuidadoronline
//
//  Created by mac ssd on 31/07/17.
//  Copyright © 2017 mac ssd. All rights reserved.
//



import UIKit
import CoreData

class RecuperaViewController: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    
    var gerenciarObjetos: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //configurando o core data
        
      //  let appDelegate = UIApplication.shared.delegate as! AppDelegate
      //  _ = appDelegate.persistentContainer.viewContext
        
        //como  abrir o teclado
        
      //  self.emailText.becomeFirstResponder()
        
        
       // let requisitar  = NSFetchRequest<NSFetchRequestResult>(entityName: "Recuperar")
        
       // do {
            
         //   let recuperar = trconnectxt.fetch(recuperar)

           // if recuperar.count > 0{
                
           //     for recuperado in recuperar {
           //         let emailusuario = recuperar.value(value(forKey: "email")
                    
           //         if emailusuario != "emailText" {
                        
           //             print("E-mail não cadastrado")
             //        }
               //     }
        //        }
       // }
        
    }
   // @IBAction func enviaremail(_ sender: Any) {
   // }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

