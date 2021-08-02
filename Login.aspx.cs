using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Net;

public partial class Login : System.Web.UI.Page
{
    MySqlCommand cmd;
    VehicleDBMgr vdm;

    protected void Page_Load(object sender, EventArgs e)
    {
        vdm = new VehicleDBMgr();
        //if (Session["UserName"] != null)
        //{
        //    Response.Redirect("Default.aspx", false);
        //}
    }
    //protected void btnLogin_Click(object sender, EventArgs e)
    //{
    //    try
    //    {

    //        String UN = "";
    //        lbl_validation.Text = "";
    //        String UserName = txtUserName.Text, PassWord = txtPassword.Text;
    //        cmd = new MySqlCommand("select * from empmanage where UserName=@UN and Password=@Pwd");
    //        cmd.Parameters.Add("@UN", UserName);
    //        cmd.Parameters.Add("@Pwd", PassWord);
    //        DataTable dtemp = vdm.SelectQuery(cmd).Tables[0];
    //        if (dtemp.Rows.Count > 0)
    //        {
    //            string LevelType = dtemp.Rows[0]["LevelType"].ToString();
    //            if (LevelType == "Dispatcher")
    //            {
    //                //cmd = new MySqlCommand("SELECT tripdata.Status, tripdata.AssignDate, tripdata.Sno, tripdata.Permissions, tripdata.EmpId, triproutes.RouteID, empmanage.Sno AS EmpSno, empmanage.UserName,  branchdata.sno AS BranchSno, empmanage.Userdata_sno, empmanage.LevelType, empmanage.Branch, salestypemanagement.salestype, branchroutes.BranchID FROM tripdata INNER JOIN triproutes ON tripdata.Sno = triproutes.Tripdata_sno INNER JOIN empmanage ON tripdata.EmpId = empmanage.Sno INNER JOIN branchdata ON empmanage.Branch = branchdata.sno INNER JOIN salestypemanagement ON branchdata.SalesType = salestypemanagement.sno INNER JOIN dispatch ON triproutes.RouteID = dispatch.sno INNER JOIN dispatch_sub ON dispatch.sno = dispatch_sub.dispatch_sno INNER JOIN branchroutes ON dispatch_sub.Route_id = branchroutes.Sno WHERE (tripdata.Status = 'A') AND (empmanage.UserName = @UN) AND (empmanage.Password = @Pwd)GROUP BY dispatch.DispName");
    //                cmd = new MySqlCommand("SELECT branchroutes.BranchID, tripdata.Sno,tripdata.I_Date FROM  tripdata INNER JOIN triproutes ON tripdata.Sno = triproutes.Tripdata_sno INNER JOIN dispatch ON triproutes.RouteID = dispatch.sno INNER JOIN dispatch_sub ON dispatch.sno = dispatch_sub.dispatch_sno INNER JOIN branchroutes ON dispatch_sub.Route_id = branchroutes.Sno WHERE (tripdata.Status = 'A') AND (tripdata.EmpId = @EmpId)GROUP BY dispatch.DispName");
    //                cmd.Parameters.Add("@EmpId", dtemp.Rows[0]["Sno"].ToString());
    //                DataTable dt = vdm.SelectQuery(cmd).Tables[0];
    //                if (dt.Rows.Count > 0)
    //                {
    //                    Session["UserName"] = "";
    //                    Session["userdata_sno"] = "";
    //                    Session["UserSno"] = "";
    //                    Session["count"] = "";
    //                    Session["routearray"] = "";
    //                    Session["RouteId"] = "";
    //                    Session["TripdataSno"] = "";
    //                    Session["TripID"] = "";
    //                    Session["Permissions"] = "";
    //                    Session["Salestype"] = "";
    //                    Session["BranchSno"] = "";
    //                    Session["LevelType"] = dtemp.Rows[0]["LevelType"].ToString();
    //                    Session["PlantEmpId"] = dtemp.Rows[0]["Sno"].ToString();
    //                    Session["PlantDispSno"] = dt.Rows[0]["Sno"].ToString();
    //                    Session["DispDate"] = dt.Rows[0]["I_Date"].ToString();
    //                    Session["userdata_sno"] = dtemp.Rows[0]["UserData_sno"].ToString();
    //                    Session["UserName"] = dtemp.Rows[0]["UserName"].ToString();
    //                    Session["Permissions"] = dtemp.Rows[0]["LevelType"].ToString();
    //                    Session["CsoNo"] = dt.Rows[0]["BranchID"].ToString();
    //                    Response.Redirect("Default.aspx", false);
    //                }
    //                else
    //                {
    //                    lbl_validation.Text="Trip Not Assigned on this UserName";
    //                }
    //            }
    //            else
    //            {
    //                //cmd = new MySqlCommand("SELECT tripdata.Sno, tripdata.RouteId, tripdata.EmpId, tripdata.AssignDate, tripdata.Status, tripdata.Userdata_sno, tripdata.Remarks, empmanage.Sno AS EmpSno,empmanage.UserName, empmanage.Password, empmanage.LevelType, empmanage.Plant, empmanage.SalesOff, empmanage.Distributor, empmanage.Branch, empmanage.flag, empmanage.Userdata_sno AS Expr2, empmanage.Owner, empmanage.EmpName, empmanage.Address, empmanage.Mobno, empmanage.Email FROM tripdata INNER JOIN empmanage ON tripdata.EmpId = empmanage.Sno WHERE (empmanage.UserName = @UN) AND (empmanage.Password = @Pwd) AND (tripdata.Status = 'A') ");
    //                //cmd = new MySqlCommand("SELECT empmanage.LevelType, empmanage.UserName, empmanage.Branch, tripdata.RouteId, tripdata.EmpId, tripdata.Status, empmanage.Userdata_sno, tripdata.AssignDate, tripdata.Sno,tripdata.Permissions, empmanage.Sno AS EmpSno FROM tripdata INNER JOIN empmanage ON tripdata.EmpId = empmanage.Sno WHERE (empmanage.UserName = @UN) AND (empmanage.Password = @Pwd) AND (tripdata.Status = 'A')");
    //                //cmd = new MySqlCommand("SELECT tripdata.Status,tripdata.sno, tripdata.AssignDate, tripdata.Permissions, tripdata.EmpId, triproutes.RouteID, empmanage.Sno as EmpSno, empmanage.UserName, empmanage.Userdata_sno,empmanage.LevelType FROM  tripdata INNER JOIN triproutes ON tripdata.Sno = triproutes.Tripdata_sno INNER JOIN empmanage ON tripdata.EmpId = empmanage.Sno WHERE (tripdata.Status = 'A') AND (empmanage.UserName = @UN) AND (empmanage.Password = @Pwd)");
    //                cmd = new MySqlCommand("SELECT tripdata.Status,tripdata.AssignDate,tripdata.I_Date, tripdata.Sno, tripdata.AssignDate, tripdata.Permissions, tripdata.EmpId, triproutes.RouteID, empmanage.Sno AS EmpSno, empmanage.UserName,branchdata.Sno as BranchSno, empmanage.Userdata_sno, empmanage.LevelType, empmanage.Branch, salestypemanagement.salestype FROM tripdata INNER JOIN triproutes ON tripdata.Sno = triproutes.Tripdata_sno INNER JOIN empmanage ON tripdata.EmpId = empmanage.Sno INNER JOIN branchdata ON empmanage.Branch = branchdata.sno INNER JOIN salestypemanagement ON branchdata.SalesType = salestypemanagement.sno WHERE (tripdata.Status = 'A')  AND (empmanage.UserName = @UN) AND (empmanage.Password = @Pwd)");
    //                cmd.Parameters.Add("@UN", UserName);
    //                cmd.Parameters.Add("@Pwd", PassWord);
    //                DataTable dt = vdm.SelectQuery(cmd).Tables[0];
    //                if (dt.Rows.Count > 0)
    //                {
    //                    Session["UserName"] = dt.Rows[0]["UserName"].ToString();
    //                    Session["userdata_sno"] = dt.Rows[0]["UserData_sno"].ToString();
    //                    Session["UserSno"] = dt.Rows[0]["EmpSno"].ToString();
    //                    Session["LevelType"] = dt.Rows[0]["LevelType"].ToString();
    //                    Session["AssignDate"] = dt.Rows[0]["AssignDate"].ToString();
    //                    Session["I_Date"] = dt.Rows[0]["I_Date"].ToString();
    //                    int count = 0;
    //                    string Routes = "";
    //                    string[] routearray = new String[0] { };
    //                    foreach (DataRow dr in dt.Rows)
    //                    {
    //                        if (dt.Rows.Count > 1)
    //                        {
    //                            string RouteId = dr["RouteId"].ToString();
    //                            if (RouteId != "")
    //                            {
    //                                Routes += dr["RouteId"].ToString() + "@";
    //                                count++;
    //                            }
    //                        }
    //                    }
    //                    routearray = Routes.Split('@');
    //                    Session["count"] = count;
    //                    Session["routearray"] = routearray;
    //                    Session["RouteId"] = dt.Rows[0]["RouteId"].ToString();
    //                    Session["TripdataSno"] = dt.Rows[0]["Sno"].ToString();
    //                    Session["TripID"] = dt.Rows[0]["Sno"].ToString();
    //                    Session["Permissions"] = dt.Rows[0]["Permissions"].ToString();
    //                    Session["Salestype"] = dt.Rows[0]["salestype"].ToString();
    //                    Session["BranchSno"] = dt.Rows[0]["BranchSno"].ToString();
    //                    Response.Redirect("Default.aspx", false);
    //                }
    //                else
    //                {
    //                    lbl_validation.Text = "Trip Not Assigned on this UserName";
    //                }
    //            }
    //        }
    //        else
    //        {
    //            lbl_validation.Text = "Invalid UserName and Password";
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        lbl_validation.Text = ex.ToString();
    //    }
    //}
    //protected void btnReset_Click(object sender, EventArgs e)
    //{
    //    txtUserName.Text = "";
    //    txtPassword.Text = "";
    //}
}