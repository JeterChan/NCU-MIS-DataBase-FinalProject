CREATE DEFINER=`109403025`@`192.168.56.1` PROCEDURE `sp_GetHistorySponsorByMember`(
	IN inmember_id int,
    OUT outnum_of_rows int
)
BEGIN
	SELECT
		tbl_SponsorRecord.member_id,
		tbl_Proposal.proposal_id,
        tbl_Proposal.title AS proposal_title,
        tbl_ProposalOption.title AS proposal_option_title,
        tbl_SponsorRecord.amount,
        tbl_Proposal.status
	FROM
		tbl_SponsorRecord
	INNER JOIN
		tbl_ProposalOption ON tbl_SponsorRecord.proposal_option_id = tbl_ProposalOption.proposal_option_id
	INNER JOIN
		tbl_Proposal ON tbl_ProposalOption.proposal_id = tbl_Proposal.proposal_id
	WHERE
		member_id = inmember_id;
        
	SELECT found_rows() INTO outnum_of_rows;
END