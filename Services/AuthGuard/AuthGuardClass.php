<?php 
    class AuthGuard extends Database 
    {
        private $routes = null;

        public function __construct() 
        {
            $this->routes = [
                "admin" => []
            ];

            // $_SESSION["USERID"] = 1;
            // $_SESSION["token"] = 1123;
            parent::__construct();
        }

        public function checkGuard($parameter) 
        {
            if(!array_key_exists($parameter["route"], $this->routes))  return true;
            else {
                // check if act is free
                $routeFreeActs = gettype($this->routes[$parameter["route"]]) == "array" ;
                $isFreeAct = in_array($parameter["act"], $this->routes[$parameter["route"]]);
                
                if($routeFreeActs && $isFreeAct) return true;
                
                // when it's guarded
                if( !isset($_SESSION["token"]) || !isset($_SESSION["USERID"]) ) return false;
                else {
                    $this->params = [$_SESSION["USERID"]];
                    $userData = parent::get("SELECT token FROM accounts WHERE id = ? AND email_confirmed = 1 ;");
                    return (COUNT($userData) == 1 && $userData[0]["token"] == $_SESSION["token"] ) ? true : false;
                }
            }

            return false;
        }
        
        public function checkThisGuard() 
        {
            $parameter = ["route" => $_REQUEST["checkRoute"] , "act" => $_REQUEST["checkAct"]];
            if(!$this->checkGuard($parameter)) return ["error"=> true, "message"=> "This Route Is Guarded"];
            else return ["error"=> false, "message"=> "This Route Is Free"];
        }
    }
    