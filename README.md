# VetField 🐾

**VetField** é um aplicativo moderno em Flutter desenvolvido para conectar tutores de pets a profissionais veterinários. Ele simplifica o processo de encontrar veterinários, agendar consultas e gerenciar o histórico de saúde dos seus animais de estimação.

## 📱 Funcionalidades Completas

### 🔍 Busca e Exploração
- **Busca Avançada:** Encontre veterinários e clínicas por nome, especialidade, localização, faixa de preço e avaliação mínima.
- **Filtros Inteligentes:** Refine sua busca com filtros de raio de distância (km), disponibilidade e tipo de atendimento.
- **Mapa Interativo:** Visualize profissionais próximos no Google Maps com marcadores personalizados e agrupamento.
- **Tela Explorar:** Descubra artigos, dicas de saúde e novidades do mundo pet.

### 🏥 Clínicas e Veterinários
- **Perfil Detalhado:** Visualize informações completas do veterinário ou clínica, incluindo biografia, especialidades e fotos.
- **Detalhes da Clínica:** Página dedicada com informações sobre a infraestrutura, serviços oferecidos e equipe.
- **Avaliações:** Sistema de rating e comentários para ajudar na escolha do melhor profissional.
- **VetRide:** Integração direta com Uber para solicitar transporte até a clínica ou consultório.

### 📅 Agendamento e Consultas
- **Reserva Fácil:** Selecione datas e horários disponíveis em tempo real.
- **Meus Agendamentos:** Acompanhe consultas futuras, passadas e canceladas.
- **Status da Consulta:** Atualizações em tempo real sobre o status do agendamento (confirmado, pendente, concluído).

### 🐾 Saúde do Pet
- **Linha do Tempo de Saúde:** Histórico visual completo de vacinas, exames, cirurgias e consultas do seu pet.
- **Prontuário Digital:** Acesso fácil aos dados médicos do animal.

### 👨‍⚕️ Área do Veterinário
- **Dashboard Profissional:** Visão geral dos agendamentos do dia e solicitações pendentes.
- **Gestão de Agenda:** Calendário interativo para visualizar e gerenciar horários.
- **Prescrições:** Emissão e visualização de receitas médicas digitais.
- **Perfil Profissional:** Edição de dados, especialidades e preços.

### 🔐 Autenticação e Perfil
- **Login Seguro:** Autenticação via E-mail/Senha e Biometria.
- **Gestão de Perfil:** Edição de dados pessoais, foto de perfil e preferências.
- **Onboarding:** Telas introdutórias para novos usuários.

## 🛠️ Tecnologias Utilizadas

- **Framework:** [Flutter](https://flutter.dev/) (Dart)
- **Gerenciamento de Estado:** [Riverpod](https://riverpod.dev/) (Code Generation & AsyncNotifier)
- **Backend & Autenticação:** [Supabase](https://supabase.com/) (PostgreSQL, Auth, Realtime, Edge Functions)
- **Navegação:** [GoRouter](https://pub.dev/packages/go_router)
- **Mapas:** [Google Maps Flutter](https://pub.dev/packages/google_maps_flutter)
- **Localização:** `geolocator` para serviços de GPS.
- **Geração de Código:** `build_runner`, `freezed`, `json_serializable`, `riverpod_generator`

## 🚀 Como Iniciar

### Pré-requisitos
- Flutter SDK (Última versão estável)
- Dart SDK
- Conta e Projeto no Supabase

### Instalação

1. **Clone o repositório**
   ```bash
   git clone https://github.com/RickTheBoy-ops/VetField.git
   cd VetField/vetfield_flutter
   ```

2. **Instale as Dependências**
   ```bash
   flutter pub get
   ```

3. **Configuração de Ambiente**
   Crie um arquivo `.env` na raiz do projeto e adicione suas credenciais do Supabase:
   ```env
   SUPABASE_URL=sua_url_supabase
   SUPABASE_ANON_KEY=sua_chave_anonima_supabase
   GOOGLE_MAPS_API_KEY=sua_chave_google_maps
   ```

4. **Geração de Código**
   Execute o build runner para gerar os arquivos necessários:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

5. **Executar o App**
   ```bash
   flutter run
   ```

## 📂 Estrutura do Projeto

```
lib/
├── core/            # Utilitários, temas, rotas e providers compartilhados
├── features/        # Arquitetura baseada em features
│   ├── appointment/ # Agendamento, Booking
│   ├── auth/        # Login, Registro, Perfil
│   ├── call/        # Funcionalidades de chamada (em desenvolvimento)
│   ├── health/      # Linha do tempo de saúde
│   ├── owner/       # Mapa, Busca de Vets
│   └── vet/         # Dashboard, Calendário, Prescrição
├── screens/         # Telas gerais e de navegação
│   ├── clinic_details/ # Detalhes da clínica
│   ├── doctor/         # Detalhes do médico
│   ├── explore/        # Tela de exploração
│   ├── search/         # Tela de busca
│   └── ...
└── widgets/         # Componentes de UI compartilhados
```

## 🤝 Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para enviar um Pull Request.

1. Faça um Fork do projeto
2. Crie sua branch de feature (`git checkout -b feature/MinhaFeatureIncrivel`)
3. Comite suas mudanças (`git commit -m 'Adiciona alguma feature incrível'`)
4. Dê um Push para a branch (`git push origin feature/MinhaFeatureIncrivel`)
5. Abra um Pull Request
