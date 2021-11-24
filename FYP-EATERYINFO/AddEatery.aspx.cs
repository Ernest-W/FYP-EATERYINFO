using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace FYP_EATERYINFO
{
    public partial class AddEatery : System.Web.UI.Page
    {
        string connectionString =  @"server=localhost;user id=root;database=pythontest;password=91121322;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Clear();
                GridFill();
            }

            btnUpdate.Visible = false;
            btnUpdate.Enabled = false;

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                using (MySqlConnection sqlcon = new MySqlConnection(connectionString))
                {
                    sqlcon.Open();
                    MySqlCommand sqlCmd = new MySqlCommand("EateryInfoAdd", sqlcon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;

                    sqlCmd.Parameters.AddWithValue("_EateryID", tb_EateryID.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("_EateryName", tb_EateryName.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("_Address", tb_Address.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("_Latitude", tb_Latitude.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("_Longtitude", tb_Longtitude.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("_Descriptions", tb_Descriptions.Text.Trim());
                    sqlCmd.ExecuteNonQuery();

                    GridFill();

                    Clear();

                    lbl_successmessage.Text = "Submitted Successfully";


                }
            }
            catch (Exception)
            {

                lbl_errormessage.Text = "Error cannot submit";
            }
        }

        void Clear()
        {
            tb_EateryID.Text = tb_EateryName.Text = tb_Address.Text = tb_Latitude.Text = tb_Longtitude.Text = "";
            tb_Descriptions.Text = "";

            btnSave.Text = "Save";
            btnDelete.Enabled = false;
            lbl_errormessage.Text = lbl_successmessage.Text = "";

            btnSave.Enabled = true;
            btnSave.Visible = true;

            tb_EateryID.Enabled = true;
        }

        void btnUpdates()
        {
            try
            {
                using (MySqlConnection sqlcon = new MySqlConnection(connectionString))
                {
                    sqlcon.Open();
                    MySqlCommand sqlCmd = new MySqlCommand("EateryUpdate", sqlcon);
                    sqlCmd.CommandType = CommandType.StoredProcedure;

                    sqlCmd.Parameters.AddWithValue("_EateryID", tb_EateryID.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("_EateryName", tb_EateryName.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("_Address", tb_Address.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("_Latitude", tb_Latitude.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("_Longtitude", tb_Longtitude.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("_Descriptions", tb_Descriptions.Text.Trim());
                    sqlCmd.ExecuteNonQuery();

                    GridFill();

                    Clear();

                    lbl_successmessage.Text = "Updated Successfully";
                }
            }
            catch (Exception)
            {

                lbl_errormessage.Text = "Error cannot submit";
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }

        void GridFill()
        {
            using (MySqlConnection sqlcon = new MySqlConnection(connectionString))
            {
                sqlcon.Open();
                MySqlDataAdapter sqlDa = new MySqlDataAdapter("EateryViewAll", sqlcon);
                sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                gvEateryInfo.DataSource = dtbl;
                gvEateryInfo.DataBind();
            }
        }

        protected void EaterySelect_Click(object sender, EventArgs e)
        {

            int EateryID = Convert.ToInt32((sender as LinkButton).CommandArgument);

            using (MySqlConnection sqlcon = new MySqlConnection(connectionString))
            {
                sqlcon.Open();
                MySqlDataAdapter sqlDa = new MySqlDataAdapter("EateryViewByID", sqlcon);
                sqlDa.SelectCommand.Parameters.AddWithValue("_EateryID", EateryID);
                sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);

                tb_EateryID.Text = dtbl.Rows[0][0].ToString();
                tb_EateryName.Text = dtbl.Rows[0][1].ToString();
                tb_Address.Text = dtbl.Rows[0][2].ToString();
                tb_Latitude.Text = dtbl.Rows[0][3].ToString();
                tb_Longtitude.Text = dtbl.Rows[0][4].ToString();
                tb_Descriptions.Text = dtbl.Rows[0][5].ToString();

                btnSave.Visible = false;
                btnSave.Enabled = false;
                btnDelete.Enabled = true;

                btnUpdate.Enabled = true;
                btnUpdate.Visible = true;

                tb_EateryID.Enabled = false;

                btnDelete.Enabled = true;

            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            btnUpdates();

            tb_EateryID.Enabled = true;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            using (MySqlConnection sqlcon = new MySqlConnection(connectionString))
            {
                sqlcon.Open();
                MySqlCommand sqlCmd = new MySqlCommand("EateryDeleteByID", sqlcon);
                sqlCmd.CommandType = CommandType.StoredProcedure;

                sqlCmd.Parameters.AddWithValue("_EateryID", tb_EateryID.Text.Trim());
                sqlCmd.ExecuteNonQuery();

                GridFill();

                Clear();

                lbl_successmessage.Text = "Deleted Successfully";

            }
        }

    }
}