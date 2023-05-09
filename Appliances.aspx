<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Appliances.aspx.cs" Inherits="CIS.Appliances" MasterPageFile="~/Site.Master" %>

<asp:Content ID="bodyContent" ContentPlaceHolderID="BodyContents_CIS" runat="server">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#DAF6FC">
        <tr>
            <td class="style1" valign="top">
                &nbsp;</td>
            
            <td valign="top" class="style2">
                &nbsp;</td>
            
            <td valign="top" class="style3">
                &nbsp;</td>
            
            <td valign="top">
                &nbsp;</td>
            <td>
                &nbsp;</td>
                
        </tr>
        <tr>
            <td class="style1" valign="top">
                <asp:DataList ID="dtCISList" runat="server" BackColor="#DAF6FC" BorderColor="#DAF6FC"
                    BorderWidth="1px" CellPadding="0" CellSpacing="4" Font-Bold="True" Font-Names="Verdana"
                    Font-Size="Smaller" RepeatColumns="3" Width="16px" Style="margin-right: 100px"
                    ShowHeader="False" OnItemDataBound="dtCISList_ItemDataBound" ForeColor="Black"
                    Height="90px" CaptionAlign="Top" RepeatDirection="Horizontal" 
                    onselectedindexchanged="dtCISList_SelectedIndexChanged">
                    <AlternatingItemStyle BackColor="#DAF6FC" />
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" Font-Size="Large" HorizontalAlign="Center"
                        VerticalAlign="Middle" ForeColor="#F7F7F7" />
                    <ItemStyle ForeColor="#4A3C8C" HorizontalAlign="Left" VerticalAlign="Top" BackColor="#DAF6FC"
                        BorderColor="#DAF6FC" />
                    <ItemTemplate>
                        <table border="0" style="height: 10px">
                            <tr>
                                <td align="center" valign="top" style="width: 100px">
                                    <asp:Button ID="btnCIS" runat="server" Text="NEW" Width="150px" Height="60px" Font-Bold="True"
                                     OnClick="btnCIS_Click" class="button_cis_round" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                </asp:DataList>
            </td>
            
            <td valign="top" class="style2">
                <asp:GridView ID="grdAppliances" name="grdAppliances" runat="server" AutoGenerateColumns="False"
                Width="50%" OnRowDataBound="grdFeatures_RowDataBound" Height="109px"
                DataKeyNames="Field,Value" CellPadding="4" ForeColor="#333333" 
                    GridLines="None" 
                    onselectedindexchanged="grdAppliances_SelectedIndexChanged">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle Height="10px" 
                    Font-Names="Arial Black" BackColor="#5D7B9D" Font-Bold="True" 
                        ForeColor="White"></HeaderStyle>
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                   <asp:TemplateField HeaderText="Dimention" ShowHeader="False">
                        <ItemTemplate>
                            <asp:Label BackColor="White" ID="txtField" Name="Field" runat="server" 
                                Width="144px" Text='<%# Bind("Field") %>' Height="16px"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="100px" VerticalAlign="Top" 
                            BackColor="White" Wrap="False"></ItemStyle>
                    </asp:TemplateField>
                   
                    <asp:TemplateField HeaderText="Value">
                        <ItemTemplate>
                            &nbsp;<asp:TextBox ID="txtValue" Name="Value" 
                                runat="server" Text='<%# Bind("Value") %>' Height="24px" Width="231px"></asp:TextBox>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="300px" VerticalAlign="Top" 
                            BackColor="White" Wrap="False"></ItemStyle>
                    </asp:TemplateField>
                   
                   
                </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
                
                
            <asp:GridView ID="grdAppliances2" name="grdAppliances2" runat="server" AutoGenerateColumns="False"
                Width="50%" OnRowDataBound="grdFeatures2_RowDataBound" Height="109px"
                DataKeyNames="Field,Value" CellPadding="4" ForeColor="#333333" 
                    GridLines="None" 
                    onselectedindexchanged="grdAppliances2_SelectedIndexChanged">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle Height="10px" 
                    Font-Names="Arial Black" BackColor="#5D7B9D" Font-Bold="True" 
                        ForeColor="White"></HeaderStyle>
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                   <asp:TemplateField HeaderText="Type" ShowHeader="False">
                        <ItemTemplate>
                            <asp:Label BackColor="White" ID="txtField" Name="Field" runat="server" 
                                Width="144px" Text='<%# Bind("Field") %>' Height="16px"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="100px" VerticalAlign="Top" 
                            BackColor="White" Wrap="False"></ItemStyle>
                    </asp:TemplateField>
                   
                                      
                   <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            &nbsp;<asp:checkBox ID="chkValue" Name="chkValue" 
                                runat="server" Text='<%# Bind("Value") %>' ></asp:checkBox>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" 
                            BackColor="White" Wrap="False"></ItemStyle>
                    </asp:TemplateField>
                </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
                
                
            </td>
            
            <td valign="top" class="style3">
                &nbsp;&nbsp;</td>
            
            <td valign="top">
                &nbsp;</td>
            <td>
                &nbsp;</td>
                
        </tr>
        <tr>
            <td class="style1" valign="top">
                &nbsp;</td>
            
            <td valign="top" class="style2">
                
                
                &nbsp;</td>
            
            <td valign="top" class="style3">
                &nbsp;</td>
            
            <td valign="top">
                &nbsp;</td>
            <td>
                &nbsp;</td>
                
        </tr>
        <tr>
            <td class="style1" valign="top">
                &nbsp;</td>
            
            <td valign="top" class="style2">
            <span class="style19">
                
                <asp:Button ID="btnSaveSec7" runat="server" Height="30px" onclick="btnSaveSec7_Click" Text="Save" Width="84px" />                
            </span>
                
            </td>
            
            <td valign="top" class="style3">
                &nbsp;</td>
            
            <td valign="top">
                &nbsp;</td>
            <td>
                &nbsp;</td>
                
        </tr>
    </table>
    
    </asp:Content>






<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="HeadContent_CIS">

    <style type="text/css">
        .style1
        {
            width: 364px;
        }
        .style2
        {
            width: 718px;
        }
        .style3
        {
            width: 354px;
        }
    </style>

</asp:Content>








