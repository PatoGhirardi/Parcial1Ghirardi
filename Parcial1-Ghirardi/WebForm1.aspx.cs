using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial1_Ghirardi
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != string.Empty)
            {
                SqlDataSource2.Insert();
                GridView1.DataBind();
                StreamWriter Log = new StreamWriter($"{Server.MapPath(".")}/log.txt",true);
                Log.WriteLine("Marca de vehiculo");
                Log.WriteLine(TextBox1.Text);
                Log.WriteLine("--------------");
                Log.Close();
            }

            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (TextBox2.Text != string.Empty)
            {
                SqlDataSource1.Insert();
                GridView2.DataBind();
                StreamWriter Log = new StreamWriter($"{Server.MapPath(".")}/log.txt", true);
                Log.WriteLine("Nombre de vehiculo");
                Log.WriteLine(TextBox2.Text);
                Log.WriteLine("--------------");
                Log.Close();
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlDataSource1.FilterExpression = "idAutomovilMarca = " +DropDownList1.SelectedValue;
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            SqlDataSource1.FilterExpression = string.Empty;
            SqlDataSource1.FilterParameters.Clear();

            }
    }
}