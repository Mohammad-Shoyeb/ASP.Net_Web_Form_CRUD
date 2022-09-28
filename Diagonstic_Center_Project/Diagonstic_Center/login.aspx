<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Diagonstic_Center.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row">
       <div class="col-12">
           <h1>Login</h1>
            <div class="alert alert-warning alert-dismissible fade show" role="alert" id="alert" runat="server" visible="false">
                <strong runat="server" id="msg"></strong>.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
              </div>
           <div class="form-group row mb-1">
               <label class="col-form-label col-2 text-end">Username</label>
               <div class="col-4">
                   <asp:TextBox ID="username" runat="server" CssClass="form-control"></asp:TextBox>
                   <asp:RequiredFieldValidator ControlToValidate="username" CssClass="text-danger" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username required"></asp:RequiredFieldValidator>
               </div>
           </div>
           <div class="form-group row mb-1">
               <label class="col-form-label col-2 text-end">Password</label>
               <div class="col-4">
                   <asp:TextBox TextMode="Password" ID="password" runat="server" CssClass="form-control"></asp:TextBox>
                   <asp:RequiredFieldValidator ControlToValidate="password" CssClass="text-danger" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password required"></asp:RequiredFieldValidator>
               </div>
           </div>
           <div class="form-group row mb-1">
               
               <div class="col-4 offset-2">
                   <asp:Button CssClass="btn btn-primary" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
               </div>
           </div>
           <div class="form-group row mb-1">
               <div class="col-12">If you havn't register yet, <a href="register.aspx?ReturnUrl=<%: ReturnUrl %>">Register here</a></div>
               
           </div>
       </div>
   </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
