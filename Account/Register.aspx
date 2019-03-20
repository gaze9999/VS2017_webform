<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="test2.Account.Register" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script type="text/javascript">
        function ValidateEmail(sender, args) {
            var v = document.getElementById('<%=Email.ClientID%>').value;
            var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);

            if (!pattern.test(v)) {
                args.IsValid = false;  // field is empty
            }
            else {
                args.IsValid = true;
            }

        
        }
    
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
  
                    <h2>
                        創造新帳號
                    </h2>
                    <p>
                        請使用下列資訊創造
                    </p>
                    <span class="failureNotification">
                        <asp:Literal ID="ErrorMessage" runat="server"></asp:Literal>
                    </span>
                    <asp:ValidationSummary ID="RegisterUserValidationSummary" runat="server" CssClass="failureNotification" 
                         ValidationGroup="RegisterUserValidationGroup"/>
                    <div class="accountInfo">
                        <fieldset class="register">
                            <legend>帳號資訊</legend>
                            <p>
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">使用者名稱:</asp:Label>
                                <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" 
                                     CssClass="failureNotification" ErrorMessage="需填入使用者名稱" ToolTip="需填入使用者名稱" 
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                            </p>
                            <p>
                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">使用者信箱:</asp:Label>
                                <asp:TextBox ID="Email" runat="server" CssClass="textEntry"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" 
                                     CssClass="failureNotification" ErrorMessage="需要填入信箱" ToolTip="需要填入信箱" 
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                <asp:CustomValidator ID="EmailCustomClient" runat="server" ClientValidationFunction="ValidateEmail" 
                                ControlToValidate="Email" ValidationGroup="RegisterUserValidationGroup" ErrorMessage="不是正確的信箱格式"></asp:CustomValidator>
                                  <asp:CustomValidator ID="CustomValidatorServer" runat="server" OnServerValidate="ValidateEmail_Server" 
                                ControlToValidate="Email" ValidationGroup="RegisterUserValidationGroup" ErrorMessage="信箱已存在"></asp:CustomValidator>
                            </p>
                            <p>
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">密碼:</asp:Label>
                                <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
                                     CssClass="failureNotification" ErrorMessage="需填入密碼" ToolTip="需填入密碼" 
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                            </p>
                            <p>
                                <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">再次確認密碼:</asp:Label>
                                <asp:TextBox ID="ConfirmPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ControlToValidate="ConfirmPassword" CssClass="failureNotification" Display="Dynamic" 
                                     ErrorMessage="需確認密碼" ID="ConfirmPasswordRequired" runat="server" 
                                     ToolTip="需確認密碼" ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                     CssClass="failureNotification" Display="Dynamic" ErrorMessage="密碼不相同" ToolTip="密碼不相同"
                                     ValidationGroup="RegisterUserValidationGroup">*</asp:CompareValidator>
                            </p>
                        </fieldset>
                        <p class="submitButton">
                            <asp:Button ID="CreateUserButton" runat="server" Text="創造使用者" 
                                 ValidationGroup="RegisterUserValidationGroup" 
                                onclick="CreateUserButton_Click"/>
                        </p>
                    </div>
               
</asp:Content>