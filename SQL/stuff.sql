-- professional_cue_mapping

-- Cybertrust database is linked to Zooniverse by task_id
-- api_task is the table to get the id from that links them.
-- api_task connect web images and email image through different tables
-- so two different views are created 

Create view professional_cue_mapping_webitem as
	(Select 
	 api_task.id as task_id,
	 contentitem_id as content_id,
	 api_cue.id as cue_id,
	 api_cue.name as cue_name,
	 api_contentitem.description
	 from api_maliciousarea 
	 join api_maliciousarea_cues On api_maliciousarea.id = api_maliciousarea_cues.maliciousarea_id
	 join api_cue On api_maliciousarea_cues.cue_id = api_cue.id
	 join api_contentitem On api_contentitem.id = api_maliciousarea.contentitem_id
	 join api_webitem On api_webitem.contentitem_ptr_id = api_contentitem.id
	 join api_task On api_task.webitem_id = api_webitem.contentitem_ptr_id
	 order by api_task.id
	);
	
	
Create view professional_cue_mapping_email as
(Select 
 	 api_task.id as task_id,
	 contentitem_id as content_id,
	 api_cue.id as cue_id,
	 api_cue.name as cue_name,
	 api_contentitem.description 
from api_maliciousarea
join api_maliciousarea_cues On api_maliciousarea.id = api_maliciousarea_cues.maliciousarea_id
join api_cue On api_maliciousarea_cues.cue_id = api_cue.id
join api_contentitem On api_contentitem.id = api_maliciousarea.contentitem_id
join api_emailitem On api_emailitem.contentitem_ptr_id = api_contentitem.id
join api_task On api_task.email_id = api_emailitem.contentitem_ptr_id
order by api_task.id);



-- Testing to figure out what was wrong below
'''
Select contentitem_id,
	 api_cue.id as cue_id,
	 api_cue.name as cue_name,
	 api_contentitem.description
from api_maliciousarea 
join api_maliciousarea_cues On api_maliciousarea.id = api_maliciousarea_cues.maliciousarea_id
join api_cue On api_maliciousarea_cues.cue_id = api_cue.id
join api_contentitem On api_contentitem.id = api_maliciousarea.contentitem_id;
'''