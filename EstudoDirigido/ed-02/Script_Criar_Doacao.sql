use ColetaDoacao

db.createCollection("Usuarios")
db.createCollection("TipoDoacao")
db.createCollection("Doacao")
db.createCollection("NecessidadeDoacao")
db.createCollection("Coleta")


db.Usuarios.insertMany([{Id_Usuario: 1, Endereco: [{Rua: "Alexandre Von Humboldt", Complemento: "Sobrado", Cep: "82110000", Cidade: "Curitiba", Estado: "Parana", Telefone: 41999215821}],Email: "bruno.diniz1@utp.edu.br", Tipo: "", Senha: 1234567},
                   {Id_Usuario: 2, Endereco: [{Rua: "Padre Tiago Alberione", Complemento: "Casa", Cep: "82020280", Cidade: "Curitiba", Estado: "Parana", Telefone: 41988496995}],Email: "joao.moraes1@utp.edu.br", Tipo: "", Senha: 1234567},
                   {Id_Usuario: 3, Endereco: [{Rua: "", Complemento: "", Cep: "", Cidade: "Curitiba", Estado: "Parana", Telefone: 41}],Email: "@utp.edu.br", Tipo: "", Senha: 1234567},
                   {Id_Usuario: 4, Endereco: [{Rua: "", Complemento: "", Cep: "", Cidade: "Curitiba", Estado: "Parana", Telefone: 41}],Email: "@utp.edu.br", Tipo: "", Senha: 1234567}]);


db.TipoDoacao.insertMany([{Id_TipoDoacao: 1, Descricao: "Ração"},
                         {Id_TipoDoacao: 2, Descricao: "Xampu"}]);


db.Doacao.insert([{Id_Doacao: 1, Id_Usuario: 1, Data: "30/07/2023", Id_TipoDoacao: 1, Quantidade: "5kg"},
                  {Id_Doacao: 2, Id_Usuario: 2, Data: "12/08/2023", Id_TipoDoacao: 2, Quantidade: "2l"},
                  {Id_Doacao: 3, Id_Usuario: 3, Data: "20/10/2023", Id_TipoDoacao: 3, Quantidade: "5kg"}]);


db.NecessidadeDoacao.insertMany([{Id_Necessidade: 1, Id_Usuario: 1, Data: "20/11/2023", NomeAnimal: "Nick", Id_TipoDoacao: 1, Quantidade: "10kg"},
                                 {Id_Necessidade: 2, Id_Usuario: 2, Data: "11/07/2023", NomeAnimal: "Gus", Id_TipoDoacao: 2, Quantidade: "3l"},
                                 {Id_Necessidade: 3, Id_Usuario: 3, Data: "11/11/2023", NomeAnimal: "Chimpamze", Id_TipoDoacao: 3,Quantidade: "2l"}]);


db.Coleta.insertMany([{ Id_Doacao: 1, Id_Necessidade: 1, Id_Usuario: 1, DataColeta: "10/02/2023", DataEntrega: "05/02/2023"},
                       { Id_Doacao: 2, Id_Necessidade: 2, Id_Usuario: 2, DataColeta: "09/08/2023", DataEntrega: "04/08/2023"},
                       { Id_Doacao: 3, Id_Necessidade: 3, Id_Usuario: 3, DataColeta: "14/04/2023", DataEntrega: "12/04/2023"}])

        
        
        
     