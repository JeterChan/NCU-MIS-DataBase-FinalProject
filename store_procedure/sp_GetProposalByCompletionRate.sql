CREATE DEFINER=`109403025`@`192.168.56.1` PROCEDURE `sp_GetProposalByCompletionRate`(
	IN inratio float,
    OUT outnum_of_rows int
)
BEGIN
	SELECT
		proposal_id,
        title AS proposal_title,
        amount,
        goal,
        amount/goal AS ratio
	FROM
		tbl_Proposal
	
	WHERE
		amount/goal > inratio
    ORDER BY
		amount/goal DESC;
        
	SELECT found_rows() INTO outnum_of_rows;
END