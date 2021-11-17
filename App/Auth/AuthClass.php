<?php 
    class Auth extends Database
    {

        public function login() 
        {
			// log activity
            $this->params = [
				$this->getIPAddress(),
				$_REQUEST["email"]
			];
			parent::set("UPDATE accounts set last_ip_address = ? , last_log = NOW() WHERE email = ? AND actived = 1");

            $email  = $_REQUEST["email"];
            $password  = $_REQUEST["password"];

            $this->validation([
                "email" => $email,
                "password" => $password,
            ]);

			$this->params = [$email];
            $result = parent::get("SELECT id,passcode, token FROM accounts WHERE email = ? AND actived = 1 AND blocked = 0; ");

            if(!password_verify($password, $result["passcode"] )) 
                return ["result" => false, "message" => "პაროლი ან ელ. ფოსტა არასწორია"];
            else {
				$_SESSION["USERID"] = $result["USERID"];
				$_SESSION["token"] = $result["token"];
				return ["result" => true, "message" => $result["token"] ];
			}
        }

        public function signup()
        {
			$matches = parent::get("SELECT id FROM accounts WHERE mail = ? AND actived = 1; ");
			if(COUNT($matches))
				return ["error" => true, "message" => "Mail has already been used"];

            $this->validation([
				"fullname"  => $_REQUEST["fullname"],
				"email"     => $_REQUEST["email"],
				"phone"     => $_REQUEST["phone"],
				"gender"    => $_REQUEST["gender"],
				"birthdate" => $_REQUEST["birthdate"],
				"country"   => $_REQUEST["country"],
				"city"      => $_REQUEST["city"]
            ]);

			$hashedPassword = password_hash( $_REQUEST["password"], PASSWORD_BCRYPT, ['cost' => 10]);

			$token = "";
			while ($token == "") {
				$tmpToken = bin2hex(random_bytes(20));
				$this->params = [$tmpToken];
				$matches = parent::get("SELECT token FROM accounts WHERE token = ?");
				if(COUNT($matches) == 0) $token = $tmpToken;
			}

			$this->params = [
								$_REQUEST["fullname"],
								$hashedPassword, 
								$token, 
								$_REQUEST["email"], 
								$_REQUEST["phone"], 
								$_REQUEST["gender"], 
								$_REQUEST["birthdate"],
								$_REQUEST["country"], 
								$_REQUEST["city"],  
								$this->getIPAddress()
							];
			$result = parent::set("INSERT INTO accounts SET fullname = ?, 
														 passcode = ?, 
														 token = ?,
														 email = ?, 
														 phone = ?, 
														 gender = ?, 
														 birthdate = ?, 
														 role_id = 2, 
														 country_id = ?, 
														 city_id = ?, 
														 email_confirmed = 0, 
														 phone_confirmed = 0, 
														 last_ip_address = ?, 
														 created = NOW() ");
														 
			return ["error" => false, "message" => "Mail has already been used"];
        }

		public function logout() 
		{
			unset($_SESSION["USERID"]);
			unset($_SESSION["token"]);
		}

        public function reset() 
        {
			$resetToken = bin2hex(random_bytes(20));
            $mail = new MailerX([
                "ip" => $this->getIPAddress(),
				"resetToken" => $resetToken,
                "mail"=> $_REQUEST["email"],
            ]);

            return $mail->result;
        }

        public function changePassword()
        {
			$hashedPassword = password_hash( $_REQUEST["newPassword"], PASSWORD_BCRYPT, ['cost' => 10]);
			$this->params = [$hashedPassword, $_REQUEST["email"], $_SESSION["token"]];
			return parent::set("UPDATE accounts SET password = ?, updated = NOW() WHERE email = ? AND token = ?");
        }

        public function validation($parameters)
        {
            $check = true;
            foreach ($parameters as $key => $param) {
                $validator = new Validator();
                $check = $validator->$key($param);
            }

            return $check;
        }

        public function getIPAddress() {  
            //whether ip is from the share internet  
            if(!empty($_SERVER['HTTP_CLIENT_IP'])) {  
                return $_SERVER['HTTP_CLIENT_IP'];  
            } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {  
                return $_SERVER['HTTP_X_FORWARDED_FOR'];  
            } else {  
                return $_SERVER['REMOTE_ADDR'];  
            }  
        }

        public function checkBlockedIp($ip)
        {
			$this->params = [$ip];
            return (COUNT(parent::get("select * FROM blockedips WHERE ?")) > 0) ? false : true;
        }

    }