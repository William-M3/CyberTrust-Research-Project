
-- Gold Standard malicious
Select * 
from cybertrust_zooniverse_datamatch 
where task_id is not null 
and malicious is true 
order by task_id;

-- Gold Standard non-malicious
Select * 
from cybertrust_zooniverse_datamatch 
where task_id is not null 
and malicious is false 
order by task_id;



-- Testing that the cue for malicious email images in Cybertrust map correctly to Zooniverse
Select * 
from cybertrust_zooniverse_datamatch
full outer join professional_cue_mapping_email on cybertrust_zooniverse_datamatch.task_id = professional_cue_mapping_email.task_id
where cybertrust_zooniverse_datamatch.task_id is not null and malicious is true 
order by cybertrust_zooniverse_datamatch.task_id;

-- Testing that the cue for malicious webitem images in Cybertrust map correctly to Zooniverse
Select * 
from cybertrust_zooniverse_datamatch
full outer join professional_cue_mapping_webitem on cybertrust_zooniverse_datamatch.task_id = professional_cue_mapping_webitem.task_id
where cybertrust_zooniverse_datamatch.task_id is not null and malicious is true 
order by cybertrust_zooniverse_datamatch.task_id;

-- My code originally used api_contentitem id to map to Zooniverse
-- This caused non-malicious images to have cues assigned to them
-- This code checked email images that were not malicious to make sure that no cues were assigned to them
-- This was before I found the disconnect between the webitem and email tables so it no longer works
'''
Select * 
from cybertrust_zooniverse_datamatch
full outer join professional_cue_mapping on cybertrust_zooniverse_datamatch.task_id = professional_cue_mapping.task_id
where cybertrust_zooniverse_datamatch.task_id is not null and malicious is false 
order by cybertrust_zooniverse_datamatch.task_id;
'''
'''
Select * 
from api_maliciousarea
join api_maliciousarea_cues On api_maliciousarea.id = api_maliciousarea_cues.maliciousarea_id
join api_cue On api_maliciousarea_cues.cue_id = api_cue.id
join api_contentitem On api_contentitem.id = api_maliciousarea.contentitem_id
join api_emailitem On api_emailitem.contentitem_ptr_id = api_contentitem.id
join api_task On api_task.email_id = api_emailitem.contentitem_ptr_id
order by api_task.id;
'''