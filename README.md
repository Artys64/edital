# Sistema de Editais

Sistema completo para gerenciamento de editais de inscrição desenvolvido com **Serverpod** (backend) e **Flutter** (frontend). O sistema permite que administradores criem editais, candidatos se inscrevam e comissões avaliadoras analisem as inscrições.

## 🎯 Funcionalidades Principais

### Para Administradores
- ✅ Gerenciar editais (criar, editar, publicar, fechar)
- ✅ Configurar comissões avaliadoras
- ✅ Gerenciar usuários do sistema
- ✅ Dashboard com visão geral

### Para Candidatos
- ✅ Visualizar editais publicados
- ✅ Inscrever-se em editais disponíveis
- ✅ Acompanhar status das inscrições
- ✅ Visualizar detalhes dos editais

### Para Comissões Avaliadoras
- ✅ Avaliar inscrições pendentes
- ✅ Aprovar ou rejeitar candidatos
- ✅ Adicionar observações nas avaliações
- ✅ Dashboard com editais atribuídos

## 🏗️ Arquitetura

O projeto é dividido em três módulos principais:

```
edital/
├── edital_server/     # Backend Serverpod
├── edital_client/     # Cliente gerado automaticamente
└── edital_flutter/    # Frontend Flutter (Web)
```

### Backend (Serverpod)
- **Linguagem**: Dart
- **Framework**: Serverpod 2.9.0
- **Banco de dados**: PostgreSQL (configurável)
- **Autenticação**: Serverpod Auth
- **APIs**: REST endpoints gerados automaticamente

### Frontend (Flutter)
- **Linguagem**: Dart
- **Framework**: Flutter 3.24.0+
- **Plataforma**: Web (responsivo)
- **Estado**: Provider pattern
- **Navegação**: Go Router
- **UI**: Material Design

## 🚀 Como Executar

### Pré-requisitos

1. **Flutter SDK** (3.24.0+)
2. **Dart SDK** (incluído no Flutter)
3. **PostgreSQL** (para produção) ou **Docker** (para desenvolvimento)

### 1. Configurar e Executar o Backend

```bash
# Navegar para o diretório do servidor
cd edital_server

# Instalar dependências
dart pub get

# Executar o servidor (desenvolvimento)
dart bin/main.dart

# O servidor estará disponível em http://localhost:8080
```

### 2. Executar o Frontend

```bash
# Navegar para o diretório do Flutter
cd edital_flutter

# Instalar dependências
flutter pub get

# Executar a aplicação web
flutter run -d chrome

# Ou acessar diretamente em http://localhost:8080 se preferir
```

## 📋 Primeiros Passos

### 1. Criar Usuário Administrador
1. Acesse a aplicação no navegador
2. Clique em "Criar nova conta"
3. Selecione "Administrador" como tipo de usuário
4. Preencha os dados e confirme

### 2. Criar um Edital
1. Faça login como administrador
2. Vá para "Gerenciar Editais"
3. Clique em "+" para criar novo edital
4. Preencha título, descrição e datas
5. Salve e publique o edital

### 3. Configurar Comissão Avaliadora
1. Vá para "Gerenciar Comissões"
2. Encontre o edital criado
3. Adicione membros à comissão
4. Defina papéis (Coordenador/Membro)

### 4. Testar como Candidato
1. Crie nova conta como "Candidato"
2. Visualize editais disponíveis
3. Inscreva-se em um edital
4. Acompanhe o status da inscrição

### 5. Testar como Comissão
1. Faça login como membro da comissão
2. Acesse "Avaliar Inscrições"
3. Aprove ou rejeite inscrições
4. Adicione observações

## 🛠️ Desenvolvimento

### Estrutura do Backend

```
edital_server/lib/src/
├── endpoints/              # Endpoints da API
│   ├── user_endpoint.dart
│   ├── notice_endpoint.dart
│   ├── registration_endpoint.dart
│   └── evaluation_committee_endpoint.dart
├── generated/             # Classes geradas automaticamente
└── models/               # Modelos de dados
```

### Estrutura do Frontend

```
edital_flutter/lib/
├── providers/            # Gerenciamento de estado
├── screens/             # Telas organizadas por funcionalidade
│   ├── auth/           # Autenticação
│   ├── admin/          # Administrador
│   ├── user/           # Candidato
│   └── committee/      # Comissão
├── widgets/            # Componentes reutilizáveis
└── utils/              # Utilitários e configurações
```

### Adicionando Novas Funcionalidades

1. **Backend**: Adicione endpoints em `edital_server/lib/src/endpoints/`
2. **Frontend**: Crie telas em `edital_flutter/lib/screens/`
3. **Regenerar cliente**: Execute `serverpod generate` após mudanças no backend

## 🔧 Configurações Avançadas

### Variáveis de Ambiente

```bash
# Para desenvolvimento local
SERVER_URL=http://localhost:8080/

# Para produção
SERVER_URL=https://sua-api.com/
```

### Build para Produção

```bash
# Backend (Docker)
cd edital_server
docker build -t edital-backend .

# Frontend (Web)
cd edital_flutter
flutter build web --dart-define=SERVER_URL=https://sua-api.com/
```

## 📚 Documentação Adicional

- [Flutter Documentation](https://docs.flutter.dev/)
- [Serverpod Documentation](https://docs.serverpod.dev/)
- [Material Design](https://material.io/design)

## 🤝 Contribuição

1. Faça fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/nova-funcionalidade`)
3. Commit suas mudanças (`git commit -m 'Adiciona nova funcionalidade'`)
4. Push para a branch (`git push origin feature/nova-funcionalidade`)
5. Abra um Pull Request

## 📄 Licença

Este projeto é desenvolvido para fins educacionais e de demonstração.

## 🆘 Suporte

Para dúvidas ou problemas:
1. Consulte a documentação nos diretórios específicos
2. Verifique as issues existentes
3. Abra uma nova issue descrevendo o problema

---

**Desenvolvido com ❤️ usando Flutter e Serverpod**