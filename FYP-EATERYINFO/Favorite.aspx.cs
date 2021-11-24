using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace FYP_EATERYINFO
{
    public partial class Favourite : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }



        protected void BindGrid()
        {


            string constr = ConfigurationManager.ConnectionStrings["FavouritesDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandText = " SELECT EateryID, EateryName, Address from Favourites where AddedtoFavourites=1";
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }


        }



        protected void Unfavourite(object sender, EventArgs e)
        {
            //Get button that raised the event
            LinkButton btn = (LinkButton)sender;

            //Get the row that contains the button
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            //Try to convert
            //int id = Convert.ToInt32(gvr.DataItem);

            string constr = ConfigurationManager.ConnectionStrings["FavouritesDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    //cmd.CommandText = " update Favourites set AddedtoFavourites = 0 where EateryID = '" + gvr.RowIndex + "'";
                    cmd.CommandText = "update Favourites set AddedtoFavourites = 0 where EateryID = 2";
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            Response.Redirect("HomeTest.aspx");
        }
    }
}