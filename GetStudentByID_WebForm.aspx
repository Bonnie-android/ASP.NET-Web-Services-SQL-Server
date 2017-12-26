<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GetStudentByID_WebForm.aspx.cs" Inherits="GetStudentByID_WebForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Get Student By ID Using Service,ADO and AJAX</title>
    <script type="text/javascript">
        function GetStudentById() {
            let id = document.getElementById("txtStudentID").value;
           // alert('Id is ' + id);
            //call the WebMethod use namespace.class.method
           // GetStudentById(id, SuccessCallBack(), ErrorCallBack());
            StudentListWebService.GetStudentById(id, SuccessCallBack, ErrorCallBack);
        }

        function SuccessCallBack(results) {
            let name = results["StudentName"];
            alert("name = " + name);
              document.getElementById("txtStudentName").value = results["StudentName"];
              document.getElementById("txtYear").value = results["StudentYear"];
              document.getElementById("txtMarks").value = results["StudentTotalMarks"];
        }

        function ErrorCallBack(error) {

        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference Path="~/StudentListWebService.asmx" />
            </Services>
        </asp:ScriptManager>
        <div>
            <table>
                <tr>
                    <td>Student ID</td>
                    <td>
                        <asp:TextBox ID="txtStudentID" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Student Name</td>
                    <td>
                        <asp:TextBox ID="txtStudentName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Student Year</td>
                    <td>
                        <asp:TextBox ID="txtYear" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Student Total Marks</td>
                    <td>
                        <asp:TextBox ID="txtMarks" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input id="btnGetData" type="button" value="Get Student Record" onclick="GetStudentById()" />
                    </td>
                </tr>

            </table>
        </div>
    </form>
</body>
</html>
