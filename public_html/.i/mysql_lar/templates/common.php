<?php
/**
 * Created by PhpStorm.
 * User: Yulia Laryushina
 * Date: 08.10.14
 * Time: 20:48
 */
echo
    '<!DOCTYPE html>
        <head>
            <meta charset="utf-8">
            <title>'.'Resource cost assessment'.'</title>
            <link href="public_html/css/bootstrap.css" media="screen" rel="stylesheet" type="text/css">
            <link href="public_html/css/bootstrap-theme.css" media="screen" rel="stylesheet" type="text/css">
            <script type="text/javascript" src="public_html/js/bootstrap.min.js"></script>
            <script type="text/javascript" src="public_html/js/jquery-1.11.1.min.js"></script>
        </head>
        <body>
        <script type="text/javascript">
                function askConfirmation(id, type) {
                    if(confirm(\'Really want to delete?\'))
                    {
                    document.location.href = "/?action=delete_" + type + "&id=" + id;
                    }else{
                    document.location.href = "/?action=" + type + "_table";
                    };
                    }
                function deleteConnection(id_resource, id_task){
                    if(confirm(\'Really want to delete connection?\'))
                    {
                    document.location.href = "/?action=delete_connection&id_r=" + id_resource + "&id_t=" + id_task;
                    }else{
                    document.location.href = "/?action=show_resources&id="+id_task;
                    };
                    }
            </script>';