<%@ Page Title="" Language="C#" MasterPageFile="~/home.master" AutoEventWireup="true" CodeFile="book1.aspx.cs" Inherits="book1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

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
                            <li><a href="mesaj.aspx">Message</a></li>


                            </ul>
                    </div>
                    </div>
        </div>

    
    <div class="page">

        <div class="content">
            <div class="random"></div>
            <div class="book-kind">&nbsp Categories:  Fantasy</div>


            <div class="book-area">


                <div class="book-image-area">

                    <div class="book-image"> <img src="images/imagee1.jpg" /></div>


                </div>

                <div class="book-information">


                    <div class="book-name">Harry Potter and the Cursed Child - Parts I & II : The Official Script Book of the Original West End</div>
                   
                    <div class="book-author">J. K. Rowling</div>

                    <div class="book-star">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                       
                        
                            
                        <ajaxToolkit:Rating ID="Rating1" runat="server" AutoPostBack="true" OnClick="OnClick" StarCssClass="ratingStar" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"
    FilledStarCssClass="FilledStar" MaxRating="10" RatingAlign="Horizontal" ></ajaxToolkit:Rating>  
                        
                       
                        
                        <div class="status"><asp:Label ID="lblRatingStatus" runat="server" Text=""></asp:Label> </div>
                        


                    </div>

                    <div class="book-con">The Eighth Story. Nineteen Years Later. Based on an original new story by J.K. Rowling, Jack Thorne and John Tiffany, a new play by Jack Thorne. Based on an original new story by J.K. Rowling, Jack Thorne and John Tiffany, a new play by Jack Thorne, Harry Potter and the Cursed Child is the eighth story in the Harry Potter series and the first official Harry Potter story to be presented on stage. The play will receive its world premiere in London’s West End on 30th July 2016. It was always difficult being Harry Potter and it isn’t much easier now that he is an overworked employee of the Ministry of Magic, a husband, and father of three school-age children. While Harry grapples with a past that refuses to stay where it belongs, his youngest son Albus must struggle with the weight of a family legacy he never wanted. As past and present fuse ominously, both father and son learn the uncomfortable truth: sometimes, darkness comes from unexpected places.</div>






                </div>


            </div>








            <div class="book-recomend">


               



            </div>


           
            <div class ="comment-area">

                <div class= "comment-user-area">
                    <div class="comment-user-icon">
                        
                        <asp:Image ID="commenticon" runat="server" />

                    </div>
                        



                    <div class="comment-user-text">
                      
                        <asp:TextBox ID="txtcomment" runat="server" CssClass="txtcomment" TextMode="MultiLine"></asp:TextBox>


                    </div>
                        
                    <div class="comment-user-button">

                        <asp:Button ID="Button1" runat="server" Text="Send" CssClass="searchButton1" OnClick="Button1_Click" />
                    </div>

                
                </div>


                <asp:DataList ID="DataList1" runat="server" RepeatDirection="Vertical" RepeatColumns="1" OnItemCommand="DataList1_ItemCommand">
            <ItemTemplate>
                
                <div class="comment-place">

                <div class="comment-item">

                      <div class="p-user-icon">
                        <asp:Image ID="pImage" runat="server"  ImageUrl='<%# "images/" + Eval("Icon")%>'/></div>
                    <div class="p-user-area">
                      


                    <div class="p-user-name">

                         <asp:Label ID="pName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                     </div>

                       <div class="p-date"> <asp:Label ID="pDate" runat="server" Text='<%# Eval("Date") %>'></asp:Label></div>
                        <div class="p-date1"> <asp:Label ID="pHour" runat="server" Text='<%# Eval("Hour") %>'></asp:Label></div>
                    </div>
                     



                     <div class="p-user-comment">
                       
                         <asp:Label ID="pComment" runat="server" Text='<%# Eval("Comment") %>'></asp:Label>

                     </div>
                    <asp:Label ID="commentid" runat="server" Text='<%# Eval("Id") %>' Visible="false"></asp:Label>

                    <div class="like">
                       
                      <asp:ImageButton ID="btnlike" runat="server"  ImageUrl="images/like.png"  CommandName="likecomment"/>


                    </div>
                    <div class="like1">   <asp:Label ID="likelbl" runat="server" Text='<%# Eval("Begen") %>'> </asp:Label>     </div>

                     <div class="dislike">
                         <asp:ImageButton ID="btndislike" runat="server"  ImageUrl="images/dislike.png"  CommandName="dislikecomment"/>
                         
                     </div>

                    <div class="dislike1">  <asp:Label ID="dislikelbl" runat="server" Text='<%# Eval("Begenme") %>'></asp:Label>  </div>





                </div></div>

</ItemTemplate>

                </asp:DataList>
                    
                    
                    
                    
                    
                    </div>
               




                

            </div>



            












            </div>
       










</asp:Content>

