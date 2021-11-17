<?php 
    class Languager extends Database
    {

        public function getTranslation()
        {
			$this->params = [  $_REQUEST["lang_id"]  ];

            if($_REQUEST["page_id"] == 0) {
                $pageFilter = " AND page_id = ? ";
                array_push( $this->params, $_REQUEST["page_id"] );
            }

            return parent::get("SELECT  lang_key, 
                                        lang_value
                                FROM    translate 
                                WHERE   lang_id = ? $pageFilter AND actived = 1; ");
        }
    }
    