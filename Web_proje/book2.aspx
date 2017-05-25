<%@ Page Title="" Language="C#" MasterPageFile="~/home.master" AutoEventWireup="true" CodeFile="book2.aspx.cs" Inherits="book2" %>

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

                    <div class="book-image"> <img src="images/imagee2.jpg" /></div>


                </div>

                <div class="book-information">


                    <div class="book-name">Everything I Never Told You</div>
                   
                    <div class="book-author">Celeste Ng</div>

                    <div class="book-star">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                       
                        
                            
                        <ajaxToolkit:Rating ID="Rating1" runat="server" AutoPostBack="true" OnClick="OnClick" StarCssClass="ratingStar" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"
    FilledStarCssClass="FilledStar" MaxRating="10" RatingAlign="Horizontal" ></ajaxToolkit:Rating>  
                        
                       
                        
                        <div class="status"><asp:Label ID="lblRatingStatus" runat="server" Text=""></asp:Label> </div>
                        


                    </div>

                    <div class="book-con">Amazon.com's no. 1 Book of the Year 2014 Lydia is the favourite child of Marilyn and James Lee; a girl who inherited her mother's bright blue eyes and her father's jet-black hair. Her parents are determined that Lydia will fulfill the dreams they were unable to pursue - in Marilyn's case that her daughter become a doctor rather than a homemaker, in James's case that Lydia be popular at school, a girl with a busy social life and the centre of every party. But Lydia is under pressures that have nothing to do with growing up in 1970s small town Ohio. Her father is an American born of first-generation Chinese immigrants, and his ethnicity, and hers, make them conspicuous in any setting. When Lydia's body is found in the local lake, James is consumed by guilt and sets out on a reckless path that may destroy his marriage.Marilyn, devastated and vengeful, is determined to make someone accountable, no matter what the cost. Lydia's older brother, Nathan, is convinced that local bad boy Jack is somehow involved. But it's the youngest in the family - Hannah - who observes far more than anyone realises and who may be the only one who knows what really happened.</div>






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

