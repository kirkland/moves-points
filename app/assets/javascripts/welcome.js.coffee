window.summary = (summaryData) ->
  google.load 'visualization', '1.0', packages: ['corechart'], callback: ->
    new Dashboard(summaryData) 

class Dashboard
  constructor: (summaryData) ->
    @drawChart summaryData

  drawChart: (summaryData) ->
    data = new google.visualization.DataTable()
    data.addColumn 'string', 'Date'
    data.addColumn 'number', 'Points'
    data.addRows summaryData

    options =
      'title': 'Points By Day',
      'height': 400

    chart = new google.visualization.ColumnChart($('#chart_div')[0]);
    chart.draw data, options
