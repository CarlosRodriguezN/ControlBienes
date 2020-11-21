<%@page import="servicios.*"%>
<%@page import="entidades.*"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page contentType='text/html' pageEncoding='UTF-8'%>
<!DOCTYPE html>
<html>
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

    <script src="js/jquery.loadingModal.min.js" type="text/javascript"></script>
    <link href="js/css/jquery.loadingModal.min.css" rel="stylesheet" type="text/css"/>
    <link href="js/css/dtic.css" rel="stylesheet" type="text/css"/>


    <div class="main-header">
        <h2>Bienes</h2>
        <em>Listado de bienes por usuario.</em>
    </div>

    <div class="main-content">
        <div class="col-sm-6">
            <div class="well well-lg knowledge-recent-popular">
                <div class="row">
                    <form role="form" id="FrmBuscarBienCedula">

                        <div class="form-group col-md-12" >
                            <label><b>Cédula a filtrar bienes</b></label>
                            <div class="form-group col-sm-12">
                                <label for="cedulaUser"></label>
                                <input value="" required="true" type="text" class="form-control" id="cedulaUser" name="cedulaUser" placeholder="Ingrese la cédula del usuario.">
                            </div>
                        </div>
                    </form>
                    <div align='center'>
                        <button  class='btn btn-primary' onclick="clicCertificadoPDF()"><i class="fa fa-search"></i>Buscar</button>
                    </div>
                </div>
            </div>
        </div>




    </div>
</html>