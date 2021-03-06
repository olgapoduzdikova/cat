
jQuery.extend(jQuery.validator.messages, {
	required: "Это поле обязательно для заполнения.",
	remote: "Пожалуйста, исправьте эту запись.",
	email: "Пожалуйста, введите действительный адрес электронной почты.",
	url: "Введите действительный URL.",
	date: "Пожалуйста, введите действительную дату.",
	dateISO: "Пожалуйста, введите правильную дату (ISO ).",
	number: "Пожалуйста, введите число .",
	digits: "Пожалуйста, введите только цифры ",
	creditcard: "Пожалуйста, введите номер кредитной карты .",
	equalTo: "Пожалуйста, подтвердите введенные данные.",
	accept: "Пожалуйста, введите файл с правильным расширением .",
	maxlength: jQuery.validator.format("Пожалуйста, введите большинство символов {0} ."),
	minlength: jQuery.validator.format("Пожалуйста, введите по крайней мере, {0} символов ."),
	rangelength: jQuery.validator.format("Пожалуйста, введите от { 0 } до {1} символов ."),
	range: jQuery.validator.format("Пожалуйста, введите значение от { 0 } до { 1 } ."),
	max: jQuery.validator.format("Пожалуйста, введите значение меньше или равно { 0 } ."),
	min: jQuery.validator.format("Пожалуйста, введите значение, большее или равное { 0 } .")
});