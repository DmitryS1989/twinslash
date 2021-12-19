# README
https://sheltered-beach-21528.herokuapp.com
admin: login: movs1989@gmail.com pass: 123789
user: login: movs1989@mail.ru pass: 123456
1+-) использовать гем rubocop, подключить, запустить, исправить замечания(непонятно что делать с некоторыми блоками)
6-) https://github.com/DmitryS1989/twinslash/blob/main/spec/requests/ads_controllers_spec.rb#L7 - для таких вещей лучше использовать shared_examples - https://relishapp.com/rspec/rspec-core/docs/example-groups/shared-examples
8-) https://github.com/DmitryS1989/twinslash/tree/main/spec/requests - в целом очень мало тестов, мало различных ситуаций протестировано
17-) https://github.com/DmitryS1989/twinslash/blob/main/app/controllers/ads_controller.rb#L92 - для авторизации нужно использовать gem cancancan или аналогичный
22-) https://github.com/DmitryS1989/twinslash/blob/main/app/views/ads/_form.html.haml#L33 - js должен быть в js файлах :)
( Java script в процессе познания :) )
23-) https://github.com/DmitryS1989/twinslash/blob/main/app/views/ads/_form.html.haml#L37 - строка обьявления цикла должна содержать в себе только условия цикла и итератор, - f = files[i]; присвоения должны быть в теле цикла, а не в условиях
( Java script в процессе познания :) )
26*) при попытке создать новое обьявление на форме нету поля Content, если нажать сохранить с путыми полями, ничего не происходит, никаких ошибок не видно, в ответе 200 код, выбрал теги, добавил две картинки - нажал сохранить получил системную ошибку - We're sorry, but something went wrong, при выборе картинок по новой, они добавляются в превью, при этом старые из превью не убираются, в общем создать обьявление не получается.
(Долго ломал голову в чем дело...А нужно просто отключить adblock... Как руки  дойдут обязательно поменяю Content на простое Body :) )
27-) https://github.com/DmitryS1989/twinslash/blob/main/app/models/ad.rb#L51 - тут какая то каша joins + preload + includes, не понятно почему не что-то одно, и зачем все вместе.
