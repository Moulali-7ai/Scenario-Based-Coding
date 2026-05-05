trigger LeadWebValidation on Lead (before insert)
{
    if (Trigger.isBefore && Trigger.isInsert)
    {
        for(Lead ldRecord :Trigger.new){
            if(ldRecord.LeadSource == 'Web' )
            {
                ldRecord.Rating= 'Warm';
                ldRecord.Industry= 'technology';
            }
        }
    }
}