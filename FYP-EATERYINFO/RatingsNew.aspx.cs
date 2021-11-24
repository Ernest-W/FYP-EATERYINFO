using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_EATERYINFO
{
    public partial class RatingsNew : System.Web.UI.Page
    {
        DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = this.GetData("SELECT AVG(rating) AS AverageRating, COUNT(rating) AS RatingCount FROM rating");
                Rating1.CurrentRating = Convert.ToInt32(dt.Rows[0]["AverageRating"]);
                lbresultusers.Text = string.Format("{0} Users have rated.", dt.Rows[0]["RatingCount"]);
                lbresultaverage.Text = string.Format("Average Rating {0}", dt.Rows[0]["AverageRating"]);

                ratingshow();

            }
        }

        private DataTable GetData(string query)
        {
            MySqlConnection con = new MySqlConnection("server=localhost;user id=root;database=pythontest;password=91121322;");
            MySqlCommand cmd = new MySqlCommand(query);
            MySqlDataAdapter sda = new MySqlDataAdapter();
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            sda.SelectCommand = cmd;
            sda.Fill(dt);
            return dt;
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            MySqlConnection con = new MySqlConnection("server=localhost;user id=root;database=pythontest;password=91121322;");
            MySqlCommand cmd = new MySqlCommand("insert into rating (rating, review) values (@rating,@review)");
            MySqlDataAdapter sda = new MySqlDataAdapter();
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@rating", Rating1.CurrentRating.ToString());
            cmd.Parameters.AddWithValue("@review", txtreview.Text);
            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        void ratingshow()
        {
            string constr = ("server=localhost;user id=root;database=pythontest;password=91121322;");

            using (MySqlConnection sqlcon = new MySqlConnection(constr))
            {
                sqlcon.Open();
                MySqlDataAdapter sqlDa = new MySqlDataAdapter("EateryRatingShow", sqlcon);
                sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);

                lblrating1.Text = dtbl.Rows[0][0].ToString();
                lblrating2.Text = dtbl.Rows[1][0].ToString();
                lblrating3.Text = dtbl.Rows[2][0].ToString();
                lblrating4.Text = dtbl.Rows[3][0].ToString();
                lblrating5.Text = dtbl.Rows[4][0].ToString();
            }
        }
    }
}