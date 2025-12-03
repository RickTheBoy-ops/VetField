# VetField 🐾

**VetField** é um aplicativo moderno em Flutter desenvolvido para conectar tutores de pets a profissionais veterinários. Ele simplifica o processo de encontrar veterinários, agendar consultas e gerenciar o histórico de saúde dos seus animais de estimação.

## 📱 Funcionalidades

### 👤 Para Tutores (Donos de Pets)
- **Encontrar Veterinários:** Busque veterinários por localização, especialidade, preço e avaliação.
- **Mapa Interativo:** Visualize clínicas e veterinários próximos em um mapa do Google com marcadores personalizados.
- **Agendamento de Consultas:** Marque consultas facilmente com disponibilidade em tempo real.
- **Linha do Tempo de Saúde:** Acompanhe vacinas, exames e histórico médico do seu pet em uma linha do tempo visual.
- **Modo SOS:** Encontre rapidamente o veterinário disponível mais próximo em casos de emergência.
- **VetRide:** Integração com Uber para solicitar transporte até a clínica.

### 👨‍⚕️ Para Veterinários
- **Painel de Controle:** Gerencie consultas e visualize sua agenda diária.
- **Prontuários:** Acesse o histórico de saúde dos pets e detalhes dos tutores.
- **Disponibilidade:** Defina horários de atendimento e gerencie tipos de consulta.

## 🛠️ Tecnologias Utilizadas

- **Framework:** [Flutter](https://flutter.dev/) (Dart)
- **Gerenciamento de Estado:** [Riverpod](https://riverpod.dev/) (Code Generation & AsyncNotifier)
- **Backend & Autenticação:** [Supabase](https://supabase.com/) (PostgreSQL, Auth, Realtime, Edge Functions)
- **Navegação:** [GoRouter](https://pub.dev/packages/go_router)
- **Mapas:** [Google Maps Flutter](https://pub.dev/packages/google_maps_flutter)
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
├── features/        # Arquitetura baseada em features (Auth, Appointment, Owner, Health, Vet)
│   ├── data/        # Repositórios, Data Sources, Models
│   ├── domain/      # Entidades, Casos de Uso, Interfaces de Repositório
│   └── presentation/# Telas, Widgets, Providers (Controllers)
├── screens/         # Telas gerais (Splash, Onboarding, Navegação)
└── widgets/         # Componentes de UI compartilhados
```

## 🤝 Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para enviar um Pull Request.

1. Faça um Fork do projeto
2. Crie sua branch de feature (`git checkout -b feature/MinhaFeatureIncrivel`)
3. Comite suas mudanças (`git commit -m 'Adiciona alguma feature incrível'`)
4. Dê um Push para a branch (`git push origin feature/MinhaFeatureIncrivel`)
5. Abra um Pull Request
