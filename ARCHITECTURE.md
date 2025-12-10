# Arquitetura do Sistema VetField

Este diagrama representa a estrutura arquitetural do projeto **VetField**, mapeando desde as fontes de dados até a apresentação ao usuário, inspirado em sistemas de processamento de dados em camadas.

```mermaid
graph TD
    %% Estilos Globais
    classDef container fill:#1e1e1e,stroke:#333,stroke-width:2px,color:#fff;
    classDef source fill:#2d3436,stroke:#b2bec3,stroke-width:1px,color:#dfe6e9;
    classDef knowledge fill:#0984e3,stroke:#74b9ff,stroke-width:2px,color:#fff;
    classDef processing fill:#d63031,stroke:#ff7675,stroke-width:2px,color:#fff;
    classDef synthesis fill:#6c5ce7,stroke:#a29bfe,stroke-width:2px,color:#fff;
    classDef output fill:#00b894,stroke:#55efc4,stroke-width:2px,color:#fff;

    %% Camada 1: Data Sources (Fontes de Dados)
    subgraph Data_Layer [Data Sources & Inputs]
        direction LR
        Supabase[Supabase Cloud DB]:::source
        Hive[Hive Local Cache]:::source
        Sensors[Sensors (Camera/GPS)]:::source
        ExtAPI[External APIs (Maps/Stripe)]:::source
    end

    %% Camada 2: Central Knowledge (Repositórios)
    subgraph Knowledge_Layer [Central Knowledge Access]
        Repository[Repositories Implementation\n(Data Arbitration)]:::knowledge
    end

    %% Camada 3: AI & Processing (Lógica)
    subgraph Processing_Layer [Intelligence & Logic Layer]
        OCR[ML Kit OCR Engine]:::processing
        UseCases[Clean Arch UseCases]:::processing
        State[Riverpod State Manager]:::processing
        Validation[Business Validation]:::processing
    end

    %% Camada 4: Synthesis (Módulos de Feature)
    subgraph Synthesis_Layer [Feature Synthesis Engine]
        VetMod[Vet Services Module]:::synthesis
        HealthMod[Health & Records]:::synthesis
        SocialMod[Social & Explore]:::synthesis
        AdsMod[Ads & Analytics]:::synthesis
    end

    %% Camada 5: Output (Apresentação)
    subgraph Output_Layer [User Experience Output]
        Dashboard[Vet Dashboard]:::output
        MapUI[Interactive Map]:::output
        Timeline[Health Timeline]:::output
        Notify[Smart Notifications]:::output
        AppUI[Mobile/Web Interface]:::output
    end

    %% Conexões
    Supabase <--> Repository
    Hive <--> Repository
    Sensors --> Repository
    ExtAPI <--> Repository

    Repository --> UseCases
    Repository --> OCR

    OCR --> UseCases
    UseCases --> Validation
    Validation --> State

    State --> VetMod
    State --> HealthMod
    State --> SocialMod
    State --> AdsMod

    VetMod --> Dashboard
    VetMod --> MapUI
    HealthMod --> Timeline
    SocialMod --> Notify
    AdsMod --> Dashboard
    
    VetMod --> AppUI
    HealthMod --> AppUI
    SocialMod --> AppUI
    AdsMod --> AppUI

    %% Formatação do Gráfico
    style Data_Layer fill:#2d3436,stroke:#636e72,color:#fff
    style Knowledge_Layer fill:#2d3436,stroke:#636e72,color:#fff
    style Processing_Layer fill:#2d3436,stroke:#636e72,color:#fff
    style Synthesis_Layer fill:#2d3436,stroke:#636e72,color:#fff
    style Output_Layer fill:#2d3436,stroke:#636e72,color:#fff
```

## Descrição das Camadas

1.  **Data Sources & Inputs:**
    *   **Supabase:** Backend principal para persistência, autenticação e realtime.
    *   **Hive:** Banco de dados local NoSQL para cache offline e persistência rápida.
    *   **Sensors:** Acesso a hardware (Câmera para OCR, GPS para mapas).
    *   **External APIs:** Integrações com Google Maps, Stripe (Pagamentos), etc.

2.  **Central Knowledge Access (Repositories):**
    *   Atua como a "Single Source of Truth".
    *   Gerencia a decisão de buscar dados locais (Hive) ou remotos (Supabase).
    *   Abstrai a complexidade das fontes de dados para o resto do app.

3.  **Intelligence & Logic Layer:**
    *   **ML Kit OCR:** Processamento inteligente de imagens para leitura de vacinas.
    *   **Use Cases:** Regras de negócio puras (Clean Architecture).
    *   **Riverpod:** Gerenciamento de estado reativo e injeção de dependência.

4.  **Feature Synthesis Engine:**
    *   Agrupamento lógico das funcionalidades (Vet, Health, Social, Ads).
    *   Onde a lógica de negócios se encontra com o estado da aplicação.

5.  **User Experience Output:**
    *   As interfaces finais entregues ao usuário (Dashboards, Mapas, Timelines).
