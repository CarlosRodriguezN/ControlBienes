<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page contentType='text/html' pageEncoding='UTF-8'%>
<!DOCTYPE html>
<html>
    <!--<link href="assets/css/skins/orange.css" rel="stylesheet" type="text/css"/>-->
    <script src="assets/js/jquery/jquery-2.1.0.min.js"></script>
    <!-- Tablas -->
    <script src="assets/js/plugins/datatable/jquery.dataTables.min.js"></script>
    <script src="assets/js/plugins/datatable/exts/dataTables.colVis.bootstrap.js"></script>
    <script src="assets/js/plugins/datatable/exts/dataTables.colReorder.min.js"></script>
    <script src="assets/js/plugins/datatable/exts/dataTables.tableTools.min.js"></script>
    <script src="assets/js/plugins/datatable/dataTables.bootstrap.js"></script>
    <script src="assets/js/plugins/jqgrid/jquery.jqGrid.min.js"></script>
    <script src="assets/js/plugins/jqgrid/i18n/grid.locale-en.js"></script>
    <script src="assets/js/plugins/jqgrid/jquery.jqGrid.fluid.js"></script>
    <script src="assets/js/plugins/bootstrap-datepicker/bootstrap-datepicker.js"></script>
    <script src="assets/js/king-table.js"></script>
    <script src="js/papaparse.min.js" type="text/javascript"></script>
    <div class="main-header">
        <h2>Importar</h2>
        <em>Importar archivos de tipo CSV <a download="ejemplo.csv" href="dtic/files/DemoBienes.csv">descargue aquí</a> el formato para eviar errores.</em>
    </div>
    <div class="main-content">
        <form class="form-inline">
            <div class="form-group col-md-6">
                <label for="ticket-attachment" class="col-sm-3 control-label">Seleccione un archivo:</label>
                <div class="col-md-6">
                    <input type="file" id="files" accept=".csv" required>
                    <p class="help-block"><em>Archivos validos: .csv Tamaño max: 3 MB</em></p>
                </div>
            </div>
            <div class="form-group col-md-6">
                <button type="submit" id="submit-file" class="btn btn-primary"><i class="fa fa-check-circle"></i>Procesar archivo</button>                
            </div>
        </form>
        <br>
        <div class="col-sm-12" align="center" style="display: none" id='alerta'>
            <h1 style=" font-weight: bold; ">Por favor revise su archivo CSV, el mismo no contiene datos.</h1>
        </div>
        <form class="form-knowledge-search">
            <div class="input-group input-group-lg" style="display: none" id='busqueda'>
                <input type="search" placeholder="si desea verificar un dato búsquelo aquí..." id="search" class="form-control">
                <span class="input-group-btn"><button class="btn btn-primary" type="button"><i class="fa fa-search"></i> Buscar</button></span>
            </div>
        </form>
        <div id="divCSV">
            <table class='table-bordered table' id='mytable' cellspacing='0' style='width: 100%; font-size: 11px'></table>
        </div>
        <br>
        <div class="col-sm-12" align="right" style="display: none" id='btnSubir'>
            <button class="btn btn-primary" onclick="regTemporalesDB()"><i class="fa fa-check-circle"></i> Registrar en la DB</button>
        </div>
        <br>
        <br>
        <br>
        
        <p id="parrafo" style="display: none">json</p>
        <p id="Respuesta"></p>
        
    </div>
    <script>
        $(document).ready(function () {
            $("#search").keyup(function () {
                _this = this;
                // Show only matching TR, hide rest of them
                $.each($("#mytable tbody tr"), function () {
                    if ($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) === -1)
                        $(this).hide();
                    else
                        $(this).show();
                });
            });
        });
        $('#submit-file').on("click", function (e) {

            e.preventDefault();
            $('#files').parse({
                config: {
                    delimiter: "auto",
                    complete: displayHTMLTable,
                },
                before: function (file, inputElem)
                {
                    //console.log("Parsing file...", file);
                },
                error: function (err, file)
                {
                    //console.log("ERROR:", err, file);
                },
                complete: function ()
                {
                    //console.log("Done with all files");
                }
            });
        });
        function displayHTMLTable(results) {
            //var table = "<table class='table-bordered table pull-right' id='mytable' cellspacing='0' style='width: 100%;'>";
            $("#mytable").empty();
            var data = results.data;
            var table = "<thead>";
            table += "<tr role='row'>";
            var row = data[0];
            var cells = row.join(";").split(";");
            for (j = 0; j < cells.length; j++) {
                table += "<th>";
                table += cells[j];
                table += "</th>";
            }
            table += "</tr>";
            table += "</thead>";
            table += "<tbody>";
            for (i = 1; i < data.length - 1; i++) {
                table += "<tr>";
                var row = data[i];
                var cells = row.join(";").split(";");
                for (j = 0; j < cells.length; j++) {
                    table += "<td>";
                    table += cells[j];
                    table += "</td>";
                }
                table += "</tr>";
            }
            table += "</tbody>";
            $("#mytable").append(table);
            if (data.length > 2)
            {
                $("#busqueda").show();
                $("#btnSubir").show();
            } else
                $("#alerta").show();
        }
    </script>
</html>