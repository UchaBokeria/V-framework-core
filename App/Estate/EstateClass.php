<?php
	
	class Estate extends Database
	{
		
		public function read()
		{
			$this->params = [  $_REQUEST["newPage"] * ITEMPERPAGE ,  ITEMPERPAGE  ];

			return parent::getSubs("SELECT	posts.id AS 'cell-id',
											posts.title,
											posts.description,
											post_media.dir,
											GROUP_CONCAT(CONCAT(post_settings.title,'=',post_details.`value`)) AS details
									FROM 	posts  
									LEFT JOIN post_media ON posts.thumbnail_id = post_media.id
									LEFT JOIN post_details ON posts.id = post_details.post_id AND post_details.post_setting_id IN(SELECT id FROM post_settings WHERE actived = 1) 
									JOIN  post_settings ON post_settings.id = post_details.post_setting_id 
									WHERE posts.status_id = 1 AND posts.actived = 1
									GROUP BY  posts.id
									ORDER BY  posts.created DESC
									LIMIT ?,?; ", ["details"]);
		}

		public function forInstatement(){
			/* Execute a prepared statement using an array of values for an IN clause */
			$params = array(1, 21, 63, 171);
			/* Create a string for the parameter placeholders filled to the number of params */
			$place_holders = implode(',', array_fill(0, count($params), '?'));

			/*
				This prepares the statement with enough unnamed placeholders for every value
				in our $params array. The values of the $params array are then bound to the
				placeholders in the prepared statement when the statement is executed.
				This is not the same thing as using PDOStatement::bindParam() since this
				requires a reference to the variable. PDOStatement::execute() only binds
				by value instead.
			*/
			$sth = $dbh->prepare("SELECT id, name FROM contacts WHERE id IN ($place_holders)");
			$sth->execute($params);
		}
	}