<?php
header("Content-type: text/html; charset=utf-8");
$yourName = 'none';
$to = 'joistick11@gmail.com, russell-flame@mail.ru';
$mailit;
//**********************************************

// Скрытые
if(($_POST['telephone'] != '' || $_POST['email'] != '') && $_POST['flag'] == 'hidden'){
    $type = $_POST['type'];
    
        
    $what = "Поступила новая заявка!\n\nИсточник: $type \nИмя: " . $_POST['name'] . "\nТелефон: " . $_POST['telephone'] . "\nE-mail: " . $_POST['email'];
    $subj = "Новая заявка!";
    $mailit = mail($to, $subj, $what,
"Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit" );
	if ( @$mailit ){
	   $result = true;
	}
		if($result == true){
			echo 0; //Ваша заявка принята. Менеджер свяжется с Вами в ближайшее время.
		}
        else
        {
			echo 1; //Сообщение не отправлено...
        }
}
// Вопросы по E-mail
if(($_POST['email'] != '') && $_POST['flag'] == 'email_questions'){
    $type = 'Появились вопросы (E-mail)';
    $what = "Поступила новая заявка!\n\nИсточник: $type \nE-mail: " . $_POST['email'];
    $subj = "Новая заявка!";
    $mailit = mail($to, $subj, $what,
        "Content-Type: text/plain; charset=utf-8
        Content-Transfer-Encoding: 8bit" );
    if ( @$mailit ){
        $result = true;
    }
    if($result == true){
        echo 0; //Ваша заявка принята. Менеджер свяжется с Вами в ближайшее время.
    }
    else
    {
        echo 1; //Сообщение не отправлено...
    }
}
?>      	
