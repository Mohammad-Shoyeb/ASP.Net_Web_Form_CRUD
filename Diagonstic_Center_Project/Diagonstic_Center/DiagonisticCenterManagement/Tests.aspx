<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tests.aspx.cs" Inherits="Diagonstic_Center.DiagonisticCenterManagement.Tests" %>

<%@ Register Src="~/DiagonisticCenterManagement/testsWebUserControl.ascx" TagPrefix="uc1" TagName="testsWebUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
        <link href="../Content/icons/font/bootstrap-icons.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
 <div class="row">
        <div class="col-12">
            <h2 class="display-5" style="background-color:antiquewhite; text-align:center; color: black; font-weight: 500;">Tests</h2>

        </div>
    </div>
    <div class="row px-2 mx-2">
        <div class="col-12">
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="testid" DataSourceID="odsTests" InsertItemPosition="LastItem" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">
                
                <EditItemTemplate>
                    <tr style="">
                        <td style="width:150px; text-align:center;">
                            <asp:Button CssClass="btn btn-primary btn-sm" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button CssClass="btn btn-secondary btn-sm" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ValidationGroup="ge" ID="testidLabel1" runat="server" Text='<%# Eval("testid") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="ge" ControlToValidate="testidLabel1" ID="RequiredFieldValidator1" runat="server" ErrorMessage="testid is Required"></asp:RequiredFieldValidator>

                        </td>
                        <td>
                            <asp:TextBox  ValidationGroup="ge"  ID="testnameTextBox" runat="server" Text='<%# Bind("testname") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="ge" ControlToValidate="testnameTextBox" ID="RequiredFieldValidator2" runat="server" ErrorMessage="testname is Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ValidationGroup="ge" ID="feeTextBox" runat="server" Text='<%# Bind("fee") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="ge" ControlToValidate="feeTextBox" ID="RequiredFieldValidator3" runat="server" ErrorMessage="fee is Required"></asp:RequiredFieldValidator>

                        </td>
                        <td>
                            <asp:DropDownList ID="typeidTextBox" DataSourceID="odsTesttypes"  runat="server" SelectedValue='<%# Bind("typeid") %>' DataTextField="typename" DataValueField="typeid">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="" class="table table-bordered">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button  CssClass="btn btn-primary btn-sm" ValidationGroup="gi" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button CssClass="btn btn-secondary btn-sm"  ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:TextBox ValidationGroup="gi" ID="testnameTextBox" runat="server" Text='<%# Bind("testname") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="gi" ControlToValidate="testnameTextBox" ID="RequiredFieldValidator2" runat="server" ErrorMessage="testname is Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ValidationGroup="gi" ID="feeTextBox" runat="server" Text='<%# Bind("fee") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="gi" ControlToValidate="feeTextBox" ID="RequiredFieldValidator3" runat="server" ErrorMessage="fee is Required"></asp:RequiredFieldValidator>

                        </td>
                        <td>
                            <asp:DropDownList ID="typeidTextBox" DataSourceID="odsTesttypes" AppendDataBoundItems="true" runat="server" SelectedValue='<%# Bind("typeid") %>' DataTextField="typename" DataValueField="typeid">
                                 <asp:ListItem Text="Select" Value="" Selected="True"></asp:ListItem> 
                            </asp:DropDownList>
                           
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button CssClass="btn btn-outline-dark"  ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="testidLabel" runat="server" Text='<%# Eval("testid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="testnameLabel" runat="server" Text='<%# Eval("testname") %>' />
                        </td>
                        <td>
                            <asp:Label ID="feeLabel" runat="server" Text='<%# Eval("fee") %>' />
                        </td>
                        <td>
                            <asp:Label ID="typeidLabel" runat="server" Text='<%# Eval("typeid") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" class="table">
                        <tr runat="server">
                            <td runat="server">
                                <table  class="table table-bordered table-striped" id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server"></th>
                                        <th runat="server">Testid</th>
                                        <th runat="server">Testname</th>
                                        <th runat="server">Fee</th>
                                        <th runat="server">Typeid</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Db %>" DeleteCommand="DELETE FROM [tests] WHERE [testid] = @testid" InsertCommand="INSERT INTO [tests] ([testname], [fee], [typeid]) VALUES (@testname, @fee, @typeid)" SelectCommand="SELECT * FROM [tests]" UpdateCommand="UPDATE [tests] SET [testname] = @testname, [fee] = @fee, [typeid] = @typeid WHERE [testid] = @testid">
                <DeleteParameters>
                    <asp:Parameter Name="testid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="testname" Type="String" />
                    <asp:Parameter Name="fee" Type="Decimal" />
                    <asp:Parameter Name="typeid" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="testname" Type="String" />
                    <asp:Parameter Name="fee" Type="Decimal" />
                    <asp:Parameter Name="typeid" Type="Int32" />
                    <asp:Parameter Name="testid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:ObjectDataSource ID="odsTests" runat="server" DataObjectTypeName="Diagonstic_Center.BLL.TestsDTO" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="GetAll" TypeName="Diagonstic_Center.BLL.TestsManager" UpdateMethod="Update"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsTesttypes" runat="server" SelectMethod="TesttypesDropItems" TypeName="Diagonstic_Center.BLL.TestsManager"></asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
