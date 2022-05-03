
class UserOption {
  final String icon;
  final String title;

  UserOption({
    required this.icon,
    required this.title,
  });
}

final listUserOption =  [
  UserOption(
    icon: 'assets/images/messenger.png',
    title: 'Чат с менеджером',
  ),
  UserOption(
    icon: 'assets/images/text_message.png',
    title: "Вопросы и ответы",
  ),
  UserOption(
    icon: 'assets/images/paper_clip.png',
    title: 'Добавить файлы',
  ),
  UserOption(
    icon: 'assets/images/letter.png',
    title: 'Добавить реквизиты компании',
  ),
  UserOption(
    icon: 'assets/images/letter_read.png',
    title: 'Условия доставки и оплаты',
  ),
  UserOption(
    icon: 'assets/images/headset.png',
    title: 'Контакты компании',
  ),
  UserOption(
    icon: 'assets/images/internet.png',
    title: 'Адреса доставок',
  ),
  UserOption(
    icon: 'assets/images/notepad.png',
    title: 'Тип каталога',
  ),
];