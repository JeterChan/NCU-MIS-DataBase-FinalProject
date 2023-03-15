CREATE DEFINER=`109403025`@`192.168.56.1` PROCEDURE `sp_GetUnrepliedComments`(
	IN inmember_id int,
    OUT outnum_of_rows int
)
BEGIN
	SELECT 
		tbl_ProposalMember.member_id,
        tbl_Comment.proposal_id,
        title AS proposal_id,
        comment_id,
        member_comment,
        comment_time,
        proposer_response
	FROM
		tbl_ProposalMember
	INNER JOIN
		tbl_Proposal ON tbl_ProposalMember.proposal_id = tbl_Proposal.proposal_id
	INNER join
		tbl_Comment ON tbl_Proposal.proposal_id = tbl_Comment.proposal_id
	where tbl_ProposalMember.member_id = inmember_id AND proposer_response = '';
    
    SELECT found_rows() INTO outnum_of_rows;
END