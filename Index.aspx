<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="image/slide-1.jpg" class="d-block w-100 mySlide" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="image/slide-2.jpg" class="d-block w-100 mySlide" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="image/slide-3.jpg" class="d-block w-100 mySlide" alt="...">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <div class="section-header mt-3">
            <div class="container">
                <h1>Rooms accommodation</h1>
                <p>Designed as a privileged almost private place where you'll feel right at home</p>
            </div>
        </div>
        <div class="container justify-content-center">
            <div class="row">
                <asp:DataList ID="DataList1" runat="server" DataKeyField="Roo_ID" DataSourceID="SqlDataSource1" RepeatColumns="2" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand1">
                    <ItemTemplate>
                        <div class="col-12 mb-3 rounded">
                            <div class="card">
                                <img src="image/<%# Eval("Roo_Image") %>" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h2 class="card-title  myTitle" style="color:#b58e3e;"><%# Eval("Roo_Name") %></h2>
                                    <p class="card-text lead"><%# Eval("Roo_Type") %></p>
                                    <asp:Button ID="Button1" runat="server" Text="More Detail" CommandName="detail" CssClass="btn btn-outline-primary btn-lg" CommandArgument='<%# Eval("Roo_ID") %>' />
                                </div>
                            </div>
                        </div>

                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HOTELConnectionString %>" SelectCommand="SELECT * FROM [ROOM]"></asp:SqlDataSource>
            </div>
        </div>
        <div class="section-header mt-3">
            <div class="container">
                <h1 class="">Nearby spots</h1>
                <p>Here's a selection of ionic sites related to art, fashion and design.</p>
            </div>
        </div>
        <div class="container">
            <div class="row ">
                <div class="col-9 overlay--1">
                    <figure class="">
                        <figcaption style="background-image: url(image/activity-1.jpg); min-height: 360px; background-position: center; background-size: contain; position: relative">
                            <div class="overlay">Museum</div>
                        </figcaption>

                    </figure>

                </div>
                <div class="col-3 overlay--2">
                    <figure class="">
                        <figcaption style="background-image: url(image/activity-2.jpg); min-height: 360px; background-position: center; background-size: cover; position: relative">
                            <div class="overlay">Night Life</div>
                        </figcaption>
                    </figure>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-4 overlay--3">
                    <figure class="">
                        <figcaption style="background-image: url(image/activity-3.jpg); min-height: 360px; background-position: center; background-size: cover; position: relative">
                            <div class="overlay">Food & Drink</div>
                        </figcaption>

                    </figure>

                </div>
                <div class="col-4 overlay--4">
                    <figure class="">
                        <figcaption style="background-image: url(image/activity-4.jpg); min-height: 360px; background-position: center; background-size: cover; position: relative">
                            <div class="overlay">Shopping</div>
                        </figcaption>
                    </figure>
                </div>
                <div class="col-4 overlay--5">
                    <figure class="">
                        <figcaption style="background-image: url(image/activity-5.jpg); min-height: 360px; background-position: center; background-size: cover; position: relative">
                            <div class="overlay">The City</div>
                        </figcaption>
                    </figure>
                </div>
            </div>
        </div>

        <div class="section-header mt-3">
            <div class="container">
                <h1>APARTMENT RESIDENCES</h1>
                <p>At home while on the road.</p>
            </div>
        </div>
        <div class="container">
            <div class="row ">
                <div class="col-6 px-0">
                    <div class="image" style="background-image: url(image/apartment-1.jpg); min-height: 500px; background-position: center; background-size: cover;"></div>
                </div>
                <div class="col-6 mybg px-0">
                    <div style="padding: 50px;">
                        <h2 class="title">Presidential
                        <br>
                            Suite</h2>
                        <p class="">
                            Newly refurnished luxury accommodation with finest quality linen &amp; quality decor.
                                Air Conditioning Electric Blankets, Ironing Boards, Mini Bar, Flat Screen &amp; Free Inhouse Movies, WiFi
                                and Housekeeping by request.
                        </p>
                        <div class="room-facilities d-flex">
                            <figure class="text-center myFigure">
                                <figcaption><i class="fas fa-user-friends "></i>
                                    <br />
                                    4 Persons
                                </figcaption>
                            </figure>
                            <figure class="text-center myFigure">
                                <figcaption><i class="fas fa-utensils"></i>
                                    <br />
                                    All inclusive
                                </figcaption>
                            </figure>
                            <figure class="text-center myFigure">
                                <figcaption><i class="fas fa-bed "></i>
                                    <br />
                                    Kingsize Bed
                                </figcaption>
                            </figure>
                            <figure class="text-center myFigure">
                                <figcaption><i class="fas fa-tv "></i>
                                    <br />
                                    TV
                                </figcaption>
                            </figure>
                        </div>
                        <div class="book mt-3 d-inline-flex">
                            <div>
                                <a href="room-overview.html" class="btn btn-danger px-5">Book</a>
                            </div>
                            <div class="ml-5">
                                <span class="price h2">$ 129,00</span>
                                <span class="lead">per night</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row ">

                <div class="col-6 mybg px-0">
                    <div style="padding: 50px;">
                        <h2 class="title">Luxury
                        <br>
                            Apartment</h2>
                        <p class="">
                            The highest level of living with luxury. Residences are distinctively designed and exquisitely appointed, creating ideal places where memories are made and experiences are genuine.
                        </p>
                        <div class="room-facilities d-flex">
                            <figure class="text-center myFigure">
                                <figcaption><i class="fas fa-user-friends "></i>
                                    <br />
                                    4 Persons
                                </figcaption>
                            </figure>
                            <figure class="text-center myFigure">
                                <figcaption><i class="fas fa-utensils"></i>
                                    <br />
                                    All inclusive
                                </figcaption>
                            </figure>
                            <figure class="text-center myFigure">
                                <figcaption><i class="fas fa-bed "></i>
                                    <br />
                                    Kingsize Bed
                                </figcaption>
                            </figure>
                            <figure class="text-center myFigure">
                                <figcaption><i class="fas fa-tv "></i>
                                    <br />
                                    TV
                                </figcaption>
                            </figure>
                        </div>
                        <div class="book mt-3 d-inline-flex">
                            <div>
                                <a href="room-overview.html" class="btn btn-danger px-5">Book</a>
                            </div>
                            <div class="ml-5">
                                <span class="price h2">$ 299,00</span>
                                <span class="lead">per night</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-6 px-0">
                    <div class="image" style="background-image: url(image/apartment-2.jpg); min-height: 500px; background-position: center; background-size: cover;"></div>
                </div>
            </div>
        </div>
</asp:Content>

