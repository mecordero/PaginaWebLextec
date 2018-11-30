using Microsoft.VisualStudio.TestTools.UnitTesting;
using Online_Shopping_Backup;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Online_Shopping_Backup.Tests
{
    [TestClass()]
    public class ExperimentoTests
    {
        MainController main = MainController.Instance;
        [TestMethod()]
        public void ExperimentDeleteTest()
        {
            Experimento experimento = new Experimento(1,"impuestos","lab","juego","juegopublico","nota","descripcion","Cartago",true,false,DateTime.Today,DateTime.Today,DateTime.Today,"mensaje");
            experimento.Delete(experimento);

        }

        [TestMethod()]
        public void ExperimentEditTest()
        {
            Experimento experimento = new Experimento(2, "impuestos", "lab", "juego", "juegopublico", "nota", "descripcion", "Cartago", true, false, DateTime.Today, DateTime.Today, DateTime.Today, "mensaje");
            experimento.Edit(2, new Experimento(2, "impuestos", "lab", "juego1", "juegopublico", "nota", "descripcion", "Cartago", true, false, DateTime.Today, DateTime.Today, DateTime.Today, "mensaje"));
        }

        [TestMethod()]
        public void ExperimentGetbyIDTest()
        {
            Experimento experimento = new Experimento(3, "impuestos", "lab", "juego", "juegopublico", "nota", "descripcion", "Cartago", true, false, DateTime.Today, DateTime.Today, DateTime.Today, "mensaje");
            experimento.GetbyID(3);
        }

        [TestMethod()]
        public void ExperimentGetAllTest()
        {
            Experimento experimento = new Experimento(3, "impuestos", "lab", "juego", "juegopublico", "nota", "descripcion", "Cartago", true, false, DateTime.Today, DateTime.Today, DateTime.Today, "mensaje");
            experimento.GetAll();
        }

        [TestMethod()]
        public void ExperimentInsertTest()
        {
            Experimento experimento = new Experimento(4, "impuestos", "lab", "juego", "juegopublico", "nota", "descripcion", "Cartago", true, false, DateTime.Today, DateTime.Today, DateTime.Today, "mensaje");
            Experimento experimento2 = new Experimento(5, "impuestos", "lab", "juego", "juegopublico", "nota", "descripcion", "Cartago", true, false, DateTime.Today, DateTime.Today, DateTime.Today, "mensaje");

        }
    }
}