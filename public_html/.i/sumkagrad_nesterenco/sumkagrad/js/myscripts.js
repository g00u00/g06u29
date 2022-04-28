//* Формирование номеров страниц *//
$(function(){
    /* Удаляем пустые страницы, если они получились*/
    $('.items_box').each(function(){
        if( $(this).html() == '') $(this).remove();
    });
    
    var number = $('.items_box').length;
    var pages_html = "<a href='#1' id='show_page_1' class='selected_page' onclick='changePage(1)'>1</a> ";
    for(var i=2; i <= number; i++){
        pages_html += "<a href='#1' id='show_page_" + i + "' onclick='changePage(" + i + ")'>" + i + "</a> ";
    }
    $('#pages').html(pages_html);
});
                    
//* Функция переключения страниц *//
function changePage(id){
    $('#pages a').removeClass('selected_page');
    $('#show_page_' + id).addClass('selected_page');
    $('.items_box').fadeOut(300);
    $('#page_' + id).fadeIn(600);
    $('html, body').stop().animate({scrollLeft: 0, scrollTop:$('#main_items_catalog h1').offset().top}, 1000);
}


//* Функция вызова модального окна*//
function showMore(id, table){
    $('#more_item .fade_div').html('1').fadeOut(10);
    $.get(
        "show_more.php",        // Функция получения данных из БД
        {
            id: id,
            table: table
        },
        refresh_data
    );
    function refresh_data(data){
        $("#more_item .fade_div").html(data);     // Меняем html код модального окна на только что полученный
    };
    $('#more_item').bPopup({
            onOpen: function() {
                setTimeout(function(){
                    $("#more_item .fade_div").fadeIn(400);
                }, 500);
            }
    });
};

//* Модальное окно звонка *//
function showCallModal(type){
    $('#call_type').text(type);
    $('#call_modal').bPopup({
	    easing: 'easeOutBack', //uses jQuery easing plugin
            speed: 450,
            transition: 'slideDown'
     });
}

// Обработчик СКРЫТОЙ формы
    $(function() {
    	$("#call_submit").click(function(){
    		var name = $("#call_name").val();
    		var telephone = $("#call_telephone").val();
    		var email = $("#call_email").val();
            var flag = "hidden";
            var type = $('#call_type').text();
            if ( telephone == '' && email == '' )
            {
                alert('Необходимо ввести какую-либо контактную информацию');
                return false;
            }
            else{				
    		$.ajax({
    			type: "POST",
    			url: "sendMessage.php",
    			data: {"name": name, "telephone": telephone, "email": email, "flag": flag, "type": type},
    			cache: false,						
    			success: function(response){
    				var messageResp = new Array('Ваша заявка принята. Менеджер свяжется с Вами в ближайшее время.','Что-то пошло не так... Попробуйте ещё раз.');
    				var resultStat = messageResp[Number(response)];
    				if(response == 0){
    					$("#call_name").val("");
    					$("#call_telephone").val("");
    					$("#call_email").val("");
    			     	$("#send_results").css({'display' : 'block', 'color' : 'green'}).text(resultStat).show().delay(1500).fadeOut(800);
                        $('#call_modal').bPopup().close();
    				}
                    if (response == 1)
                    {
                        $("#send_results").css({'display' : 'block', 'color' : 'red'}).text(resultStat).show().delay(1500).fadeOut(800);
                    }
    			}
    		});
    		return false;
    	   }			
    	});
    });

// Обработчик СКРЫТОЙ формы
$(function() {
    $("#email_questions_form").submit(function(e){
        e.preventDefault();
        var email = $("#email_questions_input").val();
        var flag = "email_questions";
        if ( email == '' )
        {
            alert('Необходимо ввести Ваш E-mail');
            return false;
        }
        else{
            $.ajax({
                type: "POST",
                url: "sendMessage.php",
                data: {"email": email, "flag": flag},
                cache: false,
                success: function(response){
                    var messageResp = new Array('Ваша заявка принята. Менеджер свяжется с Вами в ближайшее время.','Что-то пошло не так... Попробуйте ещё раз.');
                    var resultStat = messageResp[Number(response)];
                    if(response == 0){
                        $("#email_questions_input").val("");
                        $("#send_results").css({'display' : 'block', 'color' : 'green'}).text(resultStat).show().delay(1500).fadeOut(800);
                    }
                    if (response == 1)
                    {
                        $("#send_results").css({'display' : 'block', 'color' : 'red'}).text(resultStat).show().delay(1500).fadeOut(800);
                    }
                }
            });
            return false;
        }
    });
});

//* Разворачивание меню *//
$(function(){
    $("#main_items_catalog ul").mouseover(function(){
        $(this).stop().animate({'height' : '150px'}, 500);
    });
    $("#main_items_catalog ul").mouseleave(function(){
        $(this).animate({'height' : '20px'}, 500);
    });
});

// Счётчик
$(function(){
    var note = $('#note'),

        newYear = true;

    // if((new Date()) > ts){
    // The new year is here! Count towards something else.
    // Notice the *1000 at the end - time must be in milliseconds
    // 	ts = (new Date()).getTime() + 10*24*60*60*1000;
    // 	newYear = false;
    // }
    ts = new Date(2020, 12, 03, 24, 00, 00);
    //ts = (new Date()).getTime() + 5*24*60*60*1000;
    $('#countdown').countdown({
        timestamp	: ts,
        callback	: function(days, hours, minutes, seconds){
            var message = "";
            message += days + " day" + ( days==1 ? '':'s' ) + ", ";
            message += hours + " hour" + ( hours==1 ? '':'s' ) + ", ";
            message += minutes + " minute" + ( minutes==1 ? '':'s' ) + " and ";
            message += seconds + " second" + ( seconds==1 ? '':'s' ) + " <br />";

            if(newYear){
                message += "left until the new year!";
            }
            else {
                message += "left to 10 days from now!";
            }

            note.html(message);
        }
    });
});