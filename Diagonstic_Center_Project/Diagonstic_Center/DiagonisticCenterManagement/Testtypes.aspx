<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Testtypes.aspx.cs" Inherits="Diagonstic_Center.DiagonisticCenterManagement.Testtypes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <link href="../Content/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <style>
        .err {
            font-size: .75rem;
        }

        th a {
            text-decoration: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <asp:UpdateProgress class="w-100" AssociatedUpdatePanelID="UpdatePanel1" ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
            <div class="d-flex align-items-center">
                <strong>Loading...</strong>
                <div class="spinner-border spinner-border-sm ms-auto text-success " role="status" aria-hidden="true"></div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel class="w-100" ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-12 border-bottom mb-3">
                    <h2 class="col-12 text-center">Tests Type</h2>
                </div>
                <div class="col-6">
                    <h3 class="col-12 text-center text-bg-info">Edit/Delete</h3>
                    <asp:GridView CssClass="table table-bordered" ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="typeid" DataSourceID="dsTesttype">
                        <Columns>
                            <asp:BoundField DataField="typeid" HeaderText="typeid" InsertVisible="False" ReadOnly="True" SortExpression="typeid" />
                            <asp:TemplateField HeaderText="typename" SortExpression="typename">
                                <EditItemTemplate>
                                    <asp:TextBox ValidationGroup="gv-ed" CssClass="form-control form-control-sm" ID="TextBox1" runat="server" Text='<%# Bind("typename") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="gv-ed" ControlToValidate="TextBox1" Text="Test type is required" CssClass="text-danger err" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Type Name Required"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("typename") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ValidationGroup="gv-ed" CssClass="btn btn-success" ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"><i class="bi bi-save"></i></asp:LinkButton>
                                    &nbsp;<asp:LinkButton CssClass="btn btn-secondary" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"><i class="bi bi-x"></i></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton CssClass="btn btn-primary " ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"><i class="bi bi-pencil"></i></asp:LinkButton>
                                    &nbsp;<asp:LinkButton CssClass="btn btn-secondary" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"><i class="bi bi-x"></i></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="dsTesttype" runat="server" ConnectionString="<%$ ConnectionStrings:Db %>" DeleteCommand="DELETE FROM [testtypes] WHERE [typeid] = @typeid" InsertCommand="INSERT INTO [testtypes] ([typename]) VALUES (@typename)" SelectCommand="SELECT * FROM [testtypes]" UpdateCommand="UPDATE [testtypes] SET [typename] = @typename WHERE [typeid] = @typeid">
                        <DeleteParameters>
                            <asp:Parameter Name="typeid" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="typename" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="typename" Type="String" />
                            <asp:Parameter Name="typeid" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
                <div class="col-6">
                    <h3 class="col-12 text-center text-bg-success">Add</h3>
                    <asp:FormView Width="100%" ID="FormView1" DefaultMode="Insert" runat="server" DataSourceID="dsTesttype" DataKeyNames="typeid">
                        <EditItemTemplate>
                            typeid:
                      <asp:Label ID="typeidLabel1" runat="server" Text='<%# Eval("typeid") %>' />
                            <br />
                            typename:
                      <asp:TextBox ID="typenameTextBox" runat="server" Text='<%# Bind("typename") %>' />

                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <div class="form-group row mb-1">
                                <label class="col-form-label col-form-label-md col-3">Type Name</label>
                                <div class="col-9">

                                    <asp:TextBox ValidationGroup="fv-in" CssClass="form-control form-control-sm" ID="typenameTextBox" runat="server" Text='<%# Bind("typename") %>' />
                                    <asp:RequiredFieldValidator ValidationGroup="fv-in" ControlToValidate="typenameTextBox" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Test Type Required" CssClass="text-danger err"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="d-flex justify-content-end">
                                <asp:LinkButton ValidationGroup="fv-in" CssClass="btn btn-success btn-sm" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text=""><i class="bi bi-plus-square-fill"></i> </asp:LinkButton>
                                &nbsp;<asp:LinkButton CssClass="btn btn-secondary btn-sm" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"><i class="bi bi-x-square"></i></asp:LinkButton>
                            </div>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            typeid:
                      <asp:Label ID="typeidLabel" runat="server" Text='<%# Eval("typeid") %>' />
                            <br />
                            typename:
                      <asp:Label ID="typenameLabel" runat="server" Text='<%# Bind("typename") %>' />
                            <br />

                        </ItemTemplate>
                    </asp:FormView>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
