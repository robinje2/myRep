<%@ Page Title="Bar Code Options" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BarCodeOptions.aspx.cs" Inherits="CIS.BarCodeOptions"  %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>
            <asp:HyperLink ID="Hyper1" runat ="server" href="/Default.aspx" Text="Bar Code Printing"></asp:HyperLink>
        </h1>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Select an option"></asp:Label>
            <asp:Image ID="Image1" runat="server" Height="124px" ImageAlign="Right" ImageUrl="~/Img/PrintBarCode.png" Width="136px" />
        </p>
    </div>
    <div class="row">
        <div class="col-md-3">
            <h2>From AccPac Inventory</h2>
            <p>
                Query AccPac Invetory data by category or search criteria and print bar codes label.
                
            </p>
            <p>
                <%--<a class="btn btn-default" href="AccPacInventory.aspx" <img src="icons/Share.png"  >AccPac Inventory &raquo;</a>--%>
                <asp:ImageButton ID="ImageButton1" runat="server" Height="141px" ImageUrl="~/Img/Inventory.png" Width="100px" OnClick="ImageButton1_Click" />
            </p>
        </div>
        
        <div class="col-md-3">
            <h2>From AccPac Purchase Orders</h2>
            <p>
                Search PO by number, Date or Vendor name and Print Labels for Items.
            </p>
            <p>
                <asp:ImageButton ID="ImageButton2" runat="server" Height="112px" ImageUrl="~/Img/PO.png" Width="100px" OnClick="ImageButton2_Click" /> 
                <%--<a class="btn btn-default" href="POOptions.aspx">Purchase Orders &raquo;</a>--%>
            </p>
        </div>
        <div class="col-md-3">
            <h2>From AccPac Transfers</h2>
            <p>
                Search Transfer by number, Date or Location and Print Labels for Items.
            </p>
            <p>
                <asp:ImageButton ID="ImageButton3" runat="server" Height="112px" ImageUrl="~/Img/transfer_left_right.png" Width="100px" OnClick="ImageButton3_Click" /> 
            </p>
        </div>
        <div class="col-md-3" id="myScrollspy">
            <ul class="nav nav-pills nav-stacked" data-spy="affix" data-offset-top="205">
            <h2><asp:HyperLink ID="HyperLink2" Text="My Labels" runat ="server" href="/PrintOptions.aspx"></asp:HyperLink> </h2>
                <asp:GridView id="grdPrint" runat="server" OnClick="ImageButton4_Click" href="/PrintOptions.aspx" AutoGenerateColumns="False" style="vertical-align: top;"
                onrowdatabound="grdPrint_RowDataBound" 
                onrowcommand="grdPrint_RowCommand"
                DataKeyNames="ItemNo, Description, Qty" CellPadding="3" 
                BackColor="White" BorderColor="White" BorderStyle="None" BorderWidth="1px" OnSelectedIndexChanged="grdPrint_SelectedIndexChanged" Width="347px" >
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="False" ForeColor="White" />
                <HeaderStyle Height="10px" 
                    Font-Names="Arial Black" BackColor="White" Font-Bold="false" 
                        ForeColor="Black"></HeaderStyle>
                    <RowStyle ForeColor="#000066" />
                <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:TemplateField HeaderText="Description">
                            <ItemTemplate>
                                &nbsp;<asp:Label ID="txtDesc" 
                                    runat="server" Text='<%# Bind("ItemNo") %>' Height="16px" ></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" Width="300px" VerticalAlign="Top" 
                                BackColor="White" Wrap="True" Font-Size="Smaller"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="#">
                            <ItemTemplate>
                                &nbsp;<asp:Label ID="txtCategory" 
                                    runat="server" Text='<%# Bind("Qty") %>' Height="16px" ></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" Width="5px" VerticalAlign="Bottom" 
                                BackColor="White" Wrap="False" Font-Size="Smaller"></ItemStyle>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </ul>
        </div>
    </div>

</asp:Content>

