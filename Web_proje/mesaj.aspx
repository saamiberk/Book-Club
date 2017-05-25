<%@ Page Title="" Language="C#" MasterPageFile="~/home.master" AutoEventWireup="true" CodeFile="mesaj.aspx.cs" Inherits="mesaj" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link href="StyleSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<div class="secondary-header">

                <div class="secondary-header-center">

                    <div class="nav">
                        <ul>

                            <li><a href="Default.aspx">Bestsellers</a></li>
                            <li ><a href="topUser.aspx">Top Users</a></li>
                            <li style="border-bottom:2px solid #333">Message</li>
                       


                            </ul>
                    </div>
                    </div>
        </div>
    <div class="page">

        <div class="content">

            <br />

    <div class="sign-area">

        

        <div class="message-box"><div class="message-area">

            <asp:DataList ID="DataList1" runat="server">

                <ItemTemplate>

            <div class="message-user-area">


                <div class="message-user-icon">
                    <asp:Image ID="Image1" runat="server"  ImageUrl='<%# "images/" + Eval("icon")%>'/> </div>

                 <div class="p-user-area1">
                      


                    <div class="p-user-name">
                        <asp:Label ID="lblusername" runat="server" Text='<%# Eval("kim") %>'></asp:Label>

                     </div>

                       <div class="p-date"><asp:Label ID="lbldate" runat="server" Text='<%# Eval("tarih") %>'></asp:Label> </div>
                        <div class="p-date1"> <asp:Label ID="lblhour" runat="server" Text='<%# Eval("saat") %>'></asp:Label></div>
                    </div>
                     <div class="p-user-comment1">

                         <asp:TextBox ID="lblmessage" runat="server" CssClass="txtcomment1" TextMode="MultiLine" Text='<%# Eval("mesaj") %>'></asp:TextBox>
                     </div>





            </div>  </ItemTemplate></asp:DataList>
            

                                 </div></div>


        <div class="message-send"><div class="message-area">

            <div class="message-user-area1">
                <div class="message-ddr">
                    <asp:Label ID="Label1" runat="server" Text="Kime: "></asp:Label> &nbsp&nbsp&nbsp&nbsp <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true"></asp:DropDownList></div>
                <div class="message-send-text">
                        <asp:TextBox ID="lblsendmessage" runat="server" CssClass="txtcomment1" TextMode="MultiLine"></asp:TextBox>

                </div>
                <div class="labelsuc"> <asp:Label ID="Label2" runat="server" Text="Succesful" CssClass="label" Visible="false" ></asp:Label>  </div>

                


                <div class="message-send-button">
                    <asp:Button ID="send" runat="server" Text="Send"  CssClass="searchButton1" OnClick="send_Click"/></div>



            </div>




                                  </div></div>


      








    </div>














        </div></div>








            </asp:Content>