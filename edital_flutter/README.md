# Sistema de Editais - Frontend

Este é o frontend Flutter do Sistema de Editais, desenvolvido para funcionar com o backend Serverpod. O sistema permite gerenciar editais de inscrição com diferentes tipos de usuário: administradores, candidatos e membros de comissão avaliadora.

## Funcionalidades

### Autenticação
- Login com email e senha
- Cadastro de novos usuários com seleção de papel (admin, candidato, comissão)
- Recuperação de senha (implementação básica)

### Administrador
- Dashboard com visão geral do sistema
- Criar, editar e gerenciar editais
- Publicar e fechar editais
- Gerenciar comissões avaliadoras
- Adicionar e remover membros das comissões

### Candidato/Usuário
- Visualizar editais publicados
- Inscrever-se em editais disponíveis
- Acompanhar status das inscrições
- Visualizar detalhes dos editais

### Comissão Avaliadora
- Dashboard com editais atribuídos
- Avaliar inscrições pendentes
- Aprovar ou rejeitar candidatos
- Adicionar observações nas avaliações

## Pré-requisitos

1. **Flutter SDK** (versão 3.24.0 ou superior)
   ```bash
   # No Ubuntu/Debian
   sudo snap install flutter --classic
   
   # Ou baixe diretamente do site oficial
   # https://docs.flutter.dev/get-started/install
   ```

2. **Dart SDK** (incluído com Flutter)

3. **Backend Serverpod** rodando (veja instruções no diretório `edital_server`)

## Instalação e Configuração

### 1. Instalar Dependências

```bash
cd edital_flutter
flutter pub get
```

### 2. Configurar URL do Servidor

Por padrão, o app aponta para `http://localhost:8080`. Para alterar:

```bash
# Durante o desenvolvimento
flutter run --dart-define=SERVER_URL=http://SEU_IP:8080/

# Para build de produção
flutter build web --dart-define=SERVER_URL=https://sua-api.com/
```

### 3. Executar a Aplicação

#### Para desenvolvimento (web):
```bash
flutter run -d chrome
```

#### Para build de produção:
```bash
flutter build web
```

## Estrutura do Projeto

```
lib/
├── main.dart                 # Ponto de entrada da aplicação
├── providers/               # Gerenciamento de estado
│   ├── auth_provider.dart   # Autenticação e usuário atual
│   └── app_state_provider.dart # Estado global da aplicação
├── screens/                 # Telas da aplicação
│   ├── auth/               # Telas de autenticação
│   │   ├── login_screen.dart
│   │   ├── register_screen.dart
│   │   └── forgot_password_screen.dart
│   ├── admin/              # Telas do administrador
│   │   ├── admin_dashboard_screen.dart
│   │   ├── manage_notices_screen.dart
│   │   └── manage_committees_screen.dart
│   ├── user/               # Telas do candidato
│   │   ├── user_dashboard_screen.dart
│   │   ├── notice_details_screen.dart
│   │   └── register_for_notice_screen.dart
│   └── committee/          # Telas da comissão
│       ├── committee_dashboard_screen.dart
│       └── evaluate_registrations_screen.dart
├── widgets/                # Componentes reutilizáveis
│   ├── app_drawer.dart     # Menu lateral
│   ├── custom_text_field.dart # Campo de texto customizado
│   └── loading_button.dart # Botão com loading
└── utils/
    └── app_router.dart     # Configuração de rotas
```

## Configuração do Backend

Certifique-se que o backend Serverpod está rodando antes de usar o frontend:

1. **Iniciar o servidor:**
   ```bash
   cd edital_server
   dart bin/main.dart
   ```

2. **Verificar se os endpoints estão funcionando:**
   - Acesse `http://localhost:8080/` no navegador
   - Deve retornar uma resposta do Serverpod

## Fluxo de Usuário

### 1. Primeiro Acesso
1. Acesse a aplicação no navegador
2. Clique em "Criar nova conta"
3. Preencha os dados e selecione o tipo de usuário
4. Faça login com suas credenciais

### 2. Como Administrador
1. Faça login com conta de administrador
2. Acesse "Gerenciar Editais" para criar novos editais
3. Publique editais para torná-los visíveis aos candidatos
4. Configure comissões avaliadoras em "Gerenciar Comissões"

### 3. Como Candidato
1. Faça login com conta de candidato
2. Visualize editais disponíveis no dashboard
3. Clique em um edital para ver detalhes
4. Inscreva-se nos editais de interesse
5. Acompanhe o status das suas inscrições

### 4. Como Membro da Comissão
1. Faça login com conta de comissão
2. Visualize editais atribuídos no dashboard
3. Acesse "Avaliar" para revisar inscrições
4. Aprove ou rejeite candidatos com observações

## Solução de Problemas

### Erro de Conexão com o Backend
```
Erro: Failed to load data
```
**Solução:**
1. Verifique se o backend está rodando em `http://localhost:8080`
2. Confirme que não há bloqueio de CORS
3. Use a variável `SERVER_URL` para apontar para o IP correto

### Erro de Dependências
```
Erro: Package not found
```
**Solução:**
```bash
flutter clean
flutter pub get
```

### Erro de Build para Web
```
Erro: Web is not supported
```
**Solução:**
```bash
flutter config --enable-web
flutter create . --platform web
```

## Desenvolvimento

### Adicionando Novas Telas
1. Crie o arquivo da tela em `lib/screens/[categoria]/`
2. Adicione a rota em `lib/utils/app_router.dart`
3. Importe a tela no arquivo de rotas

### Adicionando Novos Endpoints
1. O cliente Serverpod é gerado automaticamente
2. Use `client.[endpoint].[method]()` para chamar APIs
3. Adicione tratamento de erro adequado

### Testando
```bash
# Testes unitários
flutter test

# Executar com hot reload
flutter run -d chrome --hot
```

## Dependências Principais

- **flutter**: Framework de UI
- **go_router**: Navegação e roteamento
- **provider**: Gerenciamento de estado
- **serverpod_flutter**: Cliente Serverpod
- **serverpod_auth_email_flutter**: Autenticação com email
- **material_design_icons_flutter**: Ícones adicionais

## Licença

Este projeto é desenvolvido para fins educacionais e de demonstração.

## Contribuição

1. Faça fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/nova-funcionalidade`)
3. Commit suas mudanças (`git commit -m 'Adiciona nova funcionalidade'`)
4. Push para a branch (`git push origin feature/nova-funcionalidade`)
5. Abra um Pull Request

## Suporte

Para dúvidas ou problemas:
1. Verifique a documentação do Flutter: https://docs.flutter.dev/
2. Consulte a documentação do Serverpod: https://serverpod.dev/
3. Abra uma issue no repositório do projeto
