<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet.css" rel="stylesheet" />
    
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <div class="ballon">
            <div class="banner">

                <div class="banner-center">
                    <div class="register">
                        <div class="login-icon"><img src="images/user.png" /></div>
                         <div class ="login">
                              <a <%--style="text-decoration:none; color:rgba(255,255,255,0.8);"--%> href="signup.aspx"><%--Sign in/Join--%><asp:Label ID="login" runat="server" Text="Label" ForeColor="#CCCCCC">
</asp:Label>&nbsp<asp:Label ID="puan" runat="server" Text="" ForeColor="#CCCCCC" ></asp:Label></a> </div>
                       
                       
                        </div>
                    <div class="logout">   <asp:Button ID="logout" runat="server" Text="Logout" CssClass="logout"  OnClick="logout_Click" Visible="false"/></div>
                 
                   
                    <ul class="left-banner">
                    </ul>

                    <div class="center-banner">

                        <div class="icon-rocket"></div>
                        <div class="icon-rocket-text">FREE DELIVERY WORLDWIDE</div>

                        

                    </div>
                </div>
            </div>

            <div class="header">
                <div class="header-center">
                    <div class="book-club">
                        <div class="book-icon">
                            <img src="images/book-icon.png" />
                        </div>


                        <div class="book-text">BOOK CLUB</div>


                    </div>


                    <div class="search">
                        <div class="search-icon"></div>
                        <input id="searchbox" name="searchbox" type="text" class="searchplace" placeholder="Search for books by keyword / title /author / ISBN" runat="server"/>

                    </div>

                    <div class="search-buttons">
                        <asp:Button ID="Button1" runat="server" Text="Search" CssClass="searchButton" OnClick="Button1_Click" />

                    </div>
                </div>

            </div></div>

            <div class="secondary-header">

                <div class="secondary-header-center">

                    <div class="nav">
                        <ul>

                            <li style="border-bottom:2px solid #333">Bestsellers</li>
                            <li><a href="topUser.aspx">Top Users</a></li>
                            <li>
                                <asp:Button ID="messagebutton" runat="server" Text="Message"  OnClick="messagebutton_Click"/></li>
                        


                            </ul>
                    </div>

                    <div class="priceConverter">

                        <asp:DropDownList ID="converterddr" runat="server" CssClass="converter" AutoPostBack="true"></asp:DropDownList>
                    </div>

                </div>
            </div>


            <div class="page">                
                <div class="content">
                    
                    <div class="side-bar">
                        <div class="side-bar-header"><span class="filter"> Filter your search </span></div>
                       
                        <div class="side-bar-group"> <span class="name"> Categories</span>

                             <div class="filter-s">
                                 <asp:DropDownList ID="categoryddr" runat="server" CssClass="ddlist" AutoPostBack="false"></asp:DropDownList>  
                             </div>

                        
                            </div>
                        <div class="side-bar-group"> <span class="name"> Price range</span>

                             <div class="filter-s">
                                 <asp:DropDownList ID="pricerangeddr" runat="server" CssClass="ddlist" AutoPostBack="false"></asp:DropDownList>  
                             </div>

                        
                            </div>
                        <div class="side-bar-group"> <span class="name"> Availability</span>

                             <div class="filter-s">
                                 <asp:DropDownList ID="availabilityddr" runat="server" CssClass="ddlist" AutoPostBack="false"></asp:DropDownList>  
                             </div>

                        
                            </div>
                         <div class="side-bar-group"> <span class="name"> Point</span>

                             <div class="filter-s">
                                 <asp:DropDownList ID="pointddr" runat="server" CssClass="ddlist" AutoPostBack="false"></asp:DropDownList>  
                             </div>

                        
                            </div>
                         <div class="side-bar-group"> <span class="name"> Language</span>

                             <div class="filter-s">
                                 <asp:DropDownList ID="languageddr" runat="server" CssClass="ddlist" AutoPostBack="false"></asp:DropDownList>  
                             </div>

                        
                            </div>

                        <div class="refine-button">
                            <asp:Button ID="refine" runat="server" Text="Refine results"  CssClass="refine" OnClick="refine_Click"/> </div>




                </div>

                    <div class="content-area">

                        <div class="div-bestsellers">
                             <span class="bestsellers">Bestsellers</span> </div>

                        
                        <div class="content-main"> 

                            <div class="content-pages">

                                <div class="pages">

                                  <div class="nav-pages">

                                      <ul>

                                          <li style="background-color:#10bbd5;"><a href="a" style="color:#fff;">1</a></li>
                                          <li><a href="a">2</a></li>
                                          <li><a href="a">3</a></li>
                                          <li><a href="a">4</a></li>
            
                                      </ul>



                                  </div>


                                </div>
                            </div>

                            <div class="content-books">

                                

                                <div class="datalist">

                                     <asp:DataList ID="DataList1" runat="server" RepeatColumns="5" RepeatDirection="Horizontal">


                                         <ItemTemplate>

                                             
                                             <div class="booknumber"> <asp:Label ID="numberlbl" runat="server" Text='<%# Eval("number") %>' CssClass="numbers"></asp:Label></div>
                                             
                                             <div class="items">
                                                 
                                                 <div class="bookimage">
                                                     <asp:HyperLink ID="HyperLink1" runat="server"  NavigateUrl='<%# Eval("link") %>'>
                                                     <asp:Image ID="Image1" runat="server"  ImageUrl='<%# "images/" + Eval("image")%>'/> </asp:HyperLink></div>
                                                 
                                                 <div class="bookname">
                                                     <asp:Label ID="namelbl" runat="server" Text='<%# Eval("name") %>'></asp:Label> </div>
                                                 <div class="booktext">
                                                     <asp:Label ID="authorlbl" runat="server" Text='<%# Eval("author") %>'></asp:Label> </div>
                    
                                                 <div class="booktext" style="color:#999">
                                                     <asp:Label ID="datelbl" runat="server" Text='<%# Eval("date") %>'></asp:Label></div>

                                                 <div class="booktext" style="color:#999"> <asp:Label ID="languagelbl" runat="server" Text='<%# Eval("languages") %>'></asp:Label></div>


<div class="booktext" style="color:#ff0072; font-size:18px;"> <asp:Label ID="pricelbl" runat="server" Text='<%# Eval("USnewprice") %>'></asp:Label></div>

                                                 <div class="booktext" style="font-size:12px; color:#999">
                                                     <del>

                                                     <asp:Label ID="Label1" runat="server" Text='<%# Eval("USprice") %>'>


                                                     </asp:Label>
                                                         </del>


                                                 </div>

                                             </div>





                                         </ItemTemplate>




                                     </asp:DataList>

                                  <script type="text/javascript">
    
                                      var x = document.getElementById("searchbox").value;
</script>






                                </div>
                               

                            </div>


                        </div>

                    </div>

                 


            </div>
             </div>

    </form>
</body>
</html>
