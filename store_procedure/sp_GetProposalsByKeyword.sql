CREATE DEFINER=`109403025`@`192.168.56.1` PROCEDURE `sp_GetProposalsByKeyword`(
	IN inkeyword VARCHAR(64),
    OUT outnumofrows INT
)
BEGIN
	SELECT 
		proposal_id,
        title,
        due_date,
        amount
	FROM 
		tbl_Proposal
	WHERE title LIKE CONCAT('%' , inkeyword , '%');
    
    SELECT found_rows() INTO outnumofrows;
END