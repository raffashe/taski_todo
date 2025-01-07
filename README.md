# Taski Todo App

![taski app](https://github.com/user-attachments/assets/cf0c5297-8125-4943-9c64-e4db28d7fecc)

## Descrição do Projeto
O **Taski Todo App** é um aplicativo de gerenciamento de tarefas desenvolvido utilizando Flutter. Este projeto foi construído com foco em boas práticas de desenvolvimento, como Clean Code e arquitetura MVVM (Model-View-ViewModel). O objetivo é permitir a criação, listagem e gerenciamento de tarefas de forma simples e eficiente, com suporte a armazenamento offline utilizando Hive.

---

## Funcionalidades
- Listagem de tarefas com scroll infinito.
- Listagem de tarefas finalizadas.
- Criação de novas tarefas.
- Armazenamento de dados offline utilizando Hive.

---

## Estrutura do Projeto
O projeto foi estruturado seguindo o padrão MVVM:

```
lib/
├── core/                     # Utilitários e constantes globais
│   ├── constants/            # Definições constantes da aplicação
│   │   ├── app_colors.dart   # Paleta de cores da aplicação
│   │   ├── app_routes.dart   # Rotas de navegação
│   │   ├── app_text_styles.dart # Estilos de texto
│   │   ├── app_theme.dart    # Configuração de tema da aplicação
│   ├── utils/                # Utilitários compartilhados
│       ├── dialog_utils.dart # Funções utilitárias para diálogos
│       ├── notification_utils.dart # Funções utilitárias para notificações
│
├── data/                     # Serviços de dados e modelos
│   ├── database/             # Acesso ao banco de dados
│   │   ├── database.dart     # Configuração e manipulação do banco de dados
│   ├── models/               # Modelos de dados
│       ├── search_input_model.dart # Modelo para entrada de pesquisa
│       ├── task_model.dart   # Modelo de tarefa
│       ├── task_model.g.dart # Código gerado para o modelo de tarefa
│
├── viewmodel/                # Lógica de negócios e estados
│   ├── search_input_viewmodel.dart # Gerencia o estado da pesquisa
│   ├── task_viewmodel.dart   # Gerencia o estado das tarefas
│
├── ui/                       # Telas e componentes da interface do usuário
│   ├── views/                # Telas principais
│   │   ├── create/           # Tela de criação de tarefas
│   │   ├── done/             # Tela de tarefas concluídas
│   │   ├── home/             # Tela inicial
│   │   ├── search/           # Tela de pesquisa de tarefas
│   ├── widgets/              # Componentes reutilizáveis da interface
│       ├── dialog/           # Widgets relacionados a diálogos
│       ├── done/             # Widgets para tarefas concluídas
│       ├── modal/            # Widgets modais
│       ├── nav/              # Widgets de navegação
│       ├── search/           # Widgets para funcionalidade de pesquisa
│       ├── ui/               # Widgets gerais de IU
│
├── main.dart                 # Ponto de entrada da aplicação
└── taski_app.dart            # Configuração principal da aplicação

```

---

## Configuração do Ambiente

### Requisitos
- Flutter SDK 3.6.0 ou superior.
- Dart SDK ^3.5.4 ou superior.

### Instalação
1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/taski_todo.git
   cd taski_todo
   ```

2. Instale as dependências:
   ```bash
   flutter pub get
   ```

3. Gere os adaptadores do Hive:
   ```bash
   flutter pub run build_runner build
   ```

4. Execute o projeto:
   ```bash
   flutter run
   ```

---
