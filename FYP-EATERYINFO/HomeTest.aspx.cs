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
    public partial class HomeTest : System.Web.UI.Page
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
                    cmd.CommandText = " SELECT EateryID, EateryName, Address from Favourites ";
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

        protected void recordfound()
        {
            string constr = ConfigurationManager.ConnectionStrings["FavouritesDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {


                    cmd.Connection = con;
                    cmd.CommandText = " SELECT EateryID, EateryName from Favourites WHERE EateryName = '" + tb_search.Text + "' ";

                    SqlDataReader dr = cmd.ExecuteReader();

                    bool recordfound = dr.Read();

                    if (recordfound)
                    {
                        GridView1.Visible = true;

                        tb_EateryName.Text = dr["EateryName"].ToString();

                    }

                    else
                    {

                        GridView1.Visible = false;

                        tb_EateryName.Text = "  ";

                    }

                    con.Close();
                }
            }


        }


        //protected void Favourite(object sender, EventArgs e)
        //{
        //    //Get button that raised the event
        //    Button btn = (Button)sender;

        //    //Get the row that contains the button
        //    GridViewRow gvr = (GridViewRow)btn.NamingContainer;

        //    //Try to convert
        //    //int id = Convert.ToInt32(gvr.DataItem);

        //    string constr = ConfigurationManager.ConnectionStrings["FavouritesDB"].ConnectionString;
        //    using (SqlConnection con = new SqlConnection(constr))
        //    {
        //        using (SqlCommand cmd = new SqlCommand())
        //        {
        //            cmd.Connection = con;
        //            cmd.CommandText = " SELE";
        //            cmd.CommandText = " update Favourites set AddedtoFavourites = 1 where EateryID = '" + gvr + "'";
        //            con.Open();
        //            cmd.ExecuteNonQuery();
        //            con.Close();
        //        }
        //    }

        //    Response.Redirect("Favourite.aspx");
        //}




        protected void Favourite(object sender, EventArgs e)
        {
            SqlConnection conn;
            SqlCommand comm;
            string constr = ConfigurationManager.ConnectionStrings["FavouritesDB"].ConnectionString;

            //Get button that raised the event
            Button btn = (Button)sender;

            //Get the row that contains the button
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            conn = new SqlConnection(constr);
            comm = new SqlCommand();
            conn.Open();
            SqlParameter eateryID = new SqlParameter("@ID", SqlDbType.Int);

            //comm.Parameters.Add(eateryID);

            //eateryID.Value = Convert.ToInt32(gvr.Cells[1].Text);
            eateryID.Value = int.TryParse(gvr.Cells[2].Text, out int EateryId);

            comm.Connection = conn;
            //comm.CommandText = "update Favourites set AddedtoFavourites = 1 where EateryID = '" + EateryId + "'";
            comm.CommandText = "update Favourites set AddedtoFavourites = 1 where EateryID = 2";
            comm.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("Favorite.aspx");
        }




        //protected void Favourite(object sender, GridViewCommandEventArgs e)
        //{

        //    SqlConnection conn;
        //    SqlCommand comm;
        //    string constr = ConfigurationManager.ConnectionStrings["FavouritesDB"].ConnectionString;

        //    //Get button that raised the event
        //    Button btn = (Button)sender;

        //    //Get the row that contains the button
        //    GridViewRow gvr = (GridViewRow)btn.NamingContainer;

        //    conn = new SqlConnection(constr);
        //    comm = new SqlCommand();
        //    conn.Open();
        //    SqlParameter eateryID = new SqlParameter("@ID", SqlDbType.Int);

        //    //comm.Parameters.Add(eateryID);

        //    //eateryID.Value = Convert.ToInt32(gvr.Cells[1].Text);
        //    eateryID.Value = int.TryParse(gvr.Cells[0].Text, out int EateryId);


        //    comm.Connection = conn;
        //    comm.CommandText = "update Favourites set AddedtoFavourites = 1 where EateryID = '" + EateryId + "'";
        //    comm.ExecuteNonQuery();
        //    conn.Close();

        //    Response.Redirect("Favourite.aspx");
        //}





        protected void btn_search_Click(object sender, EventArgs e)
        {

            string constr = ConfigurationManager.ConnectionStrings["FavouritesDB"].ConnectionString;
            MySqlDataAdapter myda;
            DataSet myds;
            MySqlConnection mycn = new MySqlConnection(constr);

            myda = new MySqlDataAdapter("SELECT EateryID, EateryName, Address, from Favourites WHERE EateryName LIKE '" + tb_search.Text + "%' ", mycn);
            {
                myds = new DataSet();
                myda.Fill(myds, "Favourites");
                GridView1.DataSource = myds.Tables["Favourites"];
                GridView1.DataBind();
            }


            recordfound();
            BindGrid();
        }

        //protected void btn_Add(object sender, EventArgs e)
        //{
        //    string constr = ConfigurationManager.ConnectionStrings["favouritesdb"].ConnectionString;
        //    using (SqlConnection con = new SqlConnection(constr))
        //    {
        //        using (SqlCommand cmd = new SqlCommand())
        //        {
        //            cmd.Connection = con;
        //            cmd.CommandText = " update Favourites set AddedtoFavourites=0 where EateryID=2 ";
        //            con.Open();
        //            cmd.ExecuteNonQuery();
        //            con.Close();
        //        }
        //    }
        //}


    }
}