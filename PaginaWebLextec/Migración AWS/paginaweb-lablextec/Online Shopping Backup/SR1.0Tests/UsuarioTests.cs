using Microsoft.VisualStudio.TestTools.UnitTesting;
using Online_Shopping_Backup;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Online_Shopping_Backup.Tests
{
    [TestClass()]
    public class UsuarioTests
    {
        MainController main=MainController.Instance;



        [TestMethod()]
        public void UsuarioInsertTest()
        {
            Usuario user = new Usuario(1, "Ximena", "Bolannos", "Fonseca",
             "116620945", "xbolanosfonseca@gmail.com", "Ingeniería", "Costa Rica",
             "Bachillerato", "F", true, true, DateTime.Today, "86018687", DateTime.Today,
             DateTime.Today, DateTime.Today, DateTime.Today, null, 0);
            Usuario user2 = new Usuario(2, "Ximena", "Bolannos", "Fonseca",
             "116620945", "xbolanosfonseca@gmail.com", "Ingeniería", "Costa Rica",
             "Bachillerato", "F", true, true, DateTime.Today, "86018687", DateTime.Today,
             DateTime.Today, DateTime.Today, DateTime.Today, null, 0);
        }
        [TestMethod()]
        public void UsuarioDeleteTest()
        {
            Usuario user = new Usuario(5, "Ximena", "Bolannos", "Fonseca",
               "116620945", "xbolanosfonseca@gmail.com", "Ingeniería", "Costa Rica",
               "Bachillerato", "F", true, true, DateTime.Today, "86018687", DateTime.Today,
               DateTime.Today, DateTime.Today, DateTime.Today, null, 0);
            user.Delete(user);
        }

        [TestMethod()]
        public void UsuarioEditTest()
        {
            Usuario user = new Usuario(4, "Ximena", "Bolannos", "Fonseca",
               "116620945", "xbolanosfonseca@gmail.com", "Ingeniería", "Costa Rica",
               "Bachillerato", "F", true, true, DateTime.Today, "86018687", DateTime.Today,
               DateTime.Today, DateTime.Today, DateTime.Today, null, 0);
            user.Edit(4, new Usuario(4, "Xime", "Bolannos", "Fonseca",
               "116620945", "xbolanosfonseca@gmail.com", "Ingeniería", "Costa Rica",
               "Bachillerato", "F", true, true, DateTime.Today, "86018687", DateTime.Today,
               DateTime.Today, DateTime.Today, DateTime.Today, null, 0));
        }

        [TestMethod()]
        public void UsuarioGetAllTest()
        {
            Usuario user= new Usuario(3, "Ximena", "Bolannos", "Fonseca",
              "116620945", "xbolanosfonseca@gmail.com", "Ingeniería", "Costa Rica",
              "Bachillerato", "F", true, true, DateTime.Today, "86018687", DateTime.Today,
              DateTime.Today, DateTime.Today, DateTime.Today, null, 0);
              user.GetAll();
        }
    }
}