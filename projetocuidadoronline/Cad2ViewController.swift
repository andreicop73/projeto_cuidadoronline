//
//  CAd2ViewController.swift
//  projetocuidadoronline
//
//  Created by mac ssd on 30/07/17.
//  Copyright © 2017 mac ssd. All rights reserved.
//

import Foundation

import UIKit
import CoreData

class Cad2ViewController: UIViewController {
    
    
    @IBOutlet weak var contatoText: UITextField!
    
    @IBOutlet weak var parentescoText: UITextField!
    
    @IBOutlet weak var nomepessoaText: UITextField!
    
    var myuser:Usuarios?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //como  abrir o teclado
        
       // self.contatoText.becomeFirstResponder()
        
    }
    @IBAction func proxTela3(_ sender: Any) {
        
        salvartela2()
    }
    
    
    func salvartela2(){
        
        myuser?.numeroContato =  contatoText.text
        myuser?.parentesco = parentescoText.text
        myuser?.nomePessoaCuidada = nomepessoaText.text
        
        if contatoText.text != "" && parentescoText.text != "" && nomepessoaText.text != ""{
            
            performSegue(withIdentifier: "Enviardadostela2", sender: nil)
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
            case "Enviardadostela2":
                let dest = segue.destination as! Cad3ViewController
                dest.myuser = myuser
                
            default:
                break;
            }
            
        }
        
        
    }


    
}
