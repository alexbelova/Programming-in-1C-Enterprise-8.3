﻿
Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!

	// регистр РасчетыСФирмами Расход
	Движения.РасчетыСФирмами.Записывать = Истина;
	Для Каждого ТекСтрокаПриходСредств Из ПриходСредств Цикл
		Движение = Движения.РасчетыСФирмами.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
		Движение.Период = Дата;
		Движение.Фирма = ТекСтрокаПриходСредств.Фирма;
        Движение.Сумма = ТекСтрокаПриходСредств.Сумма;
	КонецЦикла;

	// регистр РасчетыСФирмами Приход
	Движения.РасчетыСФирмами.Записывать = Истина;
	Для Каждого ТекСтрокаРасходСредств Из РасходСредств Цикл
		Движение = Движения.РасчетыСФирмами.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
		Движение.Период = Дата;
		Движение.Фирма = ТекСтрокаРасходСредств.Фирма;
        Движение.Сумма = ТекСтрокаРасходСредств.Сумма;
	КонецЦикла;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры