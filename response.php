<?php 
    // display errors
    ini_set("display_errors", true);
    error_reporting(E_ERROR);

    session_start();
    include_once "./Configs/SQL.php";
    include_once "./Configs/PAGING.php";
    include_once "./Services/Database.php";
    include_once "./Services/MailerX/MailerXClass.php";
    include_once "./Services/Languager/LanguagerClass.php";
    include_once "./Services/Validator/ValidatorClass.php";
    include_once "./Services/AuthGuard/AuthGuardClass.php";
    include_once "./Services/Automator/AutomatorClass.php";
    
    if(!isset($_REQUEST["route"]) || !isset($_REQUEST["act"])) {
        echo " <br> !!!!! WRONG ROUTE OR ACT !!!!!<br>";
    }
    else {
        $AUTHGUARD = new AuthGuard();
        $className = $_REQUEST["route"];
        include "App".DIRECTORY_SEPARATOR.$className.DIRECTORY_SEPARATOR.$className."Class.php";
        
        $class = $_REQUEST["route"];
        $method = $_REQUEST["act"];

        if(!$AUTHGUARD->checkGuard($_REQUEST))
            echo json_encode(["error"=>true, "message"=> "This Route Is Guarded"]);
        else {
            $newRequest = new $class();
            $data = $newRequest->$method();
            echo json_encode($data);
        }
    }