//
//  Cad5ViewController.swift
//  projetocuidadoronline
//
//  Created by mac ssd on 01/08/17.
//  Copyright © 2017 mac ssd. All rights reserved.
//

import Foundation

import UIKit
import CoreData

class Cad5ViewController: UIViewController {
    
    
  
    
    @IBOutlet weak var senhaTextview: UITextField!
    
    var gerenciarObjetos: NSManagedObjectContext!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //configurando o core data
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        _ = appDelegate.persistentContainer.viewContext
        
        //como  abrir o teclado
        
        self.senhaTextview.becomeFirstResponder()
        
        
    }
    
    @IBAction func senhaTela5(_ sender: Any) {
    
        self.salvarSenha()
    }
    
    
    func salvarSenha(){
        
        let senhausuario = NSEntityDescription.insertNewObject(forEntityName: "Üsuario", into: gerenciarObjetos)
        
        senhausuario.setValue(self.senhaTextview,forKey: "numeroContato")
        do{
            if senhaTextview != nil{
                try gerenciarObjetos.save()
                print("Sucesso ao Salvar parentesco")
            }
        }catch let erro as NSError{
            print("ërro ao salvar parentesco " + erro.description)
        }
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
