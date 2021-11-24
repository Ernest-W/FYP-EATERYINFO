using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

namespace FYP_EATERYINFO
{
    public partial class Home : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            rating();
        }

        protected void BindGrid()
        {
            MySqlConnection mycon = new MySqlConnection("server=localhost;user id=root;database=pythontest;password=91121322;");
            MySqlCommand mycmd = new MySqlCommand("SELECT EateryID, EateryName, Address, Latitude, Longtitude, Descriptions, Status from eateryinformation WHERE EateryName LIKE '" + tb_search.Text + "%' ", mycon);
            MySqlDataAdapter myda = new MySqlDataAdapter(mycmd);

            DataTable mydt = new DataTable();
            myda.Fill(mydt);
            GridView1.DataSource = mydt;
            GridView1.DataBind();
        }

        protected void recordfound()
        {
            string constr = ("server=localhost;user id=root;database=pythontest;password=91121322;");
            MySqlConnection con = new MySqlConnection(constr);

            con.Open();

            //string query = "SELECT EateryID, EateryName, ImageName, Status from crowdcamera WHERE EateryName = '" + tb_search.Text + "' ";
            string query = "SELECT EateryID, EateryName, Address, Descriptions, Status, TimeStamp from eateryinformation WHERE EateryName LIKE '" + tb_search.Text + "%' ";
            MySqlCommand cmd = new MySqlCommand(query, con);
            MySqlDataReader dr = cmd.ExecuteReader();

            bool recordfound = dr.Read();

            if (recordfound)
            {
                GridView1.Visible = true;

                //lbl_Record.Text = "Eatery Information Found";
                //lbl_Record.ForeColor = System.Drawing.Color.Green;

                lbl_EateryName.Text = dr["EateryName"].ToString();
                lbl_Address.Text = dr["Address"].ToString();
                lbl_Description.Text = dr["Descriptions"].ToString();
                lbl_Status.Text = dr["Status"].ToString();
                lbl_TimeStamp.Text = dr["TimeStamp"].ToString();

                if (lbl_Status.Text == "1")
                {
                    lbl_Status.Text = "Open";

                    // creating object of DateTime
                    DateTime today = DateTime.Now;

                    // creating object of DateTime
                    DateTime date2 = new DateTime(2021, 11, 22, 14, 22, 0);

                    // getting ShortTime from DateTime
                    TimeSpan value = today.Subtract(date2);

                    if (value.TotalMinutes > 5)
                    {
                        lbl_Status.Text = "0";
                    }

                }

                else if (lbl_Status.Text == "0")
                {
                    lbl_Status.Text = "Closed";
                }

                else
                {
                    lbl_Status.Text = "Incorrect Data Input";
                }

            }

            else
            {

                GridView1.Visible = false;

                //lbl_Record.Text = "Eatery Information Not Found";
                //lbl_Record.ForeColor = System.Drawing.Color.Red;

                lbl_EateryName.Text = "  ";
                lbl_Address.Text = "   ";
                lbl_Description.Text = "  ";
                lbl_Status.Text = "   ";


            }

            con.Close();
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {

            MySqlDataAdapter myda = null;
            DataSet myds = null;
            MySqlConnection mycn = new MySqlConnection(@"server=localhost;user id=root;database=pythontest;password=91121322;");

            myda = new MySqlDataAdapter("SELECT EateryID, EateryName, Address, Descriptions, Status from eateryinformation WHERE EateryName LIKE '" + tb_search.Text + "%' ", mycn);
            {
                myds = new DataSet();
                myda.Fill(myds, "EateryInformation");
                GridView1.DataSource = myds.Tables["EateryInformation"];
                GridView1.DataBind();
            }

            recordfound();
            BindGrid();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gvr = GridView1.SelectedRow;
            lbl_EateryName.Text = gvr.Cells[1].Text;
            lbl_Address.Text = gvr.Cells[2].Text;
            lbl_Description.Text = gvr.Cells[3].Text;

            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup();", true);

        }

        void rating()
        {

            string constr = ("server=localhost;user id=root;database=pythontest;password=91121322;");

            using (MySqlConnection sqlcon = new MySqlConnection(constr))
            {
                sqlcon.Open();
                MySqlDataAdapter sqlDa = new MySqlDataAdapter("EateryRating", sqlcon);
                sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);

            }
        }

        protected void btnrate_Click(object sender, EventArgs e)
        {
            Response.Redirect("Rating.aspx");
        }


    }
}