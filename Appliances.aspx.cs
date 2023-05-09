using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Xml;
using CIS.BL;
using CIS.Data;
using System.Text;
using System.Data.SqlClient;

namespace CIS
{
    public partial class Appliances : SysUIBase
    {
        private String sCISNumber = "";

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                LoadOptions();
                sCISNumber = CISFile.GetCISNumber(oSession.CISID);
                if (!Page.IsPostBack)
                {
                    oSession.uploadItems.Clear();

                }

                ShowPath();
            }

           
        }
        public void LoadOptions()
        {

            DataTable table = new DataTable();
            table.Columns.Add("Count");
            table.Columns.Add("Area");


            
            DataRow row = table.NewRow();
            row["Count"] = 1;
            row["Area"] = "Range";
            table.Rows.Add(row);

            row = table.NewRow();
            row["Count"] = 2;
            row["Area"] = "Dishwasher";
            table.Rows.Add(row);

            row = table.NewRow();
            row["Count"] = 3;
            row["Area"] = "Fridge";
            table.Rows.Add(row);

            row = table.NewRow();
            row["Count"] = 4;
            row["Area"] = "Microwave";
            table.Rows.Add(row);

            row = table.NewRow();
            row["Count"] = 5;
            row["Area"] = "Wall Oven";
            table.Rows.Add(row);

            row = table.NewRow();
            row["Count"] = 6;
            row["Area"] = "Range Hood";
            table.Rows.Add(row);

            row = table.NewRow();
            row["Count"] = 6;
            row["Area"] = "Kitchen Sink";
            table.Rows.Add(row);

            row = table.NewRow();
            row["Count"] = 7;
            row["Area"] = "Vanity Sink";
            table.Rows.Add(row);

            row = table.NewRow();
            row["Count"] = 8;
            row["Area"] = "Toilet";
            table.Rows.Add(row);

            row = table.NewRow();
            row["Count"] = 9;
            row["Area"] = "Tub";
            table.Rows.Add(row);

            row = table.NewRow();
            row["Count"] = 10;
            row["Area"] = "Washer";
            table.Rows.Add(row);

            row = table.NewRow();
            row["Count"] = 11;
            row["Area"] = "Dryer";
            table.Rows.Add(row);

            row = table.NewRow();
            row["Count"] = 12;
            row["Area"] = "Other";
            table.Rows.Add(row);


            dtCISList.DataSource = table;
            dtCISList.DataBind();

            oSession.Appliance = "Range";

            loadGridview(grdAppliances, 7);
            loadGridview(grdAppliances2, 8);

        }
        protected void dtCISList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void dtCISList_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||
                  e.Item.ItemType == ListItemType.AlternatingItem)
            {
                String name = ((DataRowView)e.Item.DataItem).Row[0].ToString();
                String Id = ((DataRowView)e.Item.DataItem).Row[1].ToString();


                Button btnCIS = (Button)e.Item.FindControl("btnCIS");
                btnCIS.Text = Id;
                btnCIS.CommandArgument = Id;
                
            }
            
        }
        protected void btnCIS_Click(object sender, EventArgs e)
        {
            if (sender is Button)
            {

                grdAppliances.Columns[0].HeaderText = oSession.Appliance;
                oSession.Appliance = GetValid(((Button)sender).CommandArgument);
                
                if (!CIS.BL.CISDetails.IsAlreadyExists(oSession.QuoteID, oSession.Appliance, "Width"))
                {

                    DataTable table = RoomData.GetAppliancesSpecList(oSession.Appliance);
                 
                    foreach (DataRow row in table.Rows)
                    {
                       // String cisId, String roomId, int fieldId, int categoryId, String sField, String sValue
                        saveDetails(oSession.QuoteID, oSession.Appliance, 1, 7, row["FieldName"].ToString(),"");
                    }
                    table = null;
                    loadGridview(grdAppliances, 7);
                    loadGridview(grdAppliances2, 8);
                }
                else
                {
                    loadGridview(grdAppliances, 7);
                    loadGridview(grdAppliances2, 8);
                }
            }

        }
        public void ShowPath()
        {

            ShowMasterMessage("<a style='color:#FFFFFF;font-size:16px;font-weight:bold'  href=\"cisRoomList.aspx\">" + oSession.Contractor + "-" + oSession.Selected_CIS +  " Appliances</a>");
        }
        protected void grdQuotes_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        private void loadGridview(GridView gridview, int category)
        {
            DataTable table = CIS.BL.CISDetails.GetApplianceSpecs(oSession.QuoteID, oSession.Appliance, category);
         
            if (table.Rows.Count <= 0)
            {
                table.Rows.Add(table.NewRow());
            }

            gridview.DataSource = table;
            gridview.DataBind();

            

        }
        protected void btnSaveSec7_Click(object sender, EventArgs e)
        {
            //NO VALIDATION FOR Appliances..
            this.SaveGridData(grdAppliances, 7);
            this.SaveGridData(grdAppliances2, 8);

            //btnSave_Click(sender, e);
           // ShowMsg(" CIS Details Successfully Saved &nbsp;", lblFooterMessage );
        }
        
        private void SaveGridData(GridView grdFeatureGrid, int nCatID)
        {

            long cisId = oSession.CISID;
            foreach (GridViewRow row in grdFeatureGrid.Rows)
            {
               
                String sField = "";
                String sValue = "";
                

                Label objTextBox = (Label)row.FindControl("txtItem");

                Label txtField = (Label)row.FindControl("txtField");
                sField = GetValid(txtField.Text);

                if (nCatID == 7)
                {
                    TextBox txtValue = (TextBox)row.FindControl("txtValue");
                    sValue = GetValid(txtValue.Text);
                    saveDetails(oSession.QuoteID, oSession.Appliance, 1, nCatID, sField, sValue);
                }
                else
                {
                    CheckBox chkValue = (CheckBox)row.FindControl("chkValue");
                    sValue = GetValid(chkValue.Checked);
                    saveDetails(oSession.QuoteID, oSession.Appliance, 1, nCatID, sField, sValue);
                }
            }
        }
        protected void grdFeatures_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
        }
        protected void grdFeatures2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                String sValue = GetValid(DataBinder.Eval(e.Row.DataItem, "Value"));
                CheckBox chkBox;
                if (sValue == "True")
                {
                    chkBox = (CheckBox)e.Row.FindControl("chkValue");
                    chkBox.Checked = true;
                    chkBox.Text = "";
                }
                else
                {
                    chkBox = (CheckBox)e.Row.FindControl("chkValue");
                    chkBox.Checked = false;
                    chkBox.Text = "";
                }
            }
        }
        public void LoadApplianceData(string cisId, string roomId, int category, int fieldId, Control control, Label txtItem, TextBox txtValue)
        {
            String sql = "SELECT CISDetailID, Field, [Value] FROM tblCISDetails WHERE CISID=@CISID AND ROOMID=@ROOMID AND CategoryID=@CATEGORY AND FieldID=@FieldId ORDER BY CISDetailID DESC";
            DataTable data = SysDataAdapter.GetInstance().GetData(sql, new String[] { "@CISID", "@ROOMID", "@CATEGORY", "@FieldId" }, new Object[] { cisId, roomId, category, fieldId });

            if (data.Rows.Count > 0)
            {
                //((TextBox)control).Text = GetValid(data.Rows[0]["Section1"]);
               
                txtItem.Text = GetValid(data.Rows[0]["Field"]).ToString();
                txtValue.Text = GetValid(data.Rows[0]["Value"]).ToString();

            }
        }

        private void saveDetails(String cisId, String roomId, int fieldId, int categoryId, String sField, String sValue)
        {
            if (cisId.Length > 0 && roomId.Length > 0 && fieldId > 0)
            {
                if (!CIS.BL.CISDetails.IsAlreadyExists(cisId, roomId, sField))
                {
                    String sql = " INSERT INTO tblCISDetails (CISID,RoomID, FieldID, CategoryID, Field, Value) VALUES (@CISID,@RoomID,@FieldID,@CategoryID,@Field, @Value)";
                    IList<SqlParameter> paramColl = new List<SqlParameter>();
                    paramColl.Add(new SqlParameter("@CISID", cisId));
                    paramColl.Add(new SqlParameter("@RoomID", roomId));
                    paramColl.Add(new SqlParameter("@FieldID", fieldId));
                    paramColl.Add(new SqlParameter("@CategoryID", categoryId));
                    paramColl.Add(new SqlParameter("@Field", sField));
                    paramColl.Add(new SqlParameter("@Value", sValue));
                    if (oSession.uploadItems.ContainsKey(fieldId))
                    {
                        sql = " INSERT INTO tblCISDetails (CISID,RoomID, FieldID, CategoryID, Field, Value) VALUES (@CISID,@RoomID,@FieldID,@CategoryID,@Field, @Value)";
                        UploadItem objUploadItem = oSession.uploadItems[fieldId];
                        paramColl.Add(new SqlParameter("@DataFile", objUploadItem.ItemBytes));
                    }
                    SysDataAdapter.GetInstance().ExecuteScalar(sql, paramColl);
                }
                else
                {
                    String sql = " UPDATE tblCISDetails SET Value=@Value WHERE (CISID=@CISID AND RoomID=@RoomID AND Field=@Field)";
                    IList<SqlParameter> paramColl = new List<SqlParameter>();
                    paramColl.Add(new SqlParameter("@CISID", cisId));
                    paramColl.Add(new SqlParameter("@RoomID", roomId));
                   
                    paramColl.Add(new SqlParameter("@CategoryID", categoryId));
                    paramColl.Add(new SqlParameter("@Field", sField));
                    paramColl.Add(new SqlParameter("@Value", sValue));

                   
                    SysDataAdapter.GetInstance().ExecuteScalar(sql, paramColl);
                }
            }
        }
        private void ShowMsg(String msg, Label msgLbl)
        {
            msgLbl.Text = "<B>" + msg + "</B>";
            msgLbl.ForeColor = System.Drawing.Color.White;
        }

        protected void txtValue2_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void grdAppliances2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void grdAppliances_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }

}
