<?php
	
	class Home extends Database
	{
		
		public function readVips()
		{
			if($_REQUEST["vip"] == "" || !isset($_REQUEST["vip"]))
				return ["error"=>"true", "message"=>"vip parameter is required"];

			$this->params = [$_REQUEST["vip"]];

			return parent::getSubs("SELECT	posts.id AS 'cell-id',
											posts.title,
											posts.description,
											post_media.dir,
											GROUP_CONCAT(CONCAT(post_settings.title,'=',post_details.`value`)) AS details
								FROM 	posts  
								LEFT JOIN post_media ON posts.thumbnail_id = post_media.id
								LEFT JOIN post_details ON posts.id = post_details.post_id AND post_details.post_setting_id IN(SELECT id FROM post_settings WHERE actived = 1) 
								JOIN  post_settings ON post_settings.id = post_details.post_setting_id 
								WHERE posts.vip_status_id = ? AND posts.status_id = 1 AND posts.actived = 1
								GROUP BY  posts.id
								ORDER BY  posts.created DESC; ", ["details"]);
	
		}

		public function search() 
		{
			return parent::get("");
		}

		public function saveFavorite() 
		{
			$this->param = [$_REQUEST["post_id"],$_SESSION["USERID"]];
			return parent::set("INSERT INTO favorites SET `post_id` = ?, `user_id` = ? , created = NOW(); ");
		}

	}