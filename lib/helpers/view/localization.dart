class Localization {

  static String locale = "ru";


  static Map<String, Map<String, String>> words = {
    'ru': {
      'titleProfile' : 'Профиль',
      'titleRestaurants': 'Заведения',
      'titleOrders': 'Заказы',
      'titleOrder' : 'Заказ',
      'titleOrderDetails' : 'Детали заказа',
      'titleMenu': 'Меню',
      'titleCart': 'Корзина',
      'titleOrderHistory': 'История заказов',
      'titleMap': 'Карта',

      'buttonBuy' : 'КУПИТЬ',
      'buttonAddToCart': 'В КОРЗИНУ',
      'buttonProcessOrder': 'ОПЛАТА',
      'buttonDate': 'ДАТА',
      'buttonTime': 'ВРЕМЯ',
      'buttonPay': 'ОПЛАТИТЬ',
      'buttonFinishOrder': 'ЗАКОНЧИТЬ ЗАКАЗ',
      'buttonYes': 'ДА',
      'buttonNo': 'НЕТ',
      'buttonLogin': 'ВОЙТИ',
      'buttonForgotPassword': 'ЗАБЫЛ ПАРОЛЬ',
      'buttonOk': 'ОК',
      'buttonWithMe': 'С СОБОЙ',
      'buttonOnPlace': 'НА МЕСТЕ',
      'buttonSignUp': 'РЕГИСТРАЦИЯ',

      'textOrderReady': 'заказ будет готов через',
      'textAddress': 'Адрес',
      'textWhen' : 'Когда',
      'textMyOrder': 'Мой заказ',
      'textTotalPrice': 'Итого',
      'textInProcess' : 'В процессе',
      'textReady': 'Готов',
      'textNotPayed': 'Не оплачен',
      'textNoOrders': 'Нет заказов',
      'textOrderedAt': 'Сделан',
      'textRUB' : 'р',
      'textD': 'д',
      'textH': 'ч',
      'textM': 'м',
      'textKm': 'km',
      'textMin': 'мин',
      'textOpen' : 'Открыто',
      'textClosed': 'Закрыто',
      'textFarAway': 'Далеко',
      'textOpenTill' : 'Открыто до',
      'textItems': 'блюд',
      'textKcal': 'ккал',
      'textInformation': 'Информация',
      'textWeek': 'Неделя',
      'textMonth': 'Месяц',
      'textTotal': 'Всего',
      'textHistory': 'История',
      'textLogout': 'Выход',
      'textFinished': 'Успешно',
      'textRemove': 'Удалить',
      'textRemoveFromCart': 'Вы хотите удалить заказ из корзины?',
      'textEmail': 'Почта',
      'textNotValidEmail': 'Неверная почта',
      'textPassword': 'Пароль',
      'textShortPassword': 'Пароль слишком короткий',
      'textAddedToCart': 'добавлен в корзину',
      'textWrongItem': 'Ошибка',
      'textFullCart': 'Невозможно добавить в корзину. Пожалуйста, завершите текущий заказ',
      'textWhenAsk': 'Когда?',
      'textSelectDate': 'Пожалуйста, укажите дату и время',
      'textWrongTime': 'Неверное время',
      'textSelectDiffTime': 'Пожалуйста, выберете время в отрезке',
      'textError': 'Ошибка',
      'textTryAgain': 'Пожалуйста, попробуйте позже',
      'textSuccess': 'Успех',
      'textOrderCreated': 'Ваш заказ был создан',
      'textNoDate': 'Дата не указана',
      'textStatistics': 'Статистика',
      'textVisitedPlaces': 'Мест посещено',
      'textItemsOrdered': 'Блюд заказано',
      'textMoneySpent': 'Денег потрачено',
      'textMoneySaved': 'Денег сэкономлено',
      'textFirstName': 'Имя',
      'textLastName': 'Фамилия',
      'textEnterFirstName': 'Введите ваше имя',
      'textEnterLastName': 'Введите вашу фамилию',
      'textPhone': 'Телефон',
      'textEnterPhone': 'Введите валидный номер',
      'textAddSomeItems': 'Пожалуйста, добавьте блюда в корзину',
      'textEmptyCart': 'Пустая корзина',
      'textWrongEmailPass': 'Неверная почта или пароль',
      'textUnauthorized': 'Не авторизован',
      'textEmailTaken': 'Почта уже занята',
      'textNotRegistered': 'Ошибка',
      'textVariants': 'Варианты',
      'textPeopleCount': 'Количесто человек',
      'textOrder': 'Заказ',
      'textNotAdmin': 'Вы не являетесь администратором',
      'textCustomerTake': 'посетитель заберет заказ через',
      'textNewOrder': 'Новый заказ!',
    }
  };

  static String get titleProfile => words[locale]['titleProfile'];
  static String get titleRestaurants => words[locale]['titleRestaurants'];
  static String get titleOrders => words[locale]['titleOrders'];
  static String get titleOrder => words[locale]['titleOrder'];
  static String get titleOrderDetails => words[locale]['titleOrderDetails'];
  static String get titleMenu => words[locale]['titleMenu'];
  static String get titleCart => words[locale]['titleCart'];
  static String get titleOrderHistory => words[locale]['titleOrderHistory'];
  static String get titleMap => words[locale]['titleMap'];

  static String get buttonBuy => words[locale]['buttonBuy'];
  static String get buttonAddToCart => words[locale]['buttonAddToCart'];
  static String get buttonProcessOrder => words[locale]['buttonProcessOrder'];
  static String get buttonDate => words[locale]['buttonDate'];
  static String get buttonTime => words[locale]['buttonTime'];
  static String get buttonPay => words[locale]['buttonPay'];
  static String get buttonFinishOrder => words[locale]['buttonFinishOrder'];
  static String get buttonYes => words[locale]['buttonYes'];
  static String get buttonNo => words[locale]['buttonNo'];
  static String get buttonLogin => words[locale]['buttonLogin'];
  static String get buttonForgotPassword => words[locale]['buttonForgotPassword'];
  static String get buttonOk => words[locale]['buttonOk'];
  static String get buttonWithMe => words[locale]['buttonWithMe'];
  static String get buttonOnPlace => words[locale]['buttonOnPlace'];
  static String get buttonSignUp => words[locale]['buttonSignUp'];

  static String get textOrderReady => words[locale]['textOrderReady'];
  static String get textAddress => words[locale]['textAddress'];
  static String get textWhen => words[locale]['textWhen'];
  static String get textMyOrder => words[locale]['textMyOrder'];
  static String get textTotalPrice => words[locale]['textTotalPrice'];
  static String get textInProcess => words[locale]['textInProcess'];
  static String get textReady => words[locale]['textReady'];
  static String get textNotPayed => words[locale]['textNotPayed'];
  static String get textNoOrders => words[locale]['textNoOrders'];
  static String get textOrderedAt => words[locale]['textOrderedAt'];
  static String get textRUB => words[locale]['textRUB'];
  static String get textD => words[locale]['textD'];
  static String get textH => words[locale]['textH'];
  static String get textM => words[locale]['textM'];
  static String get textKm => words[locale]['textKm'];
  static String get textMin => words[locale]['textMin'];
  static String get textOpen => words[locale]['textOpen'];
  static String get textClosed => words[locale]['textClosed'];
  static String get textFarAway => words[locale]['textFarAway'];
  static String get textOpenTill => words[locale]['textOpenTill'];
  static String get textItems => words[locale]['textItems'];
  static String get textKcal => words[locale]['textKcal'];
  static String get textInformation => words[locale]['textInformation'];
  static String get textWeek => words[locale]['textWeek'];
  static String get textMonth => words[locale]['textMonth'];
  static String get textTotal => words[locale]['textTotal'];
  static String get textHistory => words[locale]['textHistory'];
  static String get textLogout => words[locale]['textLogout'];
  static String get textFinished => words[locale]['textFinished'];
  static String get textRemove => words[locale]['textRemove'];
  static String get textRemoveFromCart => words[locale]['textRemoveFromCart'];
  static String get textEmail => words[locale]['textEmail'];
  static String get textNotValidEmail => words[locale]['textNotValidEmail'];
  static String get textPassword => words[locale]['textPassword'];
  static String get textShortPassword => words[locale]['textPassword'];
  static String get textAddedToCart => words[locale]['textAddedToCart'];
  static String get textWrongItem => words[locale]['textWrongItem'];
  static String get textFullCart => words[locale]['textFullCart'];
  static String get textWhenAsk => words[locale]['textWhenAsk'];
  static String get textSelectDate => words[locale]['textSelectDate'];
  static String get textWrongTime => words[locale]['textWrongTime'];
  static String get textSelectDiffTime => words[locale]['textSelectDiffTime'];
  static String get textError => words[locale]['textError'];
  static String get textTryAgain => words[locale]['textTryAgain'];
  static String get textSuccess => words[locale]['textSuccess'];
  static String get textOrderCreated => words[locale]['textOrderCreated'];
  static String get textNoDate => words[locale]['textNoDate'];
  static String get textStatistics => words[locale]['textStatistics'];
  static String get textVisitedPlaces => words[locale]['textVisitedPlaces'];
  static String get textItemsOrdered => words[locale]['textItemsOrdered'];
  static String get textMoneySpent => words[locale]['textMoneySpent'];
  static String get textMoneySaved => words[locale]['textMoneySaved'];
  static String get textFirstName => words[locale]['textFirstName'];
  static String get textLastName => words[locale]['textLastName'];
  static String get textEnterFirstName => words[locale]['textEnterFirstName'];
  static String get textEnterLastName => words[locale]['textEnterLastName'];
  static String get textPhone => words[locale]['textPhone'];
  static String get textEnterPhone => words[locale]['textEnterPhone'];
  static String get textAddSomeItems => words[locale]['textAddSomeItems'];
  static String get textEmptyCart => words[locale]['textEmptyCart'];
  static String get textWrongEmailPass => words[locale]['textWrongEmailPass'];
  static String get textUnauthorized => words[locale]['textUnauthorized'];
  static String get textEmailTaken => words[locale]['textEmailTaken'];
  static String get textNotRegistered => words[locale]['textNotRegistered'];
  static String get textVariants => words[locale]['textVariants'];
  static String get textPeopleCount => words[locale]['textPeopleCount'];
  static String get textOrder => words[locale]['textOrder'];
  static String get textNotAdmin => words[locale]['textNotAdmin'];
  static String get textCustomerTake => words[locale]['textCustomerTake'];
  static String get textNewOrder => words[locale]['textNewOrder'];

}