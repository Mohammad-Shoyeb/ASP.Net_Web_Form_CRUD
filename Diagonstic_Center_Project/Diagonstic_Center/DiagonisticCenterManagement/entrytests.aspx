<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EntryTests.aspx.cs" Inherits="Diagonstic_Center.DiagonisticCenterManagement.EntryTests" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row">
        <div class="col-12">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="testid" DataSourceID="dsTests" CssClass="table table-border" OnRowDataBound="GridView1_RowDataBound">
                <SelectedRowStyle CssClass="bg-secondary text-white" />
                <HeaderStyle CssClass="bg-light" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="testid" HeaderText="testid" SortExpression="testid" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="testname" HeaderText="testname" SortExpression="testname" />
                    <asp:BoundField DataField="fee" HeaderText="fee" SortExpression="fee" />
                    <asp:BoundField DataField="typename" HeaderText="typename" SortExpression="typename" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="dsTests" runat="server" ConnectionString="<%$ ConnectionStrings:Db %>" SelectCommand="SELECT tests.testid, tests.testname, tests.fee, testtypes.typename FROM tests INNER JOIN testtypes ON tests.typeid = testtypes.typeid"></asp:SqlDataSource>
        </div>
        <div class="col-12">
            <asp:ListView ID="ListView1" runat="server" DataSourceID="dsEntryTests" DataKeyNames="entryid,testid" InsertItemPosition="LastItem" OnItemInserting="ListView1_ItemInserting">
                
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button cssclass="btn btn-success btn-sm"  ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button cssclass="btn btn-secondary btn-sm" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="entryidLabel1" runat="server" Text='<%# Eval("entryid") %>' />
                        </td>
                        <td>
                            <asp:Label ID="testidLabel1" runat="server" Text='<%# Eval("testid") %>' />
                            
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
                            <asp:Button cssclass="btn btn-outline-dark"  ValidationGroup="gi" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button cssclass="btn btn-secondary btn-sm" ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>
                            <asp:HiddenField ID="testidTextBox" runat="server" Value='<%# Bind("testid") %>' />
                            <asp:TextBox  ValidationGroup="gi" ID="entryidTextBox" runat="server" Text='<%# Bind("entryid") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="gi" ControlToValidate="entryidTextBox" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Patient name is Required"></asp:RequiredFieldValidator>
                        </td>
                       
                            
                        
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button CssClass="btn btn-danger btn-sm " ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        </td>
                        <td>
                            <asp:Label ID="entryidLabel" runat="server" Text='<%# Eval("entryid") %>' />
                        </td>
                       <%-- <td>
                            <asp:Label ID="testidLabel" runat="server" Text='<%# Eval("testid") %>' />
                        </td>--%>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr runat="server" style="">
                                        <th runat="server"></th>
                                        <th runat="server">entryid</th>
                                        <%--<th runat="server">testid</th>--%>
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
            <asp:SqlDataSource ID="dsEntryTests" runat="server" ConnectionString="<%$ ConnectionStrings:Db %>" DeleteCommand="DELETE FROM [entrytests] WHERE [entryid] = @entryid AND [testid] = @testid" InsertCommand="INSERT INTO [entrytests] ([entryid], [testid]) VALUES (@entryid, @testid)" SelectCommand="SELECT * FROM [entrytests] WHERE (([testid] = @testid) AND ([testid] = @testid2))">
                <DeleteParameters>
                    <asp:Parameter Name="entryid" Type="Int32" />
                    <asp:Parameter Name="testid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="entryid" Type="Int32" />
                    <asp:Parameter Name="testid" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="testid" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="GridView1" Name="testid2" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    
</asp:Content>

