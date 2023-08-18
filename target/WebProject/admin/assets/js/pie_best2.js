
function getData(d) {
  var dat = [];
  dat = d;
  // console.log(d);
  const pieConfig2 = {
    type: 'doughnut',
    data: {
      datasets: [
        {
          data: dat,
          /**
           * These colors come from Tailwind CSS palette
           * https://tailwindcss.com/docs/customizing-colors/#default-color-palette
           */
          backgroundColor: ['#0694a2', '#1c64f2', '#7e3af2'],
          label: 'Dataset 1',
        },
      ],

    },
    options: {
      responsive: true,
      cutoutPercentage: 80,
      /**
       * Default legends are ugly and impossible to style.
       * See examples in charts.html to add your own legends
       *  */
      legend: {
        display: false,
      },
    },
  }

// change this to the id of your chart element in HMTL
  const pieCtx2 = document.getElementById('pie2')
  window.myPie = new Chart(pieCtx2, pieConfig2);
  console.log(dat);
}

window.addEventListener("load",function(){
  getData()
})