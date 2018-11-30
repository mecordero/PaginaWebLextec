using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Mail;

namespace Online_Shopping_Backup
{
    public class SendGmailEmail : ISendEmail
    {
        private static SendGmailEmail INSTANCE = null;

        private SmtpClient smtpClient;
        private string fromEmail;
        private string fromPassword;



        /*
         * Funcionalidad: constructor que setea con cual correo y contraseña se va a trabajar para enviar correos 
         * Entrada:
         * Salida: 
         */
        private SendGmailEmail()
        {
            smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.EnableSsl = true;
            
            fromEmail = "noreply.lextec@gmail.com";
            fromPassword = "LabLextec2018";

            NetworkCredential credentials = new NetworkCredential(fromEmail, fromPassword);
            smtpClient.Credentials = credentials;
        }


        /*
         * Funcionalidad: como es un singletone, si no hay instancia la inicializa
         * Entrada:
         * Salida: devuelve la unica instancia de SendGmailEmail 
         */
        public static SendGmailEmail Instance
        {
            get 
            {
                if (INSTANCE == null)
                {
                    INSTANCE = new SendGmailEmail();
                }

                return INSTANCE;
            }
        }

        /*
         * Funcionalidad: envia un solo correo a muchas personas
         * Entrada: 
         *		List<string> to: es una lista que tiene diferentes correos electronicos a los cuales se les enviara el correo 
         *		strng subject: es el asunto del correo 
         *		string body: es el cuerpo del correo
         * Salida:
         */
        public bool SendEmail(List<string> to, string subject, string body)
        {
            MailMessage message = new MailMessage();
            message.From = new MailAddress(fromEmail);
            bool success = true;

            foreach(string userEmailAddress in to)
            {
                message.To.Add(new MailAddress(userEmailAddress));
            }

            message.Subject = subject;
            message.Body = body;

            try
            {
                //throw new Exception("Hola");
                smtpClient.Timeout = 300000; // Five minutes
                smtpClient.Send(message);
            }
            catch(Exception ex) 
            {
                Console.WriteLine(ex.StackTrace);
                Console.WriteLine(ex.Message);

                success = false;
            }

            return success;
        }


        /*
         * Funcionalidad: envia un solo correo a una sola persona
         * Entrada: 
         *		string email: es un unico correo al que se le va enviar un mensaje 
         *		strng subject: es el asunto del correo 
         *		string body: es el cuerpo del correo
         * Salida:
         */
        public void SendEmail(string email, string subject, string body)
        {
            MailMessage message = new MailMessage();
            message.From = new MailAddress(fromEmail);
            message.To.Add(new MailAddress(email));

            message.Subject = subject;
            message.Body = body;

            smtpClient.Send(message);
        }
    }
}