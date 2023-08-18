/**
 * For usage, visit Chart.js docs https://www.chartjs.org/docs/latest/
 */

function getData(d){
    var dat=[];
    dat = d;
    const lineConfig = {
        type: 'line',
        data: {
            labels: ['1', '2', '3', '4', '5', '6', '7','8', '9', '10', '11', '12'],
            datasets: [
                {
                    label: 'Doanh thu',
                    /**
                     * These colors come from Tailwind CSS palette
                     * https://tailwindcss.com/docs/customizing-colors/#default-color-palette
                     */
                    backgroundColor: '#0694a2',
                    borderColor: '#0694a2',
                    data: dat,
                    fill: false,
                }
            ],
        },
        options: {
            responsive: true,
            /**
             * Default legends are ugly and impossible to style.
             * See examples in charts.html to add your own legends
             *  */
            legend: {
                display: false,
            },
            tooltips: {
                mode: 'index',
                intersect: false,
            },
            hover: {
                mode: 'nearest',
                intersect: true,
            },
            scales: {
                x: {
                    display: true,
                    scaleLabel: {
                        display: true,
                        labelString: 'Month',
                    },
                },
                y: {
                    display: true,
                    scaleLabel: {
                        display: true,
                        labelString: 'Value',
                    },
                },
            },
        },
    }
    // change this to the id of your chart element in HMTL
    const lineCtx = document.getElementById('line')
    window.myLine = new Chart(lineCtx, lineConfig)
    console.log(dat);
}
window.addEventListener("onclick",function(){
    getData()
})