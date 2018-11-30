using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Online_Shopping_Backup
{
    public partial class HomeAdmin : System.Web.UI.MasterPage
    {
		//parte del proyecto SR1 (no el SR2)
        /*
         * Funcionalidad
         * Entrada:
         * Salida:
         */
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {

                string Role = Session["Role"].ToString();

               // lbl_name1.Text = "Bienvenido " + Request.Cookies["uname"].Value;
                
                
                if (Role != null)
                {
                    if (Role == "admin")
                    {

                        //btn_submit1.Visible = true;
                    }
                    else
                    {
                        //btn_submit1.Visible = false;
                    }
                }


                else
                {
                   // btn_submit1.Visible = false;

                }


                if (Role != null)
                {
                    if (Role == "user" || Role == "admin")
                    {

                        //btn_Edit_Profile1.Visible = true;
                    }
                    else
                    {
                       // btn_Edit_Profile1.Visible = false;
                    }
                }


                else
                {
                   // btn_Edit_Profile1.Visible = false;

                }






            }
            catch
            {

            }

            //navigation();

        }


        /*
         * Funcionalidad
         * Entrada:
         * Salida:
         */

        protected void img_shopping_chart_Click(object sender, ImageClickEventArgs e)
        {
            string u_id = "";
            try
            {
                u_id = Request.Cookies["u_id"].Value;
            }
            catch
            { }

            Response.Redirect("~/add_cart.aspx?u_id=" + u_id);

        }

        /*
         * Funcionalidad
         * Entrada:
         * Salida:
         */
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Admin.aspx");
        }


        /*
         * Funcionalidad
         * Entrada:
         * Salida:
         */
        protected void btn_Edit_Profile1_Click(object sender, EventArgs e)
        {
          

           Response.Redirect("~/Edit_Profile.aspx");
        }

        /*
         * Funcionalidad
         * Entrada:
         * Salida:
         */
        protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
        {

        }




 


    }


}
