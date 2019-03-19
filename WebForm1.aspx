<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="test2.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Web Test</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
    <nav>
    <!--normal navbar-->
    <div class="bar">
      <ul class="white">
        <ul class="nav">
          <li><a href="sub/about.html" target="main_frame"><span id="Cap">A</span>bout</a></li>
          <li><a href="sub/contect.html" target="main_frame"><span id="Cap">C</span>ontect</a></li>
        </ul>
        <ul class="nav project" id="pj">
          <li><a href="sub/project.html" target="main_frame"><span id="Cap">P</span>roject</a>
            <ul>
              <li><a href="sub/projectc.html" target="main_frame"><span id="Cap">P</span>roject C</a></li>
            </ul>
          </li>
        </ul>

        <!--mini navbar-->
        <ul class="Min_nav">
          <li><a href="#"><span id="Cap">M</span>enu</a>
            <ul>
              <li><a href="sub/about.html" target="main_frame"><span id="Cap">A</span>bout</a></li>
              <li><a href="sub/contect.html" target="main_frame"><span id="Cap">C</span>ontect</a></li>
              <li><a href="sub/project.html" target="main_frame"><span id="Cap">P</span>roject</a>
                <ul>
                  <li><a href="sub/projectc.html" target="main_frame"><span id="Cap">P</span>roject C</a></li>
                </ul>
            </ul>
            </li>
        </ul>
    </div>
  </nav>
</body>
</html>
