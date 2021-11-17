<?php 
    // ini_set("display_errors", true);
    // error_reporting(E_ERROR);

    class Database
    {
        public $params = null; 
        public $options = null;

        public $host = null;
        public $port = null;
        public $charset = null; 
        public $username = null;
        public $password = null;
        public $database = null; 

        public $connection = null; 


        public function __construct($manual = false) {
            if($manual != true) {
                $this->host     = DBHOST;
                $this->port     = DBPORT;
                $this->charset  = DBCHARSET;
                $this->username = DBUSERNAME;
                $this->password = DBPASSWORD;
                $this->database = DBNAME;

                $this->options  = [
                    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
                    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                    PDO::ATTR_EMULATE_PREPARES   => false,
                ];

                $this->connect();
            }
            else $this->connect();
        }
        
        public function connect() 
        {
            try {
                $conn = new PDO("mysql:host=$this->host;dbname=$this->database", $this->username, $this->password, $this->options);
                
                $this->connection = $conn;
                //echo "Connected successfully";
            } catch(PDOException $e) {
                echo "Connection failed: " . $e->getMessage();
            }
        }

        public function getSubs($sqlQuery , $subKeys , $print = false) 
        {
            if($print == true)
                $this->print_query($sqlQuery);
            else {
                $data = $this->executeQuery($sqlQuery)->fetchAll();

                foreach ($subKeys as $subKey) {
                    for ($i = 0; $i < COUNT($data); $i++) {
                        $detailsAsArray = explode("," ,$data[$i][$subKey]);
                        unset($data[$i][$subKey]);
                        foreach ($detailsAsArray as $item) {
                            $obj = explode('=',$item);
                            $key = $obj[0];
                            $val = $obj[1];
                            $data[$i][$key] = $val;
                        }
                    }
                }

                return $data;
            } 
                 
        }

        public function get($sqlQuery , $print = false) 
        {
            if($print == true)
                $this->print_query($sqlQuery);
            else 
                return $this->executeQuery($sqlQuery)->fetchAll();
        }

        public function set($sqlQuery , $print = false) 
        {
            if($print == true)
                $this->print_query($sqlQuery);
            else
                return $this->executeQuery($sqlQuery)->rowCount();
        }

        public function executeQuery($sqlQuery) 
        {
            
            if($sqlQuery == "" || $sqlQuery == null)  {
                echo " <br><br> !!!!!! query is not defined !!!!!! <br><br> ";
                return null;
            }

            if($this->params == null) {
                $stmt = $this->connection->query($sqlQuery);
                $stmt->execute();
                return $stmt;
            }
            else {
                $stmt = $this->connection->prepare($sqlQuery);
                $stmt->execute($this->params);
                return $stmt;
            }
        }

        public function print_query($sqlQuery) 
        {
            for($i = 0; $i < COUNT($this->params); $i++) {
                for ($j = 0; $j < strlen($sqlQuery); $j++) {
                    if( $sqlQuery[$j] == '?' ) {
                        $sqlQuery[$j] = $this->params[$i];
                        break;
                    }
                
                }
            }

            //print_r($this->params);
            echo $sqlQuery;
        }
        
    }