use ColetaDoacao

db.createCollection("Usuarios")
db.createCollection("TipoDoacao")
db.createCollection("Doacao")
db.createCollection("NecessidadeDoacao")
db.createCollection("Coleta")

db.Usuarios.insert(
    {
        Id_Usuario: 1,
        Endereco: [
            {
                Rua:"Alexandre Von Humboldt",
                Complemento:"Sobrado",
                Cep:"82110000",
                Cidade:"Curitiba",
                Estado:"Parana",
                Telefone:41999215821
            }
        ],
        Email: "bruno.diniz1@utp.edu.br",
        Tipo: "",
        Senha: 1234567
    }
);
    
db.Usuarios.insert(
    {
        Id_Usuario: 2,
        Endereco: [
            {
                Rua: "Padre Tiago Alberiane",
                Complemento: "Casa",
                Cep: "82020280",
                Cidade: "Curitiba",
                Estado: "Parana",
                Telefone: 41988496995
            }
        ],
        Email: "joao.moraes1@utp.edu.br",
        Tipo: "",
        Senha: 1234567
    }
);

db.Usuarios.insert(
    {
        Id_Usuario: 3,
        Endereco: [
            {
                Rua: "",
                Complemento: "",
                Cep: "",
                Cidade: "Curitiba",
                Estado: "Parana",
                Telefone: 41
            }
        ],
        Email: "@utp.edu.br",
        Tipo: "",
        Senha: 1234567
    }
);

db.Usuarios.insert(
    {
        Id_Usuario: 4,
        Endereco: [
            {
                Rua: "",
                Complemento: "",
                Cep: "",
                Cidade: "Curitiba",
                Estado: "Parana",
                Telefone: 41
            }
        ],
        Email: "@utp.edu.br",
        Tipo: "",
        Senha: 1234567
    }
);

db.TipoDoacao.insert(
    {
        Id_TipoDoacao: 1,
        Descricao: "Ração"
    }
);

db.TipoDoacao.insert(
    {
        Id_TipoDoacao: 2,
        Descricao: "Xampu"
    }
);

db.Doacao.insert(
    {
        Id_Doacao: "",
        Id_Usuario: "",
        Data: "",
        Id_TipoDoacao: "",
        Quantidade: ""
    }
);

db.NecessidadeDoacao.insert(
    {
        Id_Necessidade: "",
        Id_Usuario: "",
        Data: "",
        NomeAnimal: "",
        IdentificarTipoDoacao: "",
        Quantidade: ""
    }
);

db.Coleta.insert(
    {
        Id_Doacao: "",
        Id_Necessidade: "",
        Id_Usuario: "",
        DataColeta: "",
        DataEntrega: ""
    }
)