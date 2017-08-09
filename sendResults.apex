@RestResource(urlMapping='/sendResults/*')
global with sharing class sendResults {
    @HttpPost
      global static String sendEmailResult() {  
        String senderName = RestContext.request.params.get('senderName');
        String reciver = RestContext.request.params.get('reciver');
        String subject = RestContext.request.params.get('subject');
        String textbody = RestContext.request.params.get('textbody');

        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        // Set recipients to two contact IDs.
        // Replace IDs with valid record IDs in your org.
        message.toAddresses = new String[] { reciver };
        //message.optOutPolicy = 'FILTER';
        message.subject = subject;
        message.setSenderDisplayName(senderName);
        message.setHtmlBody(textbody);
          
        Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage> {message};
        Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
          
        if (results[0].success) {
            return 'The email was sent successfully.' + textbody;
        } else {
            return 'The email failed to send: '
                  + results[0].errors[0].message;
        }
      }
}