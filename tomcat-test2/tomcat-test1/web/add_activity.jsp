<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding = "UTF-8"%>
<html>
    <head>
        <title>Travner</title>
        <%@include file="include/link-another-page.jsp"%>
    </head>
    <body>
<!--script calendar-->
<script>
  $(document).ready(function() {

    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay,listWeek'
      },
      defaultDate: '2017-09-12',
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      eventLimit: true, // allow "more" link when too many events
     events: [
         {
          title: 'Kegiatan di Bandara',
          start: '2017-09-19T04:30:00',
          end: '2017-09-19T16:10:00'
        },

    {
          title: 'Sampai di Bandara Kendari',
          start: '2017-09-19T11:10:00',
          end: '2017-09-19T11:30:00'
        },

    {
          title: 'Pertemuan dengan Departement Agama',
          start: '2017-09-19T12:00:00',
          end: '2017-09-19T15:15:00'
        },

    {
          title: 'Makan Sore',
          start: '2017-09-19T15:30:00',
          end: '2017-09-19T16:30:00'
        }
      ]
    });

  });

</script>

</head>
<body>
<!--header-->
<div id="header">
  <div class="logo"><!--logo travner-->
  <a href="index.jsp"><img src="css/logo.png " width="90px" height="35px"></a>
  </div>
</div>

<a class="mobile"></a>


<!--sidebar-->
<div class="tab">
   <button class="tablinks" onclick="openPages(event, 'My Schedule')" id="defaultOpen">My Schedule<img src="icon/schedule.svg" ></button>
   <button class="tablinks" onclick="openPages(event, 'Calendar')">Calendar<img src="icon/calendar.png" ></button>
   <button class="tablinks" onclick="openPages(event, 'Travel_Data')">Travel Data<img src="icon/travel data.svg" ></button>
</div>



<div id="My Schedule" class="tabcontent">
<!--add activity-->
 <div class = add_activity>
    <%@include file="include/activity.jsp"%><!--manggil form add activity-->
 </div>

<!--Calendar-->
  <div id="Calendar" class="tabcontent"><!--menuju page calendar-->
      <%@include file="include/calendar.jsp"%><!--manggil calendar-->
 </div>


<div id="Travel_Data" class="tabcontent"><!--menuju page Travel Data -->
    <%@include file="include/menu_travel_data1.jsp"%> <!--manggil menu bar travel data-->
    
<div class="kiri"><!--field kiri-->
    <%@include file="include/field_kiri_location.jsp"%><!--manggil fiel kiri-->
</div>

<div class="kanan">
<%@include file="include/field_kanan_location.jsp"%><!--manggil fiel kanan-->
</div>

<!--Script Vertical Tab-->
<script>
      function openPages(evt, pageName) {
      // Declare all variables
      var i, tabcontent, tablinks;

      // Get all elements with class="tabcontent" and hide them
      tabcontent = document.getElementsByClassName("tabcontent");
      for (i = 0; i < tabcontent.length; i++) {
      tabcontent[i].style.display = "none";
    }

      // Get all elements with class="tablinks" and remove the class "active"
      tablinks = document.getElementsByClassName("tablinks");
      for (i = 0; i < tablinks.length; i++) {
      tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

      // Show the current tab, and add an "active" class to the link that opened the tab
      document.getElementById(pageName).style.display = "block";
      evt.currentTarget.className += " active";

  }
  // Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>
    </body>
</html>
