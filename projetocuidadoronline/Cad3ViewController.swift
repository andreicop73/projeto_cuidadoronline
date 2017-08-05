//
//  Cad3ViewController.swift
//  projetocuidadoronline
//
//  Created by mac ssd on 30/07/17.
//  Copyright © 2017 mac ssd. All rights reserved.
//

import Foundation

import UIKit
import CoreData

class Cad3ViewController: UIViewController {
   
    @IBOutlet weak var senhaText: UITextField!
    
    var myuser: Usuarios?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        self.senhaText.becomeFirstResponder()
        
        
    }
    @IBAction func salvarDados(_ sender: Any) {
    
    
            self.salvar()
            // retorna para tela inicial
         performSegue(withIdentifier: "listarUsuarios", sender: nil)
        
            _ = self.navigationController?.popToRootViewController(animated: true)
        }
        
        
        func salvar(){
            
            myuser?.senha = self.senhaText.text
            
            
            if senhaText.text != "" {
                
                do{
                    
                
                     try (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext.save()
                     print("Sucesso ao Salvar nome") // FIXME: - IMPLEMENTAR UIAlertController
                
                  }catch let erro as NSError{
                      fatalError("Erro ao salvar Nome \(erro)")
                }
            }else {
    
                print("Nome em Branco") // FIXME: - IMPLEMENTAR UIAlertController
    }


    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier{
            switch identifier {
            case "listarUsuarios":
                let dest = segue.destination as! obterdadosViewController
                dest.myuser = myuser
                
            default:
                break;
            }
            
        }

    }
    
}
        
    
    
    

