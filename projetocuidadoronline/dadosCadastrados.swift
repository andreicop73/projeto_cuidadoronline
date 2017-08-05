//
//  dadosCadastrados.swift
//  projetocuidadoronline
//
//  Created by mac ssd on 05/08/17.
//  Copyright © 2017 mac ssd. All rights reserved.
//

import Foundation

class dadosCadastrais{
      var myuser:Usuarios?
     init(nome: String, email: String, contato: String, nomePessoa: String, parentesco: String  ) {
        //self.nome = myuser?.nomeUsuario
       // self.email = myuser?.email
        myuser?.numeroContato = contato
        myuser?.nomePessoaCuidada = nomePessoa
        myuser?.parentesco = parentesco

        
}
}
