// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'pie',
  data: {
    labels: [fn, sn, tn, forn,"기타"],
    datasets: [{
      data: [fc, sc, tc, forc, pc],
      backgroundColor: ['#dc3545', '#007bff', '#ffc107', '#28a745','#964B00'],
    }],
  },
});
