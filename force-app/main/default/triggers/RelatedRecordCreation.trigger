trigger Accounttrigger on Account (after insert)
{
    List<Contact> contactstocreate = new List<Contact>();
    for (Account Acc:Trigger.new)
    {
        contact newcon= new Contact();
        newcon.LastName = 'Direct Representative';
        newcon.AccountId = Acc.Id;
        //Linking the contact to the new account
        newcon.Phone= Acc.Phone;
        contactstocreate.add(newcon);
    }
    if (!contactstocreate.isEmpty())
    {insert contactstocreate;
        
    }
}