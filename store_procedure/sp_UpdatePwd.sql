CREATE DEFINER=`109403025`@`192.168.56.1` PROCEDURE `sp_UpdatePwd`(
	IN inmember_id INT,
    IN inhashedpwd VARCHAR(200),
    IN insalt CHAR(64),
    OUT outaffected_row_num INT
)
BEGIN
	DECLARE affected_row_num__tbl_Member int DEFAULT 0;
    DECLARE affected_row_num_tbl_MemberCredential int DEFAULT 0;
    
	UPDATE 
		tbl_Member 
    SET 
		salt = insalt
	WHERE member_id = inmember_id;
    
    SELECT row_count() INTO @affected_row_num_tbl_Member;
    
    UPDATE
		tbl_MemberCredential 
	SET
		hashed_pwd_string = inhashedpwd
	WHERE hashed_user_id = inmember_id;
    
    SELECT row_count() INTO @affected_row_num_tbl_MemberCredential;
    
    SELECT
		m.member_id,
		m.name,
		m.email,
        mc.hashed_pwd_string AS password,
        m.salt,
        m.phone,
        m.address
    FROM
		tbl_Member m
	INNER JOIN tbl_MemberCredential mc ON mc.hashed_user_id = m.member_id
    WHERE mc.hashed_pwd_string = inhashedpwd;
    
    SET outaffected_row_num = @affected_row_num_tbl_Member + @affected_row_num_tbl_MemberCredential;
    
END