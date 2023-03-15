CREATE DEFINER=`109403025`@`192.168.56.1` PROCEDURE `sp_CreateProposal`(
	IN inmember_id int,
    IN intitle varchar(120) ,
    IN incontent text,
    IN ingoal int,
    IN incategory_id int,
    OUT outaffected_row_num int
)
BEGIN
	DECLARE affected_num_row_tbl_Proposal int DEFAULT 0;
    DECLARE affected_num_row_tbl_ProposalMember int DEFAULT 0;
    DECLARE input_proposal_id int;
    
	INSERT INTO tbl_Proposal(category_id,title,content,amount,goal,status,viewed_num,create_date,due_date,is_deactivated)
    VALUES 
		(incategory_id,intitle,incontent,'0',ingoal,'2','0',now(),date_add(now(),INTERVAL 90 DAY),'0'
        );
        
	SET input_proposal_id = (SELECT LAST_INSERT_ID());
    SELECT row_count() INTO affected_num_row_tbl_Proposal;
    
    INSERT INTO tbl_ProposalMember(member_id,proposal_id)
    VALUES (inmember_id,input_proposal_id);
    
    SELECT row_count() INTO affected_num_row_tbl_ProposalMember;

	SELECT
		tbl_Proposal.proposal_id,
        tbl_Proposal.title AS proposal_title,
        tbl_Proposal.content AS proposal_content,
        tbl_Proposal.amount,
        tbl_Proposal.goal,
        tbl_Proposal.status,
        tbl_Proposal.viewed_num,
        tbl_Proposal.create_date,
        tbl_Proposal.due_date,
		tbl_Category.category_name AS category
	FROM
		tbl_Category
	INNER JOIN
		tbl_Proposal ON tbl_Category.category_id = tbl_Proposal.category_id
	INNER JOIN tbl_ProposalMember ON tbl_ProposalMember.proposal_id = tbl_Proposal.proposal_id
    
    WHERE member_id = inmember_id AND tbl_Proposal.proposal_id = input_proposal_id;
    
    SELECT (affected_num_row_tbl_Proposal + affected_num_row_tbl_ProposalMember) INTO outaffected_row_num;
END