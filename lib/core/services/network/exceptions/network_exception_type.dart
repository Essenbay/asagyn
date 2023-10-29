enum NetworkExceptionTypes {
  /// Вызывается если нету доступа в интернет
  connectivity,

  /// Вызывается при тайм ауте запроса
  timeOut,

  /// Вызывается при общих ошибках
  type,

  /// Вызывается при общих ошибках
  notFound,

  /// Вызывается когда не аутентифицирован
  unAuthenticated,

  /// Вызывается при ошибках сервера
  serverError,

  ///Неизвестная ошибка
  unknown;
}
