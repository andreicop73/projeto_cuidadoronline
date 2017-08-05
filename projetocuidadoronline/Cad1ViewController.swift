//
//  Cad1ViewController.swift
//  projetocuidadoronline
//
//  Created by mac ssd on 30/07/17.
//  Copyright © 2017 mac ssd. All rights reserved.
//

//import Foundation
import UIKit
import CoreData


class Cad1ViewController: UIViewController {
    
    
    @IBOutlet weak var nome: UITextField!
    
    @IBOutlet weak var emailtext: UITextField!
    //var gerenciarObjetos: NSManagedObjectContext!
    
    var myuser:Usuarios?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        let contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        myuser = Usuarios(context: contexto)
        //como  abrir o teclado
        
        //self.nome.becomeFirstResponder()
        
    }
    
    @IBAction func proxTela2(_ sender: Any) {
        
       salvarNome()
        
    }
    
    func salvarNome()  {
        //var novonome:Usuarios
        
     // novonome = NSEntityDescription.insertNewObject(forEntityName: "Usuarios", into: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext) as! Usuarios
        
        //novonome.setValue(self.nome.text, forKey: "nomeUsuario")
        //novonome.setValue(self.emailtext.text, forKey: "email")
         myuser?.nomeUsuario =  nome.text
         myuser?.email =  emailtext.text
        
//        novonome.setValue("", forKey: "nomePessoacuidada")
//        novonome.setValue("", forKey: "numeroContato")
//        novonome.setValue("", forKey: "parentesco")
//        novonome.setValue("", forKey: "senha")

        if nome.text != "" && emailtext.text != ""{
            
            //do{
                
           //     try (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext.save()
           //     print("Sucesso ao Salvar nome") // FIXME: - IMPLEMENTAR UIAlertController
                //}
          //  }catch let erro as NSError{
          //      fatalError("Erro ao salvar Nome \(erro)")
          //  }
          //  myuser = novonome
            performSegue(withIdentifier: "Enviardadostela1", sender: nil)
            
        } else {
            
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
            case "Enviardadostela1":
                let dest = segue.destination as! Cad2ViewController
                dest.myuser = myuser
                
            default:
                break;
            }
            
        }
        
        
    }
    
}
