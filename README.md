# Taski Todo App

<img width="1500" alt="capa" src="https://github.com/user-attachments/assets/a8a2d84f-9d2c-4d2f-99c3-ccf6bfaf0d1c" />

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
├── core/               # Utilitários e constantes globais
├── models/             # Modelos de dados (TaskModel)
├── services/           # Serviços, como acesso ao banco de dados
├── views/              # Telas (UI)
│   ├── home/           # Tela inicial
│   ├── task_form/      # Tela de criação de tarefas
│   ├── completed/      # Tela de tarefas concluídas
├── viewmodels/         # Lógica de negócios para cada tela
├── widgets/            # Componentes reutilizáveis
```

---

## Configuração do Ambiente

### Requisitos
- Flutter SDK 3.x ou superior.
- Dart SDK 3.x ou superior.

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

## Licença
Este projeto está licenciado sob a MIT License - veja o arquivo [[LICENSE](https://chatgpt.com/c/LICENSE)](LICENSE) para mais detalhes.
