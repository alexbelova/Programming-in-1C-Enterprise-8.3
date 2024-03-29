﻿
Процедура Печать(ТабДок, Ссылка) Экспорт
	//{{_КОНСТРУКТОР_ПЕЧАТИ(Печать)
	Макет = Документы.ПоступлениеТоваров.ПолучитьМакет("Печать");
	Запрос = Новый Запрос;
	Запрос.Текст =
	"ВЫБРАТЬ
	|	ПоступлениеТоваров.Дата,
	|	ПоступлениеТоваров.Номер,
	|	ПоступлениеТоваров.Филиал,
	|	ПоступлениеТоваров.Фирма,
	|	ПоступлениеТоваров.ПереченьТоваров.(
	|		Товар,
	|		Цена,
	|		Количество,
	|		Сумма
	|	)
	|ИЗ
	|	Документ.ПоступлениеТоваров КАК ПоступлениеТоваров
	|ГДЕ
	|	ПоступлениеТоваров.Ссылка В (&Ссылка)";
	Запрос.Параметры.Вставить("Ссылка", Ссылка);
	Выборка = Запрос.Выполнить().Выбрать();

	ОбластьЗаголовок = Макет.ПолучитьОбласть("Заголовок");
	Шапка = Макет.ПолучитьОбласть("Шапка");
	ОбластьПереченьТоваровШапка = Макет.ПолучитьОбласть("ПереченьТоваровШапка");
	ОбластьПереченьТоваров = Макет.ПолучитьОбласть("ПереченьТоваров");
	ТабДок.Очистить();

	ВставлятьРазделительСтраниц = Ложь;
	Пока Выборка.Следующий() Цикл
		Если ВставлятьРазделительСтраниц Тогда
			ТабДок.ВывестиГоризонтальныйРазделительСтраниц();
		КонецЕсли;

		ТабДок.Вывести(ОбластьЗаголовок);

		Шапка.Параметры.Заполнить(Выборка);
		ТабДок.Вывести(Шапка, Выборка.Уровень());

		ТабДок.Вывести(ОбластьПереченьТоваровШапка);
		ВыборкаПереченьТоваров = Выборка.ПереченьТоваров.Выбрать();
		Пока ВыборкаПереченьТоваров.Следующий() Цикл
			ОбластьПереченьТоваров.Параметры.Заполнить(ВыборкаПереченьТоваров);
			ТабДок.Вывести(ОбластьПереченьТоваров, ВыборкаПереченьТоваров.Уровень());
		КонецЦикла;

		ВставлятьРазделительСтраниц = Истина;
	КонецЦикла;
	//}}
КонецПроцедуры
