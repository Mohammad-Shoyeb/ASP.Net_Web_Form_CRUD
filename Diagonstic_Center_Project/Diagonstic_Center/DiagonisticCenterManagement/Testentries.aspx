<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Testentries.aspx.cs" Inherits="Diagonstic_Center.DiagonisticCenterManagement.Testentries" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <link href="../Content/bootstrap-datepicker.standalone.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.6.0.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row">
    <div class=" col-12">
        <h2 class="display-6">Testentries</h2>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="entryid" DataSourceID="dsTestentries" InsertItemPosition="LastItem" OnItemInserting="ListView1_ItemInserting" OnItemUpdating="ListView1_ItemUpdating">
            <EditItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button CssClass="btn btn-primary" ValidationGroup="ge" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button CssClass="btn btn-danger" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>[auto]</td>
                    <td>
                        <asp:TextBox ValidationGroup="ge" CssClass="form-control" ID="patientnameTextBox" runat="server" Text='<%# Bind("patientname") %>' />
                        <asp:RequiredFieldValidator ValidationGroup="ge" ControlToValidate="patientnameTextBox" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Patient name is Required"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <img src='<%# Eval("Picture", "/Uploads/{0}") %>' class="img-thumbnail" style="width:50px" />
                            <asp:FileUpload ValidationGroup="ge" ID="fu" runat="server" />
                            <asp:HiddenField  ID="PictureTextBox" runat="server" Value='<%# Bind("Picture") %>' />                          
                    </td>
                    <td>
                        <asp:TextBox  ValidationGroup="ge" CssClass="form-control date"   ID="dateofbirthTextBox" runat="server" Text='<%# Bind("dateofbirth","{0:yyyy-MM-dd }") %>' />
                        <asp:RequiredFieldValidator ValidationGroup="ge" ControlToValidate="dateofbirthTextBox" ID="RequiredFieldValidator2" runat="server" ErrorMessage="dateofbirth is Required"></asp:RequiredFieldValidator>

                    </td>
                    <td>
                        <asp:TextBox  ValidationGroup="ge" CssClass="form-control"  ID="mobilenoTextBox" runat="server" Text='<%# Bind("mobileno") %>' />
                        <asp:RequiredFieldValidator ValidationGroup="ge" ControlToValidate="mobilenoTextBox" ID="RequiredFieldValidator3" runat="server" ErrorMessage="mobileno is Required"></asp:RequiredFieldValidator>

                    </td>
                    <td>
                        <asp:TextBox  ValidationGroup="ge" CssClass="form-control date"  ID="testdateTextBox" runat="server" Text='<%# Bind("testdate","{0:yyyy-MM-dd }") %>' />
                        <asp:RequiredFieldValidator ValidationGroup="ge" ControlToValidate="testdateTextBox" ID="RequiredFieldValidator4" runat="server" ErrorMessage="testdate is Required"></asp:RequiredFieldValidator>

                    </td>
                    <td>
                        <asp:TextBox ValidationGroup="ge" CssClass="form-control date"  ID="duedateTextBox" runat="server" Text='<%# Bind("duedate","{0:yyyy-MM-dd }") %>' />
                        <asp:RequiredFieldValidator ValidationGroup="ge" ControlToValidate="duedateTextBox" ID="RequiredFieldValidator6" runat="server" ErrorMessage="duedate is Required"></asp:RequiredFieldValidator>

                    </td>
                    <td>
                        <asp:CheckBox ID="statusCheckBox" runat="server" Checked='<%# Bind("status") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button cssclass="btn btn-outline-dark" ValidationGroup="gi" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button cssclass="btn btn-light" ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox ValidationGroup="gi" CssClass="form-control" ID="patientnameTextBox" runat="server" Text='<%# Bind("patientname") %>' />
                        <asp:RequiredFieldValidator ValidationGroup="gi" ControlToValidate="patientnameTextBox" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Patient name is Required"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                            <asp:FileUpload ValidationGroup="gi" ID="fu" runat="server" />
                            <asp:HiddenField  ID="PictureTextBox" runat="server" Value='<%# Bind("Picture") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="gi" ControlToValidate="fu" CssClass="text-danger" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Picture Required"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox  ValidationGroup="gi" CssClass="form-control date"  ID="dateofbirthTextBox" runat="server" Text='<%# Bind("dateofbirth") %>' />
                        <asp:RequiredFieldValidator ValidationGroup="gi" ControlToValidate="dateofbirthTextBox" ID="RequiredFieldValidator2" runat="server" ErrorMessage="dateofbirth is Required"></asp:RequiredFieldValidator>

                    </td>
                    <td>
                        <asp:TextBox  ValidationGroup="gi"  CssClass="form-control " ID="mobilenoTextBox" runat="server" Text='<%# Bind("mobileno") %>' />
                        <asp:RequiredFieldValidator ValidationGroup="gi" ControlToValidate="mobilenoTextBox" ID="RequiredFieldValidator3" runat="server" ErrorMessage="mobileno is Required"></asp:RequiredFieldValidator>

                    </td>
                    <td>
                        <asp:TextBox  ValidationGroup="gi" CssClass="form-control date"  ID="testdateTextBox" runat="server" Text='<%# Bind("testdate") %>' />
                        <asp:RequiredFieldValidator ValidationGroup="gi" ControlToValidate="testdateTextBox" ID="RequiredFieldValidator4" runat="server" ErrorMessage="testdate is Required"></asp:RequiredFieldValidator>

                    </td>
                    <td>
                        <asp:TextBox ValidationGroup="gi" CssClass="form-control date" ID="duedateTextBox" runat="server" Text='<%# Bind("duedate") %>' />
                        <asp:RequiredFieldValidator ValidationGroup="gi" ControlToValidate="duedateTextBox" ID="RequiredFieldValidator6" runat="server" ErrorMessage="duedate is Required"></asp:RequiredFieldValidator>

                    </td>
                    <td>
                        <asp:CheckBox ID="statusCheckBox" runat="server" Checked='<%# Bind("status") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button CssClass="btn btn-danger" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button CssClass="btn btn-success" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="entryidLabel" runat="server" Text='<%# Eval("entryid") %>' />
                    </td>
                    <td>
                        <asp:Label ID="patientnameLabel" runat="server" Text='<%# Eval("patientname") %>' />
                    </td>
                    <td>
                            <img src='<%# Eval("Picture", "/Uploads/{0}") %>' class="img-thumbnail" style="width:50px" />
                    </td>
                    <td>
                        <asp:Label ID="dateofbirthLabel" runat="server" Text='<%# Eval("dateofbirth","{0:yyyy-MM-dd }") %>' />
                    </td>
                    <td>
                        <asp:Label ID="mobilenoLabel" runat="server" Text='<%# Eval("mobileno") %>' />
                    </td>
                    <td>
                        <asp:Label ID="testdateLabel" runat="server" Text='<%# Eval("testdate","{0:yyyy-MM-dd }") %>' />
                    </td>
                    <td>
                        <asp:Label ID="duedateLabel" runat="server" Text='<%# Eval("duedate","{0:yyyy-MM-dd }") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="statusCheckBox" runat="server" Checked='<%# Eval("status") %>' Enabled="false" />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table class="table table-bordered" id="itemPlaceholderContainer" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th runat="server"></th>
                                    <th runat="server">entryid</th>
                                    <th runat="server">patientname</th>
                                    <th runat="server">picture</th>
                                    <th runat="server">dateofbirth</th>
                                    <th runat="server">mobileno</th>
                                    <th runat="server">testdate</th>
                                    <th runat="server">duedate</th>
                                    <th runat="server">status</th>
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
        <asp:SqlDataSource ID="dsTestentries" runat="server" ConnectionString="<%$ ConnectionStrings:Db %>" DeleteCommand="DELETE FROM [testentries] WHERE [entryid] = @entryid" InsertCommand="INSERT INTO [testentries] ([patientname], [picture], [dateofbirth], [mobileno], [testdate], [duedate], [status]) VALUES (@patientname, @picture, @dateofbirth, @mobileno, @testdate, @duedate, @status)" SelectCommand="SELECT * FROM [testentries]" UpdateCommand="UPDATE [testentries] SET [patientname] = @patientname, [picture] = @picture, [dateofbirth] = @dateofbirth, [mobileno] = @mobileno, [testdate] = @testdate, [duedate] = @duedate, [status] = @status WHERE [entryid] = @entryid">
            <DeleteParameters>
                <asp:Parameter Name="entryid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="patientname" Type="String" />
                <asp:Parameter Name="picture" Type="String" />
                <asp:Parameter DbType="Date" Name="dateofbirth" />
                <asp:Parameter Name="mobileno" Type="String" />
                <asp:Parameter DbType="Date" Name="testdate" />
                <asp:Parameter DbType="Date" Name="duedate" />
                <asp:Parameter Name="status" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="patientname" Type="String" />
                <asp:Parameter Name="picture" Type="String" />
                <asp:Parameter DbType="Date" Name="dateofbirth" />
                <asp:Parameter Name="mobileno" Type="String" />
                <asp:Parameter DbType="Date" Name="testdate" />
                <asp:Parameter DbType="Date" Name="duedate" />
                <asp:Parameter Name="status" Type="Boolean" />
                <asp:Parameter Name="entryid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
        </div>
</asp:Content>
<asp:Content ContentPlaceHolderID="footer" runat="server">
    <script src="../Scripts/bootstrap-datepicker.js"></script>
    <script>
        $(()=>{
            $(".date").datepicker({
                format: "yyyy-MM-dd"
            });
        })
    </script>
</asp:Content>
