<?php
	
	class Help extends Database
	{

		public function read() 
		{
			return parent::get("SELECT id, question, answer FROM help WHERE actived = 1 ");
		}
		
	}