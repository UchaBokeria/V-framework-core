<?php
	
	class Header extends Database
	{

		public function readCategories() 
		{
			return parent::getSubs("SELECT 	estate_types.id, estate_types.title, 
										GROUP_CONCAT(CONCAT('title','=',subs.title)) AS sub_categories_title,
										GROUP_CONCAT(CONCAT('id','=',subs.id)) AS sub_categories_id
								FROM   	estate_types 
								LEFT JOIN estate_types AS subs ON subs.parent = estate_types.id
								WHERE estate_types.parent = 0 AND estate_types.actived = 1
								GROUP BY estate_types.id", ["sub_categories_title", "sub_categories_id"]);

		}

		public function readLanguages() 
		{
			return parent::get("SELECT id, title FROM languages WHERE actived = 1");
		}
	}