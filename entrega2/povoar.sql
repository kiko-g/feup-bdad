--
-- File generated with SQLiteStudio v3.2.1 on Sun Apr 14 19:56:46 2019
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = on;
BEGIN TRANSACTION;

-- Table: Bebidas
INSERT INTO Bebidas (
                        codigoBarras,
                        quantidade,
                        tipo,
                        tamanhoPack
                    )
                    VALUES (
                        1237,
                        1750,
                        'Refrigerante',
                        4
                    );

INSERT INTO Bebidas (
                        codigoBarras,
                        quantidade,
                        tipo,
                        tamanhoPack
                    )
                    VALUES (
                        52839,
                        750,
                        'Alcoolica',
                        1
                    );

INSERT INTO Bebidas (
                        codigoBarras,
                        quantidade,
                        tipo,
                        tamanhoPack
                    )
                    VALUES (
                        230867,
                        1000,
                        'Sumo',
                        1
                    );

INSERT INTO Bebidas (
                        codigoBarras,
                        quantidade,
                        tipo,
                        tamanhoPack
                    )
                    VALUES (
                        432627,
                        330,
                        'Alcoolica',
                        6
                    );


-- Table: Charcutaria
INSERT INTO Charcutaria (
                            codigoBarras,
                            tipoCarne,
                            peso,
                            embalado
                        )
                        VALUES (
                            1247,
                            'Vermelha',
                            100,
                            'yes'
                        );

INSERT INTO Charcutaria (
                            codigoBarras,
                            tipoCarne,
                            peso,
                            embalado
                        )
                        VALUES (
                            97256,
                            'Vermelha',
                            200,
                            'no'
                        );

INSERT INTO Charcutaria (
                            codigoBarras,
                            tipoCarne,
                            peso,
                            embalado
                        )
                        VALUES (
                            123412,
                            'Vermelha',
                            150,
                            'no'
                        );

INSERT INTO Charcutaria (
                            codigoBarras,
                            tipoCarne,
                            peso,
                            embalado
                        )
                        VALUES (
                            356456,
                            'Vermelha',
                            300,
                            'yes'
                        );

INSERT INTO Charcutaria (
                            codigoBarras,
                            tipoCarne,
                            peso,
                            embalado
                        )
                        VALUES (
                            43879894,
                            'Branca',
                            100,
                            'yes'
                        );


-- Table: Cliente
INSERT INTO Cliente (
                        NIF,
                        email
                    )
                    VALUES (
                        856123909,
                        'ola@g.com'
                    );

INSERT INTO Cliente (
                        NIF,
                        email
                    )
                    VALUES (
                        147906151,
                        'iaj@google.pt'
                    );

INSERT INTO Cliente (
                        NIF,
                        email
                    )
                    VALUES (
                        309456280,
                        'ok@google.com'
                    );

INSERT INTO Cliente (
                        NIF,
                        email
                    )
                    VALUES (
                        198237585,
                        'sim@google.com'
                    );

INSERT INTO Cliente (
                        NIF,
                        email
                    )
                    VALUES (
                        571084672,
                        'jsp@outlook.com'
                    );

INSERT INTO Cliente (
                        NIF,
                        email
                    )
                    VALUES (
                        969762934,
                        'qcs@hotmail.com'
                    );

INSERT INTO Cliente (
                        NIF,
                        email
                    )
                    VALUES (
                        137560156,
                        'nas@live.com.pt'
                    );

INSERT INTO Cliente (
                        NIF,
                        email
                    )
                    VALUES (
                        832761232,
                        'jgsg@hotmail.com'
                    );


-- Table: Encomenda
INSERT INTO Encomenda (
                          idEncomenda,
                          NIF,
                          idLoja,
                          data,
                          metodoPagamento,
                          idTransportadora,
                          preçoFinal
                      )
                      VALUES (
                          1,
                          856123909,
                          1,
                          '2019-04-13 16:42:56',
                          'Dinheiro',
                          1,
                          15.0
                      );

INSERT INTO Encomenda (
                          idEncomenda,
                          NIF,
                          idLoja,
                          data,
                          metodoPagamento,
                          idTransportadora,
                          preçoFinal
                      )
                      VALUES (
                          2,
                          198237585,
                          1,
                          '2019-04-13 16:42:56',
                          'Multibanco',
                          3,
                          25.0
                      );

INSERT INTO Encomenda (
                          idEncomenda,
                          NIF,
                          idLoja,
                          data,
                          metodoPagamento,
                          idTransportadora,
                          preçoFinal
                      )
                      VALUES (
                          3,
                          571084672,
                          1,
                          '2019-04-13 16:42:56',
                          'Dinheiro',
                          3,
                          24.0
                      );

INSERT INTO Encomenda (
                          idEncomenda,
                          NIF,
                          idLoja,
                          data,
                          metodoPagamento,
                          idTransportadora,
                          preçoFinal
                      )
                      VALUES (
                          4,
                          969762934,
                          1,
                          '2019-04-13 16:42:56',
                          'PayPal',
                          2,
                          41.0
                      );

INSERT INTO Encomenda (
                          idEncomenda,
                          NIF,
                          idLoja,
                          data,
                          metodoPagamento,
                          idTransportadora,
                          preçoFinal
                      )
                      VALUES (
                          6,
                          832761232,
                          1,
                          '2019-04-13 16:42:57',
                          'Multibanco',
                          1,
                          61.0
                      );

INSERT INTO Encomenda (
                          idEncomenda,
                          NIF,
                          idLoja,
                          data,
                          metodoPagamento,
                          idTransportadora,
                          preçoFinal
                      )
                      VALUES (
                          7,
                          856123909,
                          1,
                          '2019-04-14 13:11:27',
                          'Dinheiro',
                          NULL,
                          79.0
                      );


-- Table: Entrega
INSERT INTO Entrega (
                        idTransportadora,
                        idEncomenda,
                        morada
                    )
                    VALUES (
                        2,
                        4,
                        'Rua da Junqueira'
                    );

INSERT INTO Entrega (
                        idTransportadora,
                        idEncomenda,
                        morada
                    )
                    VALUES (
                        1,
                        6,
                        'Rua Marques de Pombal'
                    );

INSERT INTO Entrega (
                        idTransportadora,
                        idEncomenda,
                        morada
                    )
                    VALUES (
                        3,
                        2,
                        'Avenida do Brazil'
                    );

INSERT INTO Entrega (
                        idTransportadora,
                        idEncomenda,
                        morada
                    )
                    VALUES (
                        1,
                        1,
                        'Praceta da Liberdade'
                    );

INSERT INTO Entrega (
                        idTransportadora,
                        idEncomenda,
                        morada
                    )
                    VALUES (
                        3,
                        3,
                        'Rua da Primavera'
                    );


-- Table: Funcionario
INSERT INTO Funcionario (
                            NIF,
                            disponivel
                        )
                        VALUES (
                            195023857,
                            'yes'
                        );

INSERT INTO Funcionario (
                            NIF,
                            disponivel
                        )
                        VALUES (
                            109582375,
                            'no'
                        );


-- Table: Lacticionios
INSERT INTO Lacticionios (
                             codigoBarras,
                             tamanhoPack,
                             quantidade,
                             lactose
                         )
                         VALUES (
                             12316,
                             1,
                             500,
                             'yes'
                         );

INSERT INTO Lacticionios (
                             codigoBarras,
                             tamanhoPack,
                             quantidade,
                             lactose
                         )
                         VALUES (
                             68469,
                             6,
                             1000,
                             'no'
                         );

INSERT INTO Lacticionios (
                             codigoBarras,
                             tamanhoPack,
                             quantidade,
                             lactose
                         )
                         VALUES (
                             2624688,
                             6,
                             1000,
                             'yes'
                         );

INSERT INTO Lacticionios (
                             codigoBarras,
                             tamanhoPack,
                             quantidade,
                             lactose
                         )
                         VALUES (
                             257989382,
                             6,
                             50,
                             'yes'
                         );


-- Table: Limpeza
INSERT INTO Limpeza (
                        codigoBarras,
                        tamanhoPack,
                        peso
                    )
                    VALUES (
                        12386,
                        1,
                        500
                    );

INSERT INTO Limpeza (
                        codigoBarras,
                        tamanhoPack,
                        peso
                    )
                    VALUES (
                        68356,
                        100,
                        150
                    );

INSERT INTO Limpeza (
                        codigoBarras,
                        tamanhoPack,
                        peso
                    )
                    VALUES (
                        84593,
                        1,
                        250
                    );

INSERT INTO Limpeza (
                        codigoBarras,
                        tamanhoPack,
                        peso
                    )
                    VALUES (
                        97142,
                        1,
                        75
                    );

INSERT INTO Limpeza (
                        codigoBarras,
                        tamanhoPack,
                        peso
                    )
                    VALUES (
                        1238126,
                        25,
                        50
                    );

INSERT INTO Limpeza (
                        codigoBarras,
                        tamanhoPack,
                        peso
                    )
                    VALUES (
                        23489569,
                        1,
                        250
                    );


-- Table: Loja
INSERT INTO Loja (
                     idLoja,
                     nome,
                     morada,
                     telefone
                 )
                 VALUES (
                     1,
                     'MIEICado',
                     'Rua do sem nome',
                     252598694
                 );


-- Table: Pessoa
INSERT INTO Pessoa (
                       NIF,
                       nome,
                       morada,
                       telemovel
                   )
                   VALUES (
                       856123909,
                       'Rui Silva',
                       'Rua Marquês de Pombal',
                       914542345
                   );

INSERT INTO Pessoa (
                       NIF,
                       nome,
                       morada,
                       telemovel
                   )
                   VALUES (
                       147906151,
                       'João Ramos',
                       'Rua 25 Outubro',
                       927468842
                   );

INSERT INTO Pessoa (
                       NIF,
                       nome,
                       morada,
                       telemovel
                   )
                   VALUES (
                       309456280,
                       'Francisco Alves',
                       'Rua Sanguinhal',
                       960793426
                   );

INSERT INTO Pessoa (
                       NIF,
                       nome,
                       morada,
                       telemovel
                   )
                   VALUES (
                       198237585,
                       'Paulo Oliveira',
                       'Rua Octavio Augusto',
                       918624502
                   );

INSERT INTO Pessoa (
                       NIF,
                       nome,
                       morada,
                       telemovel
                   )
                   VALUES (
                       571084672,
                       'Miguel Viana',
                       'Rua Dr. Carlos Pinto Ferreira',
                       910578520
                   );

INSERT INTO Pessoa (
                       NIF,
                       nome,
                       morada,
                       telemovel
                   )
                   VALUES (
                       969762934,
                       'João Agra',
                       'Rua das Laranjeiras',
                       921438925
                   );

INSERT INTO Pessoa (
                       NIF,
                       nome,
                       morada,
                       telemovel
                   )
                   VALUES (
                       137560156,
                       'Joaquim Azevedo',
                       'Rua dos Olivais',
                       912799764
                   );

INSERT INTO Pessoa (
                       NIF,
                       nome,
                       morada,
                       telemovel
                   )
                   VALUES (
                       832761232,
                       'Luís Costa',
                       'Rua dos Campos',
                       961780242
                   );

INSERT INTO Pessoa (
                       NIF,
                       nome,
                       morada,
                       telemovel
                   )
                   VALUES (
                       195023857,
                       'José Macedo',
                       'Avenida da Boavista',
                       962347579
                   );

INSERT INTO Pessoa (
                       NIF,
                       nome,
                       morada,
                       telemovel
                   )
                   VALUES (
                       109582375,
                       'Eduardo Campos',
                       'Praceta 25 de Abril',
                       912347569
                   );


-- Table: Produto
INSERT INTO Produto (
                        codigoBarras,
                        nome,
                        marca,
                        preço,
                        desconto
                    )
                    VALUES (
                        1237,
                        'Coca-Cola',
                        'Coca-Cola',
                        2.25,
                        0.0
                    );

INSERT INTO Produto (
                        codigoBarras,
                        nome,
                        marca,
                        preço,
                        desconto
                    )
                    VALUES (
                        1247,
                        'Presunto',
                        NULL,
                        1.99,
                        0.0
                    );

INSERT INTO Produto (
                        codigoBarras,
                        nome,
                        marca,
                        preço,
                        desconto
                    )
                    VALUES (
                        12316,
                        'Manteiga',
                        'Becel',
                        1.25,
                        0.0
                    );

INSERT INTO Produto (
                        codigoBarras,
                        nome,
                        marca,
                        preço,
                        desconto
                    )
                    VALUES (
                        12386,
                        'Shampô',
                        'Pantene',
                        9.4,
                        0.0
                    );

INSERT INTO Produto (
                        codigoBarras,
                        nome,
                        marca,
                        preço,
                        desconto
                    )
                    VALUES (
                        52839,
                        'Vinho do Porto',
                        'Caves do Norte',
                        15.6,
                        0.0
                    );

INSERT INTO Produto (
                        codigoBarras,
                        nome,
                        marca,
                        preço,
                        desconto
                    )
                    VALUES (
                        68356,
                        'Toalhetes',
                        NULL,
                        0.99,
                        10.0
                    );

INSERT INTO Produto (
                        codigoBarras,
                        nome,
                        marca,
                        preço,
                        desconto
                    )
                    VALUES (
                        68469,
                        'Leite de Soja',
                        'Linga',
                        1.23,
                        0.0
                    );

INSERT INTO Produto (
                        codigoBarras,
                        nome,
                        marca,
                        preço,
                        desconto
                    )
                    VALUES (
                        84593,
                        'Amaciador',
                        'Linik-for-men',
                        19.99,
                        0.0
                    );

INSERT INTO Produto (
                        codigoBarras,
                        nome,
                        marca,
                        preço,
                        desconto
                    )
                    VALUES (
                        97142,
                        'Pasta dos Dentes',
                        'Colgate',
                        3.5,
                        0.0
                    );

INSERT INTO Produto (
                        codigoBarras,
                        nome,
                        marca,
                        preço,
                        desconto
                    )
                    VALUES (
                        97256,
                        'Murtadela',
                        NULL,
                        2.5,
                        0.0
                    );

INSERT INTO Produto (
                        codigoBarras,
                        nome,
                        marca,
                        preço,
                        desconto
                    )
                    VALUES (
                        123412,
                        'Paio',
                        NULL,
                        1.4,
                        0.0
                    );

INSERT INTO Produto (
                        codigoBarras,
                        nome,
                        marca,
                        preço,
                        desconto
                    )
                    VALUES (
                        230867,
                        'Compal de Manga',
                        'Compal',
                        2.0,
                        0.0
                    );

INSERT INTO Produto (
                        codigoBarras,
                        nome,
                        marca,
                        preço,
                        desconto
                    )
                    VALUES (
                        356456,
                        'Bife do Vazio',
                        NULL,
                        7.0,
                        0.0
                    );

INSERT INTO Produto (
                        codigoBarras,
                        nome,
                        marca,
                        preço,
                        desconto
                    )
                    VALUES (
                        432627,
                        'Cerveja',
                        'SuperBock',
                        2.79,
                        25.0
                    );

INSERT INTO Produto (
                        codigoBarras,
                        nome,
                        marca,
                        preço,
                        desconto
                    )
                    VALUES (
                        1238126,
                        'Luvas Estereis',
                        'Limp',
                        0.99,
                        0.0
                    );

INSERT INTO Produto (
                        codigoBarras,
                        nome,
                        marca,
                        preço,
                        desconto
                    )
                    VALUES (
                        1316798,
                        'Agua Mineral Natural',
                        'Fastio',
                        0.27,
                        0.0
                    );

INSERT INTO Produto (
                        codigoBarras,
                        nome,
                        marca,
                        preço,
                        desconto
                    )
                    VALUES (
                        2624688,
                        'Leite Magro',
                        'Agros',
                        0.9,
                        30.0
                    );

INSERT INTO Produto (
                        codigoBarras,
                        nome,
                        marca,
                        preço,
                        desconto
                    )
                    VALUES (
                        23489569,
                        'Sabonete',
                        'Rosas Inc.',
                        1.0,
                        0.0
                    );

INSERT INTO Produto (
                        codigoBarras,
                        nome,
                        marca,
                        preço,
                        desconto
                    )
                    VALUES (
                        43879894,
                        'Fiambre de Peru',
                        'Nacional',
                        1.69,
                        0.0
                    );

INSERT INTO Produto (
                        codigoBarras,
                        nome,
                        marca,
                        preço,
                        desconto
                    )
                    VALUES (
                        257989382,
                        'Iogurte de Pessego',
                        'Agros',
                        4.49,
                        0.0
                    );


-- Table: QuantidadePedida
INSERT INTO QuantidadePedida (
                                 codigoBarras,
                                 idEncomenda,
                                 quantidade
                             )
                             VALUES (
                                 1237,
                                 1,
                                 4
                             );

INSERT INTO QuantidadePedida (
                                 codigoBarras,
                                 idEncomenda,
                                 quantidade
                             )
                             VALUES (
                                 1247,
                                 2,
                                 6
                             );

INSERT INTO QuantidadePedida (
                                 codigoBarras,
                                 idEncomenda,
                                 quantidade
                             )
                             VALUES (
                                 12386,
                                 3,
                                 1
                             );

INSERT INTO QuantidadePedida (
                                 codigoBarras,
                                 idEncomenda,
                                 quantidade
                             )
                             VALUES (
                                 1237,
                                 4,
                                 10
                             );

INSERT INTO QuantidadePedida (
                                 codigoBarras,
                                 idEncomenda,
                                 quantidade
                             )
                             VALUES (
                                 84593,
                                 7,
                                 7
                             );

INSERT INTO QuantidadePedida (
                                 codigoBarras,
                                 idEncomenda,
                                 quantidade
                             )
                             VALUES (
                                 12386,
                                 6,
                                 9
                             );

INSERT INTO QuantidadePedida (
                                 codigoBarras,
                                 idEncomenda,
                                 quantidade
                             )
                             VALUES (
                                 68356,
                                 1,
                                 3
                             );

INSERT INTO QuantidadePedida (
                                 codigoBarras,
                                 idEncomenda,
                                 quantidade
                             )
                             VALUES (
                                 257989382,
                                 2,
                                 6
                             );

INSERT INTO QuantidadePedida (
                                 codigoBarras,
                                 idEncomenda,
                                 quantidade
                             )
                             VALUES (
                                 1238126,
                                 4,
                                 2
                             );

INSERT INTO QuantidadePedida (
                                 codigoBarras,
                                 idEncomenda,
                                 quantidade
                             )
                             VALUES (
                                 432627,
                                 1,
                                 1
                             );

INSERT INTO QuantidadePedida (
                                 codigoBarras,
                                 idEncomenda,
                                 quantidade
                             )
                             VALUES (
                                 23489569,
                                 7,
                                 7
                             );

INSERT INTO QuantidadePedida (
                                 codigoBarras,
                                 idEncomenda,
                                 quantidade
                             )
                             VALUES (
                                 97142,
                                 6,
                                 2
                             );


-- Table: Stock
INSERT INTO Stock (
                      codigoBarras,
                      idLoja,
                      stock
                  )
                  VALUES (
                      1237,
                      1,
                      20
                  );

INSERT INTO Stock (
                      codigoBarras,
                      idLoja,
                      stock
                  )
                  VALUES (
                      1247,
                      1,
                      15
                  );

INSERT INTO Stock (
                      codigoBarras,
                      idLoja,
                      stock
                  )
                  VALUES (
                      12316,
                      1,
                      50
                  );

INSERT INTO Stock (
                      codigoBarras,
                      idLoja,
                      stock
                  )
                  VALUES (
                      12386,
                      1,
                      120
                  );

INSERT INTO Stock (
                      codigoBarras,
                      idLoja,
                      stock
                  )
                  VALUES (
                      52839,
                      1,
                      30
                  );

INSERT INTO Stock (
                      codigoBarras,
                      idLoja,
                      stock
                  )
                  VALUES (
                      68356,
                      1,
                      20
                  );

INSERT INTO Stock (
                      codigoBarras,
                      idLoja,
                      stock
                  )
                  VALUES (
                      68469,
                      1,
                      42
                  );

INSERT INTO Stock (
                      codigoBarras,
                      idLoja,
                      stock
                  )
                  VALUES (
                      84593,
                      1,
                      21
                  );

INSERT INTO Stock (
                      codigoBarras,
                      idLoja,
                      stock
                  )
                  VALUES (
                      97142,
                      1,
                      18
                  );

INSERT INTO Stock (
                      codigoBarras,
                      idLoja,
                      stock
                  )
                  VALUES (
                      97256,
                      1,
                      9
                  );

INSERT INTO Stock (
                      codigoBarras,
                      idLoja,
                      stock
                  )
                  VALUES (
                      123412,
                      1,
                      65
                  );

INSERT INTO Stock (
                      codigoBarras,
                      idLoja,
                      stock
                  )
                  VALUES (
                      230867,
                      1,
                      78
                  );

INSERT INTO Stock (
                      codigoBarras,
                      idLoja,
                      stock
                  )
                  VALUES (
                      356456,
                      1,
                      43
                  );

INSERT INTO Stock (
                      codigoBarras,
                      idLoja,
                      stock
                  )
                  VALUES (
                      432627,
                      1,
                      27
                  );

INSERT INTO Stock (
                      codigoBarras,
                      idLoja,
                      stock
                  )
                  VALUES (
                      1238126,
                      1,
                      56
                  );

INSERT INTO Stock (
                      codigoBarras,
                      idLoja,
                      stock
                  )
                  VALUES (
                      1316798,
                      1,
                      23
                  );

INSERT INTO Stock (
                      codigoBarras,
                      idLoja,
                      stock
                  )
                  VALUES (
                      2624688,
                      1,
                      93
                  );

INSERT INTO Stock (
                      codigoBarras,
                      idLoja,
                      stock
                  )
                  VALUES (
                      23489569,
                      1,
                      29
                  );

INSERT INTO Stock (
                      codigoBarras,
                      idLoja,
                      stock
                  )
                  VALUES (
                      43879894,
                      1,
                      48
                  );

INSERT INTO Stock (
                      codigoBarras,
                      idLoja,
                      stock
                  )
                  VALUES (
                      257989382,
                      1,
                      61
                  );


-- Table: Suporte
INSERT INTO Suporte (
                        idPedido,
                        data,
                        funcionarioNIF,
                        clienteNIF
                    )
                    VALUES (
                        4,
                        '2019-04-13 16:32:59',
                        195023857,
                        309456280
                    );

INSERT INTO Suporte (
                        idPedido,
                        data,
                        funcionarioNIF,
                        clienteNIF
                    )
                    VALUES (
                        5,
                        '2019-04-13 16:32:59',
                        195023857,
                        832761232
                    );

INSERT INTO Suporte (
                        idPedido,
                        data,
                        funcionarioNIF,
                        clienteNIF
                    )
                    VALUES (
                        6,
                        '2019-04-10 10:46:23',
                        195023857,
                        969762934
                    );

INSERT INTO Suporte (
                        idPedido,
                        data,
                        funcionarioNIF,
                        clienteNIF
                    )
                    VALUES (
                        7,
                        '2019-04-06 9:38:39',
                        NULL,
                        309456280
                    );


-- Table: Transportadora
INSERT INTO Transportadora (
                               idTransportadora,
                               nome,
                               telefone,
                               preço
                           )
                           VALUES (
                               1,
                               'Runner',
                               251294363,
                               1.0
                           );

INSERT INTO Transportadora (
                               idTransportadora,
                               nome,
                               telefone,
                               preço
                           )
                           VALUES (
                               2,
                               'TNT',
                               242465782,
                               4.0
                           );

INSERT INTO Transportadora (
                               idTransportadora,
                               nome,
                               telefone,
                               preço
                           )
                           VALUES (
                               3,
                               'Vast',
                               236347879,
                               2.0
                           );






COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
