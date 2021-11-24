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
    public partial class AdminRating : System.Web.UI.Page
    {

        DataTable dt = new DataTable();
        string connectionString = @"server=localhost;user id=root;database=pythontest;password=91121322;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = this.GetData("SELECT AVG(rating) AS AverageRating, COUNT(rating) AS RatingCount FROM rating");
                lbresultusers.Text = string.Format("{0} Users have rated.", dt.Rows[0]["RatingCount"]);
                lbresultaverage.Text = string.Format("Average Rating {0}", dt.Rows[0]["AverageRating"]);

                ratingshow();
                GridFill();

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

        void GridFill()
        {
            using (MySqlConnection sqlcon = new MySqlConnection(connectionString))
            {
                sqlcon.Open();
                MySqlDataAdapter sqlDa = new MySqlDataAdapter("RatingViewAll", sqlcon);
                sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                gvRatingInfo.DataSource = dtbl;
                gvRatingInfo.DataBind();
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            using (MySqlConnection sqlcon = new MySqlConnection(connectionString))
            {
                sqlcon.Open();
                MySqlCommand sqlCmd = new MySqlCommand("RatingDeleteByID", sqlcon);
                sqlCmd.CommandType = CommandType.StoredProcedure;

                sqlCmd.Parameters.AddWithValue("_id", tb_id.Text.Trim());
                sqlCmd.ExecuteNonQuery();

                GridFill();

                lbl_successmessage.Text = "Deleted Successfully";

                Response.Redirect(Request.RawUrl);

            }
        }

        protected void RatingSelect_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32((sender as LinkButton).CommandArgument);

            using (MySqlConnection sqlcon = new MySqlConnection(connectionString))
            {
                sqlcon.Open();
                MySqlDataAdapter sqlDa = new MySqlDataAdapter("RatingViewByID", sqlcon);
                sqlDa.SelectCommand.Parameters.AddWithValue("_id", id);
                sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);

                tb_id.Text = dtbl.Rows[0][0].ToString();
                tb_Rating.Text = dtbl.Rows[0][2].ToString();
                tb_Review.Text = dtbl.Rows[0][3].ToString();

            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }

        void Clear()
        {
            tb_id.Text = tb_Rating.Text = tb_Review.Text = "";
        }

        protected void gvRatingInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvRatingInfo.PageIndex = e.NewPageIndex;
            this.GridFill();
        }
    }
}