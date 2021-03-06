﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Mobile.Master" CodeBehind="RelDevolucao.aspx.vb" Inherits="conteltelecom.RelDevolucao" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headSiteMobile" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSiteMobile" runat="server">
  <div class="swiper-slide sliderbg">
      <div class="swiper-container swiper-nested9">
               <div class="swiper-wrapper">
                    <div class="swiper-slide">
                              <div class="slide-inner">
                                        <div class="pages_container">
                                        
                                        <h2 class="page_title">Get in touch</h2>
                                            <div class="form">
                                            <form id="contact-us" action="#" method="post">
                                            <label>Name:</label>
                                            <input type="text" name="contactName" id="contactName" value="" class="form_input txt requiredField" />
                                            <label>Email:</label>
                                            <input type="text" name="email" id="email" value="" class="form_input txt requiredField email" />
                                            <label>Message:</label>
                                            <textarea name="comments" id="commentsText" class="form_textarea txtarea requiredField" rows="" cols=""></textarea>
                                            <input type="hidden" name="submitted" id="submitted" value="true" />
                                            <input name="submit" type="submit" class="form_submit green green_borderbottom" value="Send" />
                                            </form>
                                            </div>

                                            
                                       <h2>Let's socialize</h2>     
                                            <ul class="social">
                                            <li class="social_facebook"><a href="#"><img src="images/icons/social/facebook.png" alt="" title="" border="0" /></a></li>
                                            <li class="social_twitter"><a href="#"><img src="images/icons/social/twitter.png" alt="" title="" border="0" /></a></li>
                                            <li class="social_google"><a href="#"><img src="images/icons/social/google.png" alt="" title="" border="0" /></a></li>
                                            <li class="social_pinterest"><a href="#"><img src="images/icons/social/pinterest.png" alt="" title="" border="0" /></a></li>
                                            <li class="social_flickr"><a href="#"><img src="images/icons/social/flickr.png" alt="" title="" border="0" /></a></li>
                                            <li class="social_digg"><a href="#"><img src="images/icons/social/digg.png" alt="" title="" border="0" /></a></li>
                                            </ul>
                                        <h2>Give Us a call</h2>    
                                        <a href="tel:123 456 789" class="call_button">Click To Call Now!</a>
                                        <a href="http://maps.google.com/maps?q=houston+usa&amp;hl=ro&amp;sll=37.0625,-95.677068&amp;sspn=53.961216,114.169922&amp;hnear=Houston,+Harris,+Texas&amp;t=m&amp;z=5" class="map_button">View our location</a>  

                                        <div class="clearfix"></div>
                                        <div class="scrolltop"><a href="#" class="scrolltop9"><img src="images/icons/top.png" alt="Go on top" title="Go on top" /></a></div>    
                                        </div>
                                        <!--End of page container-->
                              </div>
                    </div>
              </div>
              <div class="swiper-scrollbar9"></div>
     </div>
     </div>
       
</asp:Content>
