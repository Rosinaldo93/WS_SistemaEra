/**
 * @author zhixin wen <wenzhixin2010@gmail.com>
 * extensions: https://github.com/kayalshri/tableExport.jquery.plugin
 */

(function ($) {
    'use strict';

    var TYPE_NAME = {
        json: 'JSON',
        xml: 'XML',
        png: 'PNG',
        csv: 'CSV',
        txt: 'TXT',
        sql: 'SQL',
        doc: 'MS-Word',
        excel: 'Exportar a Excel',
        powerpoint: 'Ms-Powerpoint',
        pdf: 'PDF'
    };

    $.extend($.fn.bootstrapTable.defaults, {
        showExport: false,
        exportDataType: 'basic', // basic, all, selected
        // 'json', 'xml', 'png', 'csv', 'txt', 'sql', 'doc', 'excel', 'powerpoint', 'pdf'
        //exportTypes: ['json', 'xml', 'csv', 'txt', 'sql', 'excel'],
        exportTypes: ['excel'],
        exportOptions: {}
    });

    var BootstrapTable = $.fn.bootstrapTable.Constructor,
        _initToolbar = BootstrapTable.prototype.initToolbar;

    BootstrapTable.prototype.initToolbar = function () {
        this.showToolbar = this.options.showExport;

        _initToolbar.apply(this, Array.prototype.slice.apply(arguments));

        if (this.options.showExport) {
            var that = this,
                $btnGroup = this.$toolbar.find('>.btn-group'),
                //$export = $btnGroup.find('div.export');
                $export = $('#divExportar');

            if (!$export.length) {
                $export = $([
                    '<div class="botonera">',
                        '<button class="btn btn-default dropdown-toggle" ' +
                            'data-toggle="dropdown" type="button">',
                            '<i class="glyphicon glyphicon-export icon-share"></i> ',
                            '<span class="caret"></span>',
                        '</button>',
                        '<ul class="dropdown-menu" role="menu">',
                        '</ul>',
                    '</div>'].join('')).appendTo($btnGroup);

                var $menu = $export.find('.dropdown-menu'),
                    exportTypes = this.options.exportTypes;

                if (typeof this.options.exportTypes === 'string') {
                    var types = this.options.exportTypes.slice(1, -1).replace(/ /g, '').split(',');

                    exportTypes = [];
                    $.each(types, function (i, value) {
                        exportTypes.push(value.slice(1, -1));
                    });
                }
                $.each(exportTypes, function (i, type) {
                    if (TYPE_NAME.hasOwnProperty(type)) {
                        $menu.append(['<li data-type="' + type + '">',
                                '<a href="javascript:void(0)">',
                                    TYPE_NAME[type],
                                '</a>',
                            '</li>'].join(''));
                    }
                });

                $menu.find('li').click(function () {
//                  ESTA PARTE DE LA LIBRERIA SE HA COMENTADO PARA QUE PUEDA EXPORTAR MAYOR CANTIDAD DE DATOS EN EL PROYECTO DE DATAIMAGENES
//                    if(that.options.generarReporteEnElServidor === 'N'){
//                        var type = $(this).data('type'),
//                        doExport = function () {
//                            that.$el.tableExport($.extend({}, that.options.exportOptions, {
//                                type: type,
//                                escape: false
//                            }));
//                        };
//    
//                        if (that.options.exportDataType === 'all' && that.options.pagination) {
//                            that.togglePagination();
//                            doExport();
//                            that.togglePagination();
//                        } else if (that.options.exportDataType === 'selected') {
//                            var data = that.getData(),
//                                selectedData = that.getAllSelections();
//        
//                            that.load(selectedData);
//                            doExport();
//                            that.load(data);
//                        } else {
//                            doExport();
//                        }
//                    }else if(that.options.generarReporteEnElServidor === 'S'){
                        
                        var a = document.createElement('a');
                        var content = that.getData();
                        var head = that.options.columns[0];
                        var nombreReporte = that.options.exportOptions.fileName;
                        if(nombreReporte == 'undefined' || nombreReporte == '' || nombreReporte == undefined){
                            nombreReporte = "ReporteTabla";
                        }
                        content = ConvertirACsv(content, head);
                        var fileName = nombreReporte + ".csv";
                        var mimeType = mimeType || 'application/octet-stream;charset=UTF-8';

                        if (navigator.msSaveBlob) { // IE10
                            return navigator.msSaveBlob(new Blob(["\uFEFF" + content], {encoding: "UTF-8", type: "text/csv;charset=UTF-8" }), fileName);
                        }else if(navigator.appVersion.indexOf("MSIE 8.")!=-1){
                            window.location.href = './accionExportarConsultaBasicaIE8?hddParametrosBusqueda='+document.getElementById('hddParametrosBusqueda').value
                                                                          +'&hddTipoBusqueda=' + document.getElementById('hddTipoBusqueda').value
                                                                          +'&hddIdTipoBusquedaCruce=' + document.getElementById('hddIdTipoBusquedaCruce').value
                                                                          +'&hddCodigosConsulta=' + document.getElementById('hddCodigosConsulta').value
                                                                          +'&txtIdCourier=' + document.getElementById('txtIdCourier').value;
                            
                        } else if ('download' in a) { //html5 A[download]
                          a.href = 'data:' + mimeType + ',' + escape(content);
                          a.setAttribute('download', fileName);
                          document.body.appendChild(a);
                          setTimeout(function() {
                            a.click();
                            document.body.removeChild(a);
                          }, 66);
                          return true;
                        } else { //do iframe dataURL download (old ch+FF):
                          var f = document.createElement('iframe');
                          document.body.appendChild(f);
                          f.src = 'data:' + mimeType + ',' + escape(content);
                          
                          setTimeout(function() {
                            document.body.removeChild(f);
                          }, 333);
                          return true;
                        }
//                    }
                });
            }
        }
    };
})(jQuery);


