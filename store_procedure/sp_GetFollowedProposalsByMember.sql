CREATE DEFINER=`109403025`@`192.168.56.1` PROCEDURE `sp_GetFollowedProposalsByMember`(
	IN inmember_id int,
    OUT outnumber_found int
)
BEGIN
	SELECT
		fr.member_id,
		p.title as proposal_title, 
		p.amount as proposal_amount,
		p.goal as proposal_goal
	FROM
		tbl_Proposal p
	INNER JOIN tbl_FollowingRecord fr ON fr.proposal_id = p.proposal_id
    WHERE fr.member_id = inmember_id;
    
    SELECT found_rows() INTO outnumber_found;
END