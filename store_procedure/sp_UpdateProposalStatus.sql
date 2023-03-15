CREATE DEFINER=`109403025`@`192.168.56.1` PROCEDURE `sp_UpdateProposalStatus`(
	IN inproposal_id int,
    IN instatus int,
    OUT outaffected_row_num int
)
BEGIN
	UPDATE
		tbl_Proposal
	SET
		status = instatus
	WHERE inproposal_id = proposal_id AND status < instatus;
	
    SELECT row_count() INTO outaffected_row_num; 
    
    SELECT 
		proposal_id,
        status
	FROM
		tbl_Proposal
	WHERE
		proposal_id = inproposal_id;
        
END