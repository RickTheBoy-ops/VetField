# VetField 🐾

**VetField** é um ecossistema digital completo que revoluciona o cuidado veterinário, conectando tutores a profissionais de saúde animal através de uma plataforma segura, intuitiva e reativa.

> **Status:** 🚀 Em desenvolvimento ativo (v1.0.0+1)

## ✨ Destaques da Arquitetura
Este projeto segue os princípios da **Clean Architecture**, garantindo escalabilidade e testabilidade.
- **Camadas Separadas:** Domain (Regras de Negócio), Data (Repositórios e Datasources) e Presentation (UI e Providers).
- **Injeção de Dependência:** Gerenciada nativamente pelo **Riverpod 2.0**.
- **Reatividade Extrema:** Uso de `StreamProvider` e `AsyncNotifier` para atualizações em tempo real (ex: status de autenticação e agendamentos).
- **Segurança:** Dados sensíveis isolados e validação robusta no client-side e server-side.

---

## 📱 Funcionalidades Detalhadas

### 🔐 Módulo de Autenticação & Segurança
- **Login Híbrido:** Suporte para E-mail/Senha, CPF e CRMV (para profissionais).
- **Biometria:** Acesso rápido via impressão digital ou FaceID (`local_auth`).
- **Recuperação de Conta:** Fluxo completo de "Esqueci minha senha".
- **Sessão Persistente:** Gerenciamento automático de tokens e refresh com Supabase Auth.
- **Proteção de Rotas:** Redirecionamento inteligente baseado no estado de autenticação (Guardas de Rota com GoRouter).

### 🏠 Home & Navegação (Tutor)
- **Dashboard Interativo:** Acesso rápido a categorias, próximos agendamentos e veterinários recomendados.
- **Navegação Fluida:** Barra de navegação inferior persistente com transições suaves.
- **Feedbacks Visuais:** Snackbars, Shimmers e indicadores de carregamento para melhor UX.

### 📅 Gestão de Agendamentos
- **Fluxo de Booking:** Seleção intuitiva de serviços (Consulta, Vacina, Exame, Cirurgia), datas e horários.
- **Meus Tratamentos:**
  - **Em Breve:** Lista de compromissos futuros com cartões detalhados.
  - **Histórico:** Registro completo de atendimentos passados.
- **Ações Rápidas:** Cancelamento e Remarcação de consultas com um toque.
- **Resiliência:** Tratamento de erros de conexão e estados vazios amigáveis.

### 🗺️ Geolocalização & Busca
- **Mapa Veterinário:** Visualização de clínicas e profissionais próximos usando Google Maps.
- **Filtros Avançados:** Busca por especialidade, preço, avaliação e distância.
- **Integração VetRide:** Solicite transporte (Uber/99) diretamente para o endereço da clínica.

### 🐾 Gestão de Pets
- **Perfil do Animal:** Cadastro completo com foto, raça, espécie e dados vitais.
- **Linha do Tempo de Saúde:** Histórico cronológico de vacinas e intervenções.

### 👨‍⚕️ Módulo Veterinário (Profissional)
- **Dashboard de Gestão:** Visão geral do dia e solicitações pendentes.
- **Agenda Dinâmica:** Controle total sobre horários disponíveis.
- **Prontuário Digital:** Acesso e edição do histórico médico dos pacientes.

---

## 🛠️ Stack Tecnológico

| Categoria | Tecnologias |
|-----------|-------------|
| **Linguagem** | Dart 3.0+ |
| **Framework** | Flutter 3.10+ |
| **Gerência de Estado** | **Riverpod** (Annotation & Code Gen) |
| **Backend as a Service** | **Supabase** (PostgreSQL, Auth, Realtime) |
| **Navegação** | **GoRouter** 14.0+ |
| **Mapas** | Google Maps Flutter |
| **Localização** | Geolocator |
| **Persistência Local** | Hive (NoSQL rápido) |
| **Testes** | Flutter Test, Mockito |

---

## 🚀 Como Executar o Projeto

### Pré-requisitos
- Flutter SDK (Stable)
- Conta no Supabase

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

3. **Configuração de Ambiente (.env)**
   Crie um arquivo `.env` na raiz:
   ```env
   SUPABASE_URL=sua_url
   SUPABASE_ANON_KEY=sua_chave
   GOOGLE_MAPS_API_KEY=sua_chave
   ```

4. **Gerar Códigos (Riverpod/Freezed)**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

5. **Executar**
   ```bash
   flutter run
   ```

---

## 🤝 Contribuição
Pull Requests são bem-vindos. Para mudanças importantes, abra uma issue primeiro para discutir o que você gostaria de mudar.

---

<div align="center">
  <sub>Desenvolvido com 💚 por RickTheBoy-ops & Arquitetura VetField</sub>
</div>
