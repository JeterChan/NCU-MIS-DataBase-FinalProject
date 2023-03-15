CREATE DEFINER=`109403025`@`192.168.56.1` PROCEDURE `sp_RegisterMember`(
IN inemail varchar(64),
	IN inhashedpwd varchar(200),
    IN insalt char(64),
    IN inname varchar(64),
    IN inaddress varchar(255),
    IN inphone varchar(64),
    OUT outaffect_row_num int

)
BEGIN
	DECLARE affected_row_num_tbl_Member int DEFAULT 0;
    DECLARE affected_row_num_tbl_MemberCredential int DEFAULT 0;
    
	INSERT INTO tbl_Member(email,salt,name,address,phone)
    VALUES
		(inemail,insalt,inname,inaddress,inphone);
        
	SELECT row_count() into affected_row_num_tbl_Member;
    
    INSERT INTO tbl_MemberCredential(hashed_user_id,hashed_pwd_string)
	VALUES
		((SELECT member_id FROM tbl_Member WHERE tbl_Member.salt = insalt) , inhashedpwd);
        
   	SELECT row_count() into affected_row_num_tbl_MemberCredential;
    
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
        
    SET outaffect_row_num = @affected_row_num_tbl_Member + affected_row_num_tbl_MemberCredential;
END