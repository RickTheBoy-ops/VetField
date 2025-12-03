# VetField Flutter – Changelog

## 2025-12-03

- Telemedicina
  - Adiciona `completeCall` no data source, repositório e controller para marcar `video_calls.status = completed`.
  - Reforça fluxo de conclusão no painel do Vet ao finalizar atendimento.

- Agenda do Tutor
  - Cancela agendamentos com feedback e atualização em tempo real.
  - Remarca agendamentos com seleção de data/hora e aviso ao usuário.
  - Modal de detalhes do agendamento (serviço, vet, data/hora, status, observações).

- Painel do Veterinário
  - Confirmações para recusar/concluir.
  - Remarcação com seleção de data/hora.
  - Teleconsulta com Jitsi (abrir via URL externa).
  - Modal de detalhes do agendamento.

- Domínio e Data Layer
  - `AppointmentRemoteDataSource`: adiciona `updateAppointmentDateTime`.
  - `AppointmentRepository`: adiciona `updateAppointmentDateTime`.
  - `AppointmentController`: adiciona `reschedule`.
  - `CallRemoteDataSource`: adiciona `completeCall`.
  - `CallRepository`: adiciona `completeCall`.
  - `CallController`: adiciona `complete`.

- Testes
  - `test/features/appointment/data/repositories/appointment_repository_impl_test.dart`.
  - `test/features/call/data/repositories/call_repository_impl_test.dart`.
  - Todos os testes passam: `flutter test`.

- Lint
  - `flutter analyze` sem issues.

- Notas
  - RLS supabase mantém segurança de update/seleção para vet/tutor.
  - Integração Jitsi via URL simples (sem SDK/JWT nesta etapa).

