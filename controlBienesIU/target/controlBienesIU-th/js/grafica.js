function grafBladLinea(titulo, idDiv, tipo3D) {
    var valor = $("#" + idDiv + "").text();
    if (valor.length > 20) {
        var stringSeries = valor,
                parsedSeries = JSON.parse(stringSeries);
        Highcharts.chart(idDiv, {
            chart: {
                backgroundColor: 'rgba(255, 255, 255, 0.3)',
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie',
                options3d: {
                    enabled: tipo3D,
                    alpha: 45,
                    beta: 0
                }
            },
            title: {
                text: titulo,
                style: {
                    fontWeight: 'bold',
                    color: '#00417F'
                }
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    depth: 35,
                    dataLabels: {
                        enabled: true,
                        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                        style: {
                            color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                        }
                    }
                }
            },
            credits: {
                text: 'DTIC ESPOCH',
                href: '#', style: {
                    fontWeight: 'bold',
                    fontSize: '10px'
                }
            },
            exporting: {
                buttons: {
                    contextButton: {
                        menuItems: ['printChart', 'separator', 'downloadPDF', 'downloadPNG', 'downloadXLS']
                    }
                }
            },
            series: parsedSeries
        });
    }

}
function graficaBlad(titulo, idDiv, tipo3D) {
    var valor = $("#" + idDiv + "").text();
    if (valor.length > 20) {
        var stringSeries = valor,
                parsedSeries = JSON.parse(stringSeries);
        Highcharts.chart(idDiv, {
            chart: {
                backgroundColor: 'rgba(255, 255, 255, 0.3)',
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie',
                options3d: {
                    enabled: tipo3D,
                    alpha: 45,
                    beta: 0
                }
            },
            title: {
                text: titulo,
                style: {
                    fontWeight: 'bold',
                    color: '#00417F'
                }
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    depth: 35,
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
            },
            credits: {
                text: 'DTIC ESPOCH',
                href: '#', style: {
                    fontWeight: 'bold',
                    fontSize: '10px'
                }
            },
            exporting: {
                buttons: {
                    contextButton: {
                        menuItems: ['printChart', 'separator', 'downloadPDF', 'downloadPNG', 'downloadXLS']
                    }
                }
            },
            series: parsedSeries
        });
    }
}
function OcultaDiv(idDiv) {
    var valor = $("#" + idDiv + "").text();
    if (valor.length < 60) {
        document.getElementById(idDiv).style.display = 'none';
    }
}
$(function () {
    $('div[onload]').trigger('onload');
});


