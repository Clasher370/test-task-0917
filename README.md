#work in progress

### Решение

- [x] Должно назначать число
> curl http://localhost:3000/api/sync/users/start
> или
> User.start_work
- [x] Возможность останавливать
> curl http://localhost:3000/api/sync/users/stop
> или
> User.stop_work
> или остановка sidekiq
- [ ] Быть устойчивам к исключениям
- [x] Масштабируемым
> bundle exec sidekiq -c (количество потоков)
- [ ] Время завершения
- [x] Работать на реальной рабочей системе
- [x] Необработанные записи 
> http://localhost:3000/api/sync/users/count
