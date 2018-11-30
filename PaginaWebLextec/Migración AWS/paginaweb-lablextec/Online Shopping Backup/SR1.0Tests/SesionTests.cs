using Microsoft.VisualStudio.TestTools.UnitTesting;
using Online_Shopping_Backup;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Online_Shopping_Backup.Tests
{
    [TestClass()]
    public class SesionTests
    {
        MainController main = MainController.Instance;
        [TestMethod()]
        public void SesionInsertTest()
        {
            Experimento experimento = new Experimento(1, "impuestos", "lab", "juego", "juegopublico", "nota", "descripcion", "Cartago", true, false, DateTime.Today, DateTime.Today, DateTime.Today, "mensaje");

            Sesion sesion = new Sesion(1,experimento, DateTime.Today, DateTime.Today, DateTime.Today, false, 20);
               
        }

        [TestMethod()]
        public void SesionGetAllbyExperimentTest()
        {
            Experimento experimento = new Experimento(1, "impuestos", "lab", "juego", "juegopublico", "nota", "descripcion", "Cartago", true, false, DateTime.Today, DateTime.Today, DateTime.Today, "mensaje");
            Sesion sesion = new Sesion(1, experimento, DateTime.Today, DateTime.Today, DateTime.Today, false, 20);
            Sesion sesion2 = new Sesion(2, experimento, DateTime.Today, DateTime.Today, DateTime.Today, false, 20);
            List<Sesion> sesiones= sesion.GetAllbyExperiment(experimento);
        }

        [TestMethod()]
        public void SesionGetbyIDTest()
        {
            Experimento experimento = new Experimento(2, "impuestos", "lab", "juego", "juegopublico", "nota", "descripcion", "Cartago", true, false, DateTime.Today, DateTime.Today, DateTime.Today, "mensaje");
            Sesion sesion = new Sesion(3, experimento, DateTime.Today, DateTime.Today, DateTime.Today, false, 20);
            
            sesion.GetbyID(experimento, 3);
        }

        [TestMethod()]
        public void SesionEditTest()
        {
            Experimento experimento = new Experimento(3, "impuestos", "lab", "juego", "juegopublico", "nota", "descripcion", "Cartago", true, false, DateTime.Today, DateTime.Today, DateTime.Today, "mensaje");
            Sesion sesion = new Sesion(4, experimento, DateTime.Today, DateTime.Today, DateTime.Today, false, 20);
            sesion.Edit(experimento, 4, new Sesion(4, experimento, DateTime.Today, DateTime.Today, DateTime.Today, true, 20));
        }

        [TestMethod()]
        public void SesionDeleteTest()
        {
            Experimento experimento = new Experimento(3, "impuestos", "lab", "juego", "juegopublico", "nota", "descripcion", "Cartago", true, false, DateTime.Today, DateTime.Today, DateTime.Today, "mensaje");
            Sesion sesion = new Sesion(4, experimento, DateTime.Today, DateTime.Today, DateTime.Today, false, 20);
            sesion.Delete(experimento,sesion);

        }
    }
}