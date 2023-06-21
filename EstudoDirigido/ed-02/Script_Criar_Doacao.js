// Cria a DataBase ColetaDoacao
use ('ColetaDoacao')

// Cria a Collection Usuarios
db.createCollection("Usuarios")

// Cria a Collection TipoDoacao
db.createCollection("TipoDoacao")

// Cria a Collection Doacao
db.createCollection("Doacao")

// Cria a Collection NecessidadeDoacao
db.createCollection("NecessidadeDoacao")

// Cria a Collection Coleta
db.createCollection("Coleta")

// Cria e Popula os Documents da Collection Usuarios
db.Usuarios.insertMany([{Id_Usuario: 1, Endereco: [{Rua: "Alexandre Von Humboldt", Complemento: "Sobrado", Cep: "82110000", Cidade: "Curitiba", Estado: "Parana", Telefone: 41999215821}],Email: "bruno.diniz1@utp.edu.br", Tipo: "Doador", Senha: 4209244573},
                   {Id_Usuario: 2, Endereco: [{Rua: "Padre Tiago Alberione", Complemento: "Casa", Cep: "82020280", Cidade: "Curitiba", Estado: "Parana", Telefone: 41988496995}],Email: "joao.moraes1@utp.edu.br", Tipo: "Doador", Senha: 2879811341},
                   {Id_Usuario: 3, Endereco: [{Rua: "João Volpe", Complemento: "Casa", Cep: "82320300", Cidade: "Curitiba", Estado: "Parana", Telefone: 41987002769}],Email: "levi.pinho@utp.edu.br", Tipo: "Coletor", Senha: 2428505533},
                   {Id_Usuario: 4, Endereco: [{Rua: "Senador Alencar Guimarães", Complemento: "Apartamento", Cep: "80010-070", Cidade: "Curitiba", Estado: "Parana", Telefone: 41997560527}],Email: "jose.farias1@utp.edu.br", Tipo: "Padrinho", Senha: 5024156503}]);

// Cria e Popula os Documents da Collection TipoDoacao
db.TipoDoacao.insertMany([{Id_TipoDoacao: 1, Descricao: "Ração"},
                         {Id_TipoDoacao: 2, Descricao: "Xampu"}]);

// Cria e Popula os Documents da Collection Doacao
db.Doacao.insert([{Id_Doacao: 1, Id_Usuario: 1, Data: "30/07/2023", Id_TipoDoacao: 1, Quantidade: "12kg"},
                  {Id_Doacao: 2, Id_Usuario: 2, Data: "12/08/2023", Id_TipoDoacao: 1, Quantidade: "2l,3kg"},
                  {Id_Doacao: 3, Id_Usuario: 1, Data: "20/10/2023", Id_TipoDoacao: 2, Quantidade: "4,7kg"},
                  {Id_Doacao: 4, Id_Usuario: 2, Data: "17/02/2023", Id_TipoDoacao: 2, Quantidade: "3kg"}]);

// Cria e Popula os Documents da Collection NecessidadeDoacao
db.NecessidadeDoacao.insertMany([{Id_Necessidade: 1, Id_Usuario: 1, Data: "20/11/2023", NomeAnimal: "Maggie", Id_TipoDoacao: 1, Quantidade: "12kg"},
                                 {Id_Necessidade: 2, Id_Usuario: 2, Data: "11/07/2023", NomeAnimal: "Gus", Id_TipoDoacao: 1, Quantidade: "21,3kg"},
                                 {Id_Necessidade: 3, Id_Usuario: 3, Data: "11/11/2023", NomeAnimal: "Puma", Id_TipoDoacao: 2,Quantidade: "4,7kg"},
                                 {Id_Necessidade: 4, Id_Usuario: 4, Data: "25/12/2023", NomeAnimal: "Frodo", Id_TipoDoacao: 2,Quantidade: "3kg"}]);

// Cria e Popula os Documents da Collection Coleta
db.Coleta.insertMany([{Id_Doacao: 1, Id_Necessidade: 1, Id_Usuario: 1, DataColeta: "31/07/2023", DataEntrega: "20/11/2023"},
                       {Id_Doacao: 2, Id_Necessidade: 2, Id_Usuario: 2, DataColeta: "13/08/2023", DataEntrega: "11/07/2023"},
                       {Id_Doacao: 3, Id_Necessidade: 3, Id_Usuario: 3, DataColeta: "21/10/2023", DataEntrega: "12/11/2023"},
                       {Id_Doacao: 4, Id_Necessidade: 4, Id_Usuario: 4, DataColeta: "18/02/2023", DataEntrega: "26/12/2023"}]);

// Lista todos os Usuarios (Alunos do trabalho)
db.Usuarios.find({})

// Lista a Collection TipoDoacao
db.TipoDoacao.find({})

// Lista a Collection Doacao + Endereço(Usuario)
db.Doacao.aggregate([
    {
      $lookup: {
        from: "Usuarios",
        localField: "Id_Usuario",
        foreignField: "Id_Usuario",
        as: "UsuarioEnd"
      }
    }
  ])

// Lista a Collection NecessidadeDoacao + Endereço(Usuario)
db.NecessidadeDoacao.aggregate([
    {
      $lookup: {
        from: "Usuarios",
        localField: "Id_Usuario",
        foreignField: "Id_Usuario",
        as: "UsuarioEnd"
      }
    }
  ])

// Lista a Collection Coleta + Endereço(Usuario)
db.Coleta.aggregate([
    {
      $lookup: {
        from: "Usuarios",
        localField: "Id_Usuario",
        foreignField: "Id_Usuario",
        as: "UsuarioEnd"
      }
    }
  ])
