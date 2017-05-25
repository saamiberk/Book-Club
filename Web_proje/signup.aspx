<%@ Page Title="" Language="C#" MasterPageFile="~/home.master" AutoEventWireup="true" CodeFile="signup.aspx.cs" Inherits="signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="StyleSheet.css" rel="stylesheet" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="secondary-header">

                <div class="secondary-header-center">

                    <div class="nav">
                        <ul>

                            <li><a href="Default.aspx">Bestsellers</a></li>
                            <li><a href="topUser.aspx">Top Users</a></li>
                            <li>
                                <asp:Button ID="msjbtn" runat="server" Text="Message"  OnClick="msjbtn_Click"/></li>
                          


                            </ul>
                    </div>
                    </div>
        </div>

    

    <div class="page">

        <div class="content">

            <br />

            

                <div class="sign-area">
                    <div class="sign">
                <div class="sign-text"><br /><br /><div class="s-text">Sign in</div>
                    <div class="s-email">Name &nbsp <asp:Label ID="logNamelabel" runat="server" Text="Check your information" ForeColor="Red" Visible="False"></asp:Label><br />
                        <div class="box"> &nbsp
                        <asp:TextBox ID="loginName" CssClass="txtsearch" runat="server" Height="30px" Width="460px"></asp:TextBox></div></div></div>
                        
                        <div class="s-password">Password<br />
                        <div class="box"> &nbsp
                        <asp:TextBox ID="loginPassword" CssClass="txtsearch" runat="server" Height="30px" Width="460px" TextMode="Password"></asp:TextBox></div></div>
                        
                        
                        
                        <div class="sign-button">


                            <asp:Button ID="loginbtn" runat="server" Text="Login" CssClass="searchButton" OnClick="loginbtn_Click"/></div></div>




                    <div class ="join">
                        <div class="sign-text"><br /><br /><div class="s-text">Join</div>
                    <div class="s-email">Email address&nbsp&nbsp&nbsp<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage=" Invalid email format" ControlToValidate="joinEmail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator><br />
                        <div class="box"> &nbsp
                        <asp:TextBox ID="joinEmail" CssClass="txtsearch" runat="server" Height="30px" Width="460px"></asp:TextBox></div></div></div>
                        
                        <div class="s-password">Name<br />
                        <div class="box"> &nbsp
                        <asp:TextBox ID="joinName" CssClass="txtsearch" runat="server" Height="30px" Width="460px"></asp:TextBox></div></div>

                        <div class="s-password">Password<br />
                        <div class="box"> &nbsp
                        <asp:TextBox ID="joinPassword" CssClass="txtsearch" runat="server" Height="30px" Width="460px" TextMode="Password"></asp:TextBox></div></div><div class="text-password">Please enter a password with at least six characters.</div>
                        <div class="s-password">Verify Password&nbsp&nbsp<asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password mismatch" ControlToCompare="joinPassword" ControlToValidate="joinvPassword" ForeColor="Red"></asp:CompareValidator><br />
                        <div class="box"> &nbsp
                        <asp:TextBox ID="joinvPassword" CssClass="txtsearch" runat="server" Height="30px" Width="460px" TextMode="Password"></asp:TextBox></div></div>

                        <div class="sign-icon-area"> 
                            <div class="sign-icon"> <div class="sign-radio">
                                <asp:RadioButton ID="icon1" runat="server" GroupName="1" /></div><div class="sign-image"><img src ="images/usericon1.png" /></div></div>
                            <div class="sign-icon"> <div class="sign-radio">
                                <asp:RadioButton ID="icon2" runat="server" GroupName="1" /></div><div class="sign-image"><img src ="images/usericon2.png" /></div></div>
                            <div class="sign-icon"> <div class="sign-radio">
                                <asp:RadioButton ID="icon3" runat="server" GroupName="1" /></div><div class="sign-image"><img src ="images/usericon3.png" /></div></div>
                            <div class="sign-icon"> <div class="sign-radio">
                                <asp:RadioButton ID="icon4" runat="server" GroupName="1" /></div><div class="sign-image"><img src ="images/usericon4.png" /></div></div>
                            <div class="sign-icon"> <div class="sign-radio">
                                <asp:RadioButton ID="icon5" runat="server" GroupName="1" /></div><div class="sign-image"><img src ="images/usericon5.png" /></div></div>
                        </div>
                        <div class="sign-button">


                            <asp:Button ID="joinButton" runat="server" Text="Register" CssClass="searchButton" OnClick="joinButton_Click"/></div>
                        <div class="join-label">
                            <asp:Label ID="joinlabel" runat="server" Text="Join Succesful" Font-Bold="False" ForeColor="Green" Font-Size="15pt" Visible="False"></asp:Label>

                        </div>
                        
                    </div>

            </div>
                </div>
                    
            
                
                




            </div>


       

    

</asp:Content>

