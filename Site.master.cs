using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //RadPanelBar3.DataSource = CreateTestTable();
        ////Establish hierarchy:   
        //RadPanelBar3.DataFieldID = "ID";
        //RadPanelBar3.DataFieldParentID = "ParentID";
        ////Set Text, Value, and NavigateUrl:   
        //RadPanelBar3.DataTextField = "Text";
        //RadPanelBar3.DataValueField = "ID";
        //RadPanelBar3.DataNavigateUrlField = "URL";
        //RadPanelBar3.DataBind();
    }
    private DataTable CreateTestTable()
    {
        DataTable table = new DataTable();
        table.Columns.Add("ID");
        table.Columns.Add("ParentID");
        table.Columns.Add("Text");
        table.Columns.Add("URL");
        //table.Columns.Add("Tooltip");
        table.Rows.Add(new string[] { "1", null, "Masters"/*, "root1.aspx", "root 1 tooltip"*/ });
        table.Rows.Add(new string[] { "2", null, "Transactions"/*, "root2.aspx", "root 1 tooltip"*/ });
        table.Rows.Add(new string[] { "3", null, "Reports"/*, "root2.aspx", "root 1 tooltip"*/ });

        table.Rows.Add(new string[] { "33", "1", "Product", "MS/M/frmProduct.aspx"/*, "child 1.3 tooltip"*/ });
        table.Rows.Add(new string[] { "10", "1", "ContainerPenalty"/*, "MS/M/frmContainerPenalty.aspx", "child 1.3 tooltip"*/ });
        table.Rows.Add(new string[] { "11", "1", "Contractors"/*, "MS/M/frmContractors.aspx", "child 1.3.1 tooltip"*/ });
        table.Rows.Add(new string[] { "12", "2", "DeliveryChallan"/*, "MS/M/frmDeliveryChallan.aspx", "child 1.3.2 tooltip"*/ });
        table.Rows.Add(new string[] { "13", "1", "Executive"/*, "MS/M/frmExecutive.aspx", "child 1.3.3 tooltip"*/ });
        table.Rows.Add(new string[] { "14", "2", "IndentEntry"/*, "MS/M/frmIndentEntry.aspx", "child 1.2 tooltip"*/ });
        table.Rows.Add(new string[] { "15", "1", "Insurance"/*, "MS/M/frmInsurance.aspx", "child 1.3 tooltip"*/ });
        table.Rows.Add(new string[] { "16", "1", "MilkEmps"/*, "MS/M/frmMilkEmps.aspx", "child 1.3.1 tooltip"*/ });
        table.Rows.Add(new string[] { "17", "1", "MSOMaster"/*, "MS/M/frmMSOMaster.aspx", "child 1.3.2 tooltip"*/ });
        table.Rows.Add(new string[] { "18", "1", "PartyMaster"/*, "MS/M/frmPartyMaster.aspx", "child 1.3.3 tooltip"*/ });
        table.Rows.Add(new string[] { "19", "1", "PartyTypeMaster"/*, "MS/M/frmPartyTypeMaster.aspx", "child 1.2 tooltip"*/ });
        table.Rows.Add(new string[] { "20", "1", "ProductDetails"/*, "MS/M/frmProductDetails.aspx", "child 1.3 tooltip"*/ });
        table.Rows.Add(new string[] { "21", "1", "ProductComplaint", "MS/M/frmProductComplaint.aspx",/* "child 1.3.1 tooltip"*/ });
        table.Rows.Add(new string[] { "22", "1", "ProductRate"/*, "MS/M/frmProductRate.aspx", "child 1.3.2 tooltip"*/ });
        table.Rows.Add(new string[] { "23", "2", "ProductReleaseOrder"/*, "MS/M/frmProductReleaseOrder.aspx", "child 1.3.3 tooltip"*/ });
        table.Rows.Add(new string[] { "24", "1", "ProductSequence"/*, "MS/M/frmProductSequence.aspx", "child 1.2 tooltip"*/ });
        table.Rows.Add(new string[] { "25", "1", "ProductType"/*, "MS/M/frmProductType.aspx", "child 1.3 tooltip"*/ });
        table.Rows.Add(new string[] { "26", "1", "RateType"/*, "MS/M/frmRateType.aspx", "child 1.3.1 tooltip"*/ });
        table.Rows.Add(new string[] { "27", "1", "RouteShifts", "MS/M/frmRouteShift.aspx"/*, "child 1.3.2 tooltip"*/ });
        table.Rows.Add(new string[] { "28", "1", "Shifts"/*, "MS/M/frmShifts.aspx", "child 1.3.3 tooltip"*/ });
        table.Rows.Add(new string[] { "29", "1", "StorageArea"/*, "MS/M/frmStorageArea.aspx", "child 1.2 tooltip"*/ });
        table.Rows.Add(new string[] { "30", "1", "UserVsStorage"/*, "MS/M/frmUserVsStorage.aspx", "child 1.3 tooltip"*/ });
        table.Rows.Add(new string[] { "31", "1", "SchemesMaster"/*, "MS/M/frmSchemesMaster.aspx", "child 1.3.1 tooltip"*/ });
        table.Rows.Add(new string[] { "32", "1", "OutletTypeSchemes"/*, "MS/M/frmOutletTypeSchemes.aspx", "child 1.3.2 tooltip"*/ });

        return table;
    }
   
}
