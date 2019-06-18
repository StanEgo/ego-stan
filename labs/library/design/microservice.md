## Определения
* "Microservice is an independently deployable component of bounded scope that
  supports interoperability through message-based communication. Microservice
  architecture is a style of engineering highly automated, evolvable software
  systems made up of capability-aligned microservices."
  Microservice Architecture, O'Reilly

## Inbox
* Если следовать из идей дизайна, скажем SOLID, сервис не должен иметь ни
  малейшего понятия о том, как он коммуницирует с другими сервисами и как он
  развернут. Здесь это может быть одно монолитное приложение с inprocess
  коммуникациями через LMAX Disruptor, а там - кластер из контейнеров с Kafka
  между ними. Возможно, проблема заключается в том, что не лежит на поверхности
  некоторый универсальный низкоуровневой интерфейс вроде FFI, который был бы
  доступен всем языковым экосистемам и первым простым решением в голову пришёл
  REST.
