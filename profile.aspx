﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-wrapper">
          <div class="row">
            <div class="col-12">
              <div class="card">
                <div class="card-body">
                  <div class="row">
                    <div class="col-lg-4">
                      <div class="border-bottom text-center pb-4">
                        <img src="https://via.placeholder.com/92x92" alt="profile" class="img-lg rounded-circle mb-3"/>
                        <div class="mb-3">
                          <h3>David Grey. H</h3>
                          <div class="d-flex align-items-center">
                            <h5 class="mb-0 me-2 text-muted">Canada</h5>
                            <select id="profile-rating" name="rating" autocomplete="off">
                              <option value="1">1</option>
                              <option value="2">2</option>
                              <option value="3">3</option>
                              <option value="4">4</option>
                              <option value="5">5</option>
                            </select>
                          </div>
                        </div>
                        <p class="w-75 mx-auto mb-3">Bureau Oberhaeuser is a design bureau focused on Information- and Interface Design. </p>
                        <div class="d-flex justify-content-center">
                          <button class="btn btn-success me-1">Hire Me</button>
                          <button class="btn btn-success">Follow</button>
                        </div>
                      </div>
                      <div class="border-bottom py-4">
                        <p>Skills</p>
                        <div>
                          <label class="badge badge-outline-dark">Chalk</label>
                          <label class="badge badge-outline-dark">Hand lettering</label>
                          <label class="badge badge-outline-dark">Information Design</label>
                          <label class="badge badge-outline-dark">Graphic Design</label>
                          <label class="badge badge-outline-dark">Web Design</label>  
                        </div>                                                               
                      </div>
                      <div class="border-bottom py-4">
                        <div class="d-flex mb-3">
                          <div class="progress progress-md flex-grow">
                            <div class="progress-bar bg-primary" role="progressbar" aria-valuenow="55" style="width: 55%" aria-valuemin="0" aria-valuemax="100"></div>
                          </div>
                        </div>
                        <div class="d-flex">
                          <div class="progress progress-md flex-grow">
                            <div class="progress-bar bg-success" role="progressbar" aria-valuenow="75" style="width: 75%" aria-valuemin="0" aria-valuemax="100"></div>
                          </div>
                        </div>
                      </div>
                      <div class="py-4">
                        <p class="clearfix">
                          <span class="float-left">
                            Status
                          </span>
                          <span class="float-right text-muted">
                            Active
                          </span>
                        </p>
                        <p class="clearfix">
                          <span class="float-left">
                            Phone
                          </span>
                          <span class="float-right text-muted">
                            006 3435 22
                          </span>
                        </p>
                        <p class="clearfix">
                          <span class="float-left">
                            Mail
                          </span>
                          <span class="float-right text-muted">
                            Jacod@testmail.com
                          </span>
                        </p>
                        <p class="clearfix">
                          <span class="float-left">
                            Facebook
                          </span>
                          <span class="float-right text-muted">
                            <a href="#">David Grey</a>
                          </span>
                        </p>
                        <p class="clearfix">
                          <span class="float-left">
                            Twitter
                          </span>
                          <span class="float-right text-muted">
                            <a href="#">@davidgrey</a>
                          </span>
                        </p>
                      </div>
                      <button class="btn btn-primary btn-block mb-2">Preview</button>
                    </div>
                    <div class="col-lg-8">
                      <div class="d-flex justify-content-between">
                        <div>
                          <button class="btn btn-outline-primary">Message</button>
                          <button class="btn btn-primary">Request</button>
                        </div>
                      </div>
                      <div class="mt-4 py-2 border-top border-bottom">
                        <ul class="nav profile-navbar">
                          <li class="nav-item">
                            <a class="nav-link" href="#">
                              <i class="ti-user"></i>
                              Info
                            </a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link active" href="#">
                              <i class="ti-receipt"></i>
                              Feed
                            </a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" href="#">
                              <i class="ti-calendar"></i>
                              Agenda
                            </a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" href="#">
                              <i class="ti-clip"></i>
                              Resume
                            </a>
                          </li>
                        </ul>
                      </div>
                      <div class="profile-feed">
                        <div class="d-flex align-items-start profile-feed-item">
                          <img src="https://via.placeholder.com/92x92" alt="profile" class="img-sm rounded-circle"/>
                          <div class="ms-4">
                            <h6>
                              Mason Beck
                              <small class="ms-4 text-muted"><i class="ti-time me-1"></i>10 hours</small>
                            </h6>
                            <p>
                              There is no better advertisement campaign that is low cost and also successful at the same time.
                            </p>
                            <p class="small text-muted mt-2 mb-0">
                              <span>
                                <i class="ti-star me-1"></i>4
                              </span>
                              <span class="ms-2">
                                <i class="ti-comment me-1"></i>11
                              </span>
                              <span class="ms-2">
                                <i class="ti-share"></i>
                              </span>
                            </p>
                          </div>
                        </div>
                        <div class="d-flex align-items-start profile-feed-item">
                          <img src="https://via.placeholder.com/92x92" alt="profile" class="img-sm rounded-circle"/>
                          <div class="ms-4">
                            <h6>
                              Willie Stanley
                              <small class="ms-4 text-muted"><i class="ti-time me-1"></i>10 hours</small>
                            </h6>
                            <img src="https://via.placeholder.com/640x385" alt="sample" class="rounded mw-100"/>                            
                            <p class="small text-muted mt-2 mb-0">
                              <span>
                                <i class="ti-star me-1"></i>4
                              </span>
                              <span class="ms-2">
                                <i class="ti-comment me-1"></i>11
                              </span>
                              <span class="ms-2">
                                <i class="ti-share"></i>
                              </span>
                            </p>
                          </div>
                        </div>
                        <div class="d-flex align-items-start profile-feed-item">
                          <img src="https://via.placeholder.com/92x92" alt="profile" class="img-sm rounded-circle"/>
                          <div class="ms-4">
                            <h6>
                              Dylan Silva
                              <small class="ms-4 text-muted"><i class="ti-time me-1"></i>10 hours</small>
                            </h6>
                            <p>
                              When I first got into the online advertising business, I was looking for the magical combination 
                              that would put my website into the top search engine rankings
                            </p>
                            <img src="https://via.placeholder.com/640x385" alt="sample" class="rounded mw-100"/>                                                        
                            <p class="small text-muted mt-2 mb-0">
                              <span>
                                <i class="ti-star me-1"></i>4
                              </span>
                              <span class="ms-2">
                                <i class="ti-comment me-1"></i>11
                              </span>
                              <span class="ms-2">
                                <i class="ti-share"></i>
                              </span>
                            </p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scriptHolder" Runat="Server">
</asp:Content>
