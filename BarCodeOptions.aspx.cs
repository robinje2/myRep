using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CIS.BL;
using CIS.Common;
using System.Data;
using CIS.Data;
using System.Drawing;

namespace CIS
{
    public partial class BarCodeOptions : SysUIBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadItemsToPrint();
                ShowTotal();
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("AccPacInventory.aspx");
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("POOptions.aspx");
        }

        public void ShowTotal()
        {

            Label lblUser = this.Master.FindControl("UserID") as Label;
            lblUser.Text = oSession.LoggedInEmployee.FirstName + " " + oSession.LoggedInEmployee.LastName;

        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("TransferOptions.aspx");
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("PrintOptions.aspx");
        }
        protected void grdPrint_RowCommand(object sender, GridViewCommandEventArgs e)
        {


        }
        protected void grdPrint_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
        protected void grdPrint_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
       
        public void LoadItemsToPrint()
        {

            //DataTable table = CISFile.GetItemsToPrint(oSession.LogedInUserId);
            //grdPrint.DataSource = table;
            //grdPrint.DataBind();
            //table = null;

        }
       

    }
}