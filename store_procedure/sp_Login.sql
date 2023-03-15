CREATE DEFINER=`109403025`@`192.168.56.1` PROCEDURE `sp_Login`(
	IN inemail varchar(64),
    IN inhashedpwd varchar(200),
    OUT outstatus_code varchar(64)
)
BEGIN
    DECLARE status_code int DEFAULT 0;
    
	IF inemail IN (SELECT
					email
				  FROM
					tbl_Member
				  WHERE email = inemail) 
		AND 
			inhashedpwd IN (SELECT 
							tbl_MemberCredential.hashed_pwd_string
						  FROM
							tbl_MemberCredential
						  WHERE
							hashed_pwd_string = inhashedpwd) THEN
			SET 
				status_code = 1;

		ELSEIF 
			inemail IN (SELECT
							email
						FROM
							tbl_Member
						WHERE email = inemail) AND
			inhashedpwd NOT IN (SELECT 
								tbl_MemberCredential.hashed_pwd_string
							FROM
								tbl_MemberCredential
							WHERE
								hashed_pwd_string = inhashedpwd) THEN SET status_code = 2;
		ELSE 
			SET status_code = 3;	
	END IF;
                  
	  SELECT status_code INTO outstatus_code;
END