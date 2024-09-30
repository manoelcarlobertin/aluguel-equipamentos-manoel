# Sistema feito com Ruby "3.3.1" (versão mais atual do momento), Rails "7.2.1", Bootstrap e Postgresql 1.1, com fins de minha prática e estudo das ferramentas mais atuais.

Estudo sobre Gems para criação de um SaaS para Aluguel de Equipamentos

Este estudo visa fornecer uma visão técnica sobre as gems utilizadas no projeto de um SaaS para aluguel de equipamentos, com foco na criação de formulários dinâmicos. O projeto foi discutido na Live #31 da Academia do Ruby, da Invenio. Abaixo, uma descrição do que cada gem faz e sua utilidade no contexto de um sistema SaaS.

    Gem turbo-rails
        Descrição: Turbo faz parte do framework Hotwire, que permite a criação de interações rápidas em aplicações web sem a necessidade de muito JavaScript personalizado. Ele atualiza partes da página via WebSockets ou Ajax sem recarregar toda a página.
        Uso no projeto: Ideal para melhorar a experiência do usuário ao navegar no SaaS, atualizando formulários e tabelas de forma dinâmica e suave, sem recarregar a página.

    Gem stimulus-rails
        Descrição: stimulus-rails é a integração do framework Stimulus no Rails. Ele facilita a adição de interatividade aos componentes HTML, permitindo comportamentos dinâmicos com pouco JavaScript. Ele se concentra em manter o HTML como fonte principal de verdade e aplicar comportamentos via controladores JavaScript.
        Uso no projeto: Permite criar formulários dinâmicos, validando e ajustando campos em tempo real, além de criar um frontend mais interativo.

    Gem cssbundling-rails
        Descrição: Esta gem permite que o Rails processe e agrupe CSS de maneira eficiente. Ele suporta várias ferramentas de empacotamento de CSS (como Tailwind, Sass, Bootstrap), facilitando a organização e a otimização de estilos.
        Uso no projeto: Utilizada para gerenciar e otimizar os arquivos CSS de forma eficiente, crucial para manter o design dos formulários dinâmicos consistente e rápido.

    Gem jbuilder
        Descrição: jbuilder facilita a criação de respostas JSON em Rails, permitindo construir APIs de maneira organizada e modular. Ela ajuda a gerar estruturas JSON diretamente a partir de views Rails.
        Uso no projeto: Pode ser usada para criar uma API de backend que suporte a criação de um frontend dinâmico ou um app mobile, servindo os dados dos equipamentos e locações de forma eficiente.

    Gem redis
        Descrição: Redis é um armazenamento de dados em memória extremamente rápido, muitas vezes utilizado para caching e filas de mensagens. No contexto do Rails, é comum ser usado para Action Cable, que lida com conexões em tempo real via WebSockets.
        Uso no projeto: Utilizado em produção para gerenciar conexões em tempo real entre o servidor e os usuários, o que é útil para atualizações em tempo real no status dos equipamentos ou interações de formulários.

    Gem simple_form
        Descrição: Uma gem que simplifica a criação de formulários no Rails, permitindo que formulários complexos sejam gerados de maneira mais simples e com um código mais limpo.
        Uso no projeto: Facilita a construção de formulários dinâmicos e personalizados, otimizando a criação de campos e validações para os dados de equipamentos e locações.

    Gem cpf_cnpj
        Descrição: Valida e formata números de CPF e CNPJ de acordo com as regras brasileiras. Ela é útil para garantir que os documentos fornecidos pelos usuários estejam corretos.
        Uso no projeto: Essencial para validar dados de clientes e locadores no sistema de aluguel, garantindo a conformidade com os formatos de identificação no Brasil.

    Gem pagy
        Descrição: Uma gem para paginação eficiente em Rails. Ela é conhecida por ser mais rápida e leve do que outras soluções de paginação, como Kaminari ou will_paginate.
        Uso no projeto: Utilizada para paginar grandes listas de equipamentos ou aluguéis, permitindo que o sistema gerencie volumes de dados maiores de forma eficiente.

    Gem pundit
        Descrição: pundit é uma gem para gerenciar políticas de autorização no Rails. Ela ajuda a definir quem pode fazer o que em diferentes partes do sistema.
        Uso no projeto: Controla o acesso a determinadas ações, como quem pode visualizar, editar ou excluir os equipamentos, garantindo a segurança e o controle de permissões no SaaS.

    Gem devise
        Descrição: devise é uma gem poderosa para autenticação de usuários. Ela fornece funcionalidades completas para login, logout, recuperação de senha, confirmações de e-mail, entre outros.
        Uso no projeto: Gerencia o sistema de autenticação de usuários, fundamental para um SaaS onde clientes precisam se cadastrar e fazer login para alugar equipamentos.

    Gem ransack
        Descrição: ransack facilita a criação de formulários de pesquisa e filtros avançados em Rails. Ela é usada para buscar e filtrar registros com base em atributos de modelos de forma dinâmica.
        Uso no projeto: Facilita a busca por equipamentos ou locações com filtros personalizados, permitindo que os usuários encontrem rapidamente o que precisam no sistema.

Fonte de referência: As gems mencionadas e outros tópicos de desenvolvimento foram discutidos em aulas semanais na Academia do Ruby da Invenio, onde aprendemos a criar projetos SaaS completos e escaláveis com o framework Ruby on Rails. Acesse invenio.dev.br/academia-ruby para acompanhar as lives e aprender mais sobre esses e outros projetos.
