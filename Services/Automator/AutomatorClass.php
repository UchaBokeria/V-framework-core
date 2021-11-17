<?php 
    class Automator extends Database 
    {

        private $scheme = null;
        private $subKeys = [
            ["key" => "attributes", "separator" => ["," , "=>"] ],
            ["key" => "data",       "separator" => ["," , "=>"] ],
            ["key" => "onChange",   "separator" => [","] ],
            ["key" => "classes",      "separator" => [","] ],
        ];

        public function build()
        {
            $this->scheme = $this->buildScheme();

            
            return $this->BuildJsonData($this->scheme);
            //return $this->scheme;
        }

        private function buildScheme() 
        {
            $SCHEME = parent::get("   SELECT `automator_elements`.`section` AS 'section',
                                                   `automator_elements`.`id`      AS 'unique_id',
                                                   `automator_elements`.`el_id` AS 'id',
                                                   `automator_elements`.`el`      AS 'el',
                                                   `automator_elements`.`parent`  AS 'parent',
                                                    GROUP_CONCAT(DISTINCT `automator_classes`.`classname`) AS 'classes',
                                                    IF(`automator_elements`.`view` = 1, 'true', 'false') AS 'view',
                                                    GROUP_CONCAT(DISTINCT `automator_onchange`.`change_id`) AS 'onChange',
                                                    IF(`automator_elements`.`changable` = 1, 'true', 'false') AS 'changeAble',
                                                    GROUP_CONCAT(DISTINCT CONCAT(`automator_data`.`datakey`,'=>',`automator_data`.`datavalue`)) AS 'data',
                                                    GROUP_CONCAT(DISTINCT CONCAT(`automator_attributes`.`attrkey`,'=>',`automator_attributes`.`attrvalue`)) AS 'attributes'
                                            FROM automator_elements
                                            LEFT JOIN automator_attributes  ON automator_attributes.automator_el_id = automator_elements.id and automator_attributes.actived = 1
                                            LEFT JOIN automator_onchange  ON automator_onchange.automator_el_id = automator_elements.id and automator_onchange.actived = 1
                                            LEFT JOIN automator_classes ON automator_classes.automator_el_id = automator_elements.id and automator_classes.actived = 1
                                            LEFT JOIN automator_data  ON automator_data.automator_el_id = automator_elements.id and automator_data.actived = 1
                                            WHERE `automator_elements`.actived = 1
                                            GROUP BY automator_elements.id 
                                            ORDER BY automator_elements.section ASC  ; ");
            return $SCHEME;
        }

        private function BuildJsonData($DATA) 
        {
            if($_REQUEST["subkeys"] != "") $this->subKeys = json_decode($_REQUEST["subkeys"], true);
 
            for ($j = 0; $j < count($DATA); $j++) {
                for($i = 0; $i < COUNT($this->subKeys); $i++) {
                    $DATA[$j][$this->subKeys[$i]["key"]] = $this->multipleExplode(
                        $DATA[$j][$this->subKeys[$i]["key"]],
                        $this->subKeys[$i]["separator"]
                    );
                    // $exploded = explode(  ",", $DATA[$j][$this->subKeys[$i]["key"]] );
                    // $DATA[$j][$this->subKeys[$i]["key"]] = $exploded;
                    // $tmp = [];
                    // for($a = 0; $a < count($DATA[$j][$this->subKeys[$i]["key"]]); $a++){
                    //     $subExplode = explode("=>", $DATA[$j][$this->subKeys[$i]["key"]][$a]);
                    //     array_push($tmp, [$subExplode[0] => $subExplode[1]] );
                    // }
                    // $DATA[$j][$this->subKeys[$i]["key"]] = $tmp;
                }
            }

            return $DATA;
        }

        public function multipleExplode($DATA, $separators) 
        {
            $exploded = explode($separators[0], $DATA );
            if( COUNT($separators) < 2 ) return $exploded;
            $DATA = $exploded;
            $tmp = [];
            for($a = 0; $a < count($DATA); $a++) {
                $subExplode = explode($separators[1], $DATA[$a]);
                array_push($tmp, [$subExplode[0] => $subExplode[1]] );
            }
            return $tmp;
        }
    }
    