<%@ Page Title="" Language="C#" MasterPageFile="~/home.master" AutoEventWireup="true" CodeFile="topUser.aspx.cs" Inherits="topUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link href="StyleSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="secondary-header">

                <div class="secondary-header-center">

                    <div class="nav">
                        <ul>

                            <li><a href="Default.aspx">Bestsellers</a></li>
                            <li style="border-bottom:2px solid #333">Top Users</li>
                            <li>
                                <asp:Button ID="msjbtn" runat="server" Text="Message" OnClick="msjbtn_Click" /></li>
                       


                            </ul>
                    </div>
                    </div>
        </div>
    <div class="page">

        <div class="content">

            <br />

    <div class="sign-area"><div class="top-user-text">TOP USERS</div>
        <div class="top-user-area">
            <div class="top-name">User</div>
            <div class="top-puan">Point</div>
            <div class="top-users">
                <asp:DataList ID="DataList1" runat="server">
                    <ItemTemplate>
                <div class="users">
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>'></asp:Label></div>
                <div class="points">
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Puan") %>'></asp:Label></div>



                    </ItemTemplate>
                </asp:DataList>
            </div>

        </div>
        




    </div></div></div>

</asp:Content>























