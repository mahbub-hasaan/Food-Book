<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Experiment.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div style="width:auto; height:1px; margin:auto; float:none; margin-bottom:10px; text-align:center; clear:both;">

</div>
<div class="">
<div class="phpkida-main">
	<h2>Register Now</h2>
		<form action="#" method="post" runat="server">
            <asp:TextBox ID="txtName" runat="server" CssClass="ggg" name="Name" placeholder="USER NAME" required="" type="text"></asp:TextBox>
            <asp:TextBox ID="txtFname" runat="server" type="text" CssClass="kkk" name="Name" placeholder="FIRST NAME" required=""></asp:TextBox>
            <asp:TextBox ID="txtLname" runat="server" type="text" CssClass="ppp" name="Name" placeholder="LAST NAME" required=""></asp:TextBox>
            <asp:TextBox ID="txtEmail" runat="server" type="email" CssClass="ggg" name="Email" placeholder="E-MAIL" required=""></asp:TextBox>
            <asp:TextBox ID="TxtPhone" CssClass="ggg" runat="server" name="Phone" placeholder="PHONE" required="" type="text"></asp:TextBox>
            <asp:TextBox ID="txtPassword" runat="server" type="password" CssClass="ggg" name="Password" placeholder="PASSWORD"  required=""></asp:TextBox>
			<h4><input type="checkbox" />I agree to the Terms of Service and Privacy Policy</h4>
			
			
            <asp:Button ID="btnSave" runat="server" Text="Button" type="submit" value="submit" name="register" OnClick="btnSave_Click" />
            <asp:Label ID="lblMsg" runat="server" CssClass="kkk" Font-Bold="True" Font-Names="Blackoak Std" ForeColor="#009933"></asp:Label>
		</form>
		<p>Already Registered. <a href="/">Login</a></p>
</div>
</div>
</body>
</html>
