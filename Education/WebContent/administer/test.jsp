<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>관리자 회원관리</title>
<!-- Bootstrap core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../css/dashboard.css" rel="stylesheet">

<script type="text/javascript"
   src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
   google.charts.load('current', {
      'packages' : [ 'line' ]
   });
   google.charts.load('current', {
      'packages' : [ 'corechart' ]
   });
   google.charts.load('current', {'packages':['bar']});
   google.charts.setOnLoadCallback(VisitorChart);
   google.charts.setOnLoadCallback(ArticleChart);
   google.charts.setOnLoadCallback(SeccessChart);
   google.charts.setOnLoadCallback(TradeChart);
   google.charts.setOnLoadCallback(PointChart);
   function VisitorChart() {

      var data = new google.visualization.DataTable();
      data.addColumn('number', 'Day');
      data.addColumn('number', 'Guardians of the Galaxy');
      data.addColumn('number', 'The Avengers');
      data.addColumn('number', 'Transformers: Age of Extinction');

      data.addRows([ [ 1, 37.8, 80.8, 41.8 ], [ 2, 30.9, 69.5, 32.4 ],
            [ 3, 25.4, 57, 25.7 ], [ 4, 11.7, 18.8, 10.5 ],
            [ 5, 11.9, 17.6, 10.4 ], [ 6, 8.8, 13.6, 7.7 ],
            [ 7, 7.6, 12.3, 9.6 ], [ 8, 12.3, 29.2, 10.6 ],
            [ 9, 16.9, 42.9, 14.8 ], [ 10, 12.8, 30.9, 11.6 ],
            [ 11, 5.3, 7.9, 4.7 ], [ 12, 6.6, 8.4, 5.2 ],
            [ 13, 4.8, 6.3, 3.6 ], [ 14, 4.2, 6.2, 3.4 ] ]);

      var options = {
         chart : {
            subtitle : '-방문자통계'
         },
         width : 800,
         height : 300

      };

      var chart = new google.charts.Line(document
            .getElementById('visitor_stat'));

      chart.draw(data, google.charts.Line.convertOptions(options));
   }

   function ArticleChart() {

      var data = new google.visualization.DataTable();
      data.addColumn('number', 'Day');
      data.addColumn('number', 'Guardians of the Galaxy');
      data.addColumn('number', 'The Avengers');
      data.addColumn('number', 'Transformers: Age of Extinction');

      data.addRows([ [ 1, 37.8, 80.8, 41.8 ], [ 2, 30.9, 69.5, 32.4 ],
            [ 3, 25.4, 57, 25.7 ], [ 4, 11.7, 18.8, 10.5 ],
            [ 5, 11.9, 17.6, 10.4 ], [ 6, 8.8, 13.6, 7.7 ],
            [ 7, 7.6, 12.3, 9.6 ], [ 8, 12.3, 29.2, 10.6 ],
            [ 9, 16.9, 42.9, 14.8 ], [ 10, 12.8, 30.9, 11.6 ],
            [ 11, 5.3, 7.9, 4.7 ], [ 12, 6.6, 8.4, 5.2 ],
            [ 13, 4.8, 6.3, 3.6 ], [ 14, 4.2, 6.2, 3.4 ] ]);

      var options = {
         chart : {
            subtitle : '-게시글통계'
         },
         width : 400,
         height : 300

      };

      var chart = new google.charts.Line(document
            .getElementById('article_stat'));

      chart.draw(data, google.charts.Line.convertOptions(options));
   }

   function SeccessChart() {

      // Create the data table.
      var data = new google.visualization.DataTable();
      data.addColumn('string', 'Topping');
      data.addColumn('number', 'Slices');
      data.addRows([ [ 'Mushrooms', 3 ], [ 'Onions', 1 ], [ 'Olives', 1 ],
            [ 'Zucchini', 1 ], [ 'Pepperoni', 2 ] ]);

      // Set chart options
      var options = {'title':'거래성사율',
                       'width':400,
                       'height':300};

      // Instantiate and draw our chart, passing in some options.
      var chart = new google.visualization.PieChart(document.getElementById('seccess_state'));
      chart.draw(data, options);
   }
   
   function TradeChart() {

      var data = new google.visualization.DataTable();
      data.addColumn('number', 'Day');
      data.addColumn('number', 'Guardians of the Galaxy');
      data.addColumn('number', 'The Avengers');
      data.addColumn('number', 'Transformers: Age of Extinction');

      data.addRows([ [ 1, 37.8, 80.8, 41.8 ], [ 2, 30.9, 69.5, 32.4 ],
            [ 3, 25.4, 57, 25.7 ], [ 4, 11.7, 18.8, 10.5 ],
            [ 5, 11.9, 17.6, 10.4 ], [ 6, 8.8, 13.6, 7.7 ],
            [ 7, 7.6, 12.3, 9.6 ], [ 8, 12.3, 29.2, 10.6 ],
            [ 9, 16.9, 42.9, 14.8 ], [ 10, 12.8, 30.9, 11.6 ],
            [ 11, 5.3, 7.9, 4.7 ], [ 12, 6.6, 8.4, 5.2 ],
            [ 13, 4.8, 6.3, 3.6 ], [ 14, 4.2, 6.2, 3.4 ] ]);

      var options = {
         chart : {
            subtitle : '-하루 평균 거래'
         },
         width : 400,
         height : 300

      };

      var chart = new google.charts.Line(document
            .getElementById('trade_state'));

      chart.draw(data, google.charts.Line.convertOptions(options));
   }
   function PointChart() {
        var data = google.visualization.arrayToDataTable([
          ['Year', 'Sales', 'Expenses'],
          ['2014', 1000, 400],
          ['2015', 1170, 460],
          ['2016', 660, 1120],
        ]);

        var options = {
          chart: {
            subtitle: '-포인트 결제',
          },
          width : 400,
          height : 300
        };

        var chart = new google.charts.Bar(document.getElementById('point_state'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
</script>

<style type="text/css">
div#article_stat {
   display: inline-block;
}
div#seccess_state {
    display: inline-block;
}
div#trade_state {
    display: inline-block;
}
div#point_state {
    display: inline-block;
}
div#layout{
   display:block
}
</style>
</head>
<body>


   <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
      <h1 class="page-header">
         <i>통계 관리</i>
      </h1>
      <div id="visitor_stat"></div>
      <div id="layout">
      <div id="article_stat"></div>
      <div id="seccess_state"></div>
      </div>
      <div id="layout">
      <div id="trade_state"></div>
      <div id="point_state"></div>
      </div>

   </div>
</body>
</html>