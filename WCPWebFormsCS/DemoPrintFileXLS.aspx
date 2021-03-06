﻿<%@ Page Title="Advanced XLS Printing" Language="C#" MasterPageFile="~/MasterPage.master" %>


<script runat="server">


</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .glyphicon-refresh-animate {
            -animation: spin .7s infinite linear;
            -webkit-animation: spin2 .7s infinite linear;
        }

        @-webkit-keyframes spin2 {
            from {
                -webkit-transform: rotate(0deg);
            }

            to {
                -webkit-transform: rotate(360deg);
            }
        }

        @keyframes spin {
            from {
                transform: scale(1) rotate(0deg);
            }

            to {
                transform: scale(1) rotate(360deg);
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderBody" runat="Server">

    <div class="container">
        <div class="row">

            <div class="col-md-12">
                <h3><a href="Samples.aspx" class="btn btn-md btn-danger"><i class="fa fa-chevron-left"></i></a>&nbsp;Advanced XLS Printing</h3>
                <p>
                    With <strong>WebClientPrint for ASP.NET</strong> solution you can <strong>print XLS files</strong> right to any installed printer at the client side with advanced settings.
                </p>
                <div class="alert alert-info"><strong>Requirements:</strong> 
                    <ul>
                        <li>Available for <strong>Windows clients only</strong></li>
                        <li><strong>Microsoft Excel 97+</strong> must be installed at the client machine</li>
                        <li>XLS files can be any of these file formats: <strong>*.xl, *.xlsx, *.xlsm, *.xlsb, *.xlam, *.xltx, *.xltm, *.xls, *.xla, *.xlt, *.xlm, *.xlw and *.ods</strong></li>
                    </ul>
                </div>

                <div class="form-group well">
                    <h4>Click on <strong>"Get Printers Info"</strong> button to get installed Printers</h4>
                    <div class="row">

                        <div class="col-md-3">
                            <a onclick="javascript:jsWebClientPrint.getPrinters(); $('#spinner').css('visibility', 'visible');" class="btn btn-success">Get Printers...</a>
                        </div>
                        <div class="col-md-9">
                            <h3 id="spinner" style="visibility: hidden"><span class="label label-info"><span class="glyphicon glyphicon-refresh glyphicon-refresh-animate"></span>Please wait a few seconds...</span></h3>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <label for="lstPrinters">Printers:</label>
                            <select name="lstPrinters" id="lstPrinters" class="form-control"></select>
                        </div>
                        <div class="col-md-4">
                            <label for="txtPagesFrom">Pages From:</label>
                            <input type="text" class="form-control" id="txtPagesFrom">
                        </div>
                        <div class="col-md-4">
                             <label for="txtPagesTo">Pages To:</label>
                            <input type="text" class="form-control" id="txtPagesTo">
                            
                        </div>
                        
                    </div>
                    <hr />
                    <div class="row">
                        
                        <div class="col-md-12">
                             <a class="btn btn-success btn-lg pull-right" onclick="javascript:jsWebClientPrint.print('printerName=' + encodeURIComponent($('#lstPrinters').val()) + '&pagesFrom=' + encodeURIComponent($('#txtPagesFrom').val()) + '&pagesTo=' + encodeURIComponent($('#txtPagesTo').val()));"><strong>Print XLS...</strong></a>
                        </div>
                    </div>
                    <hr />
                    <h4>XLS File Sample Preview - <strong>13 Pages!!!</strong></h4>
                    <iframe id="ifPreview" style="width: 100%; height: 500px;" frameborder="0" src="//docs.google.com/gview?url=http://webclientprint.azurewebsites.net/files/Project-Scheduling-Monitoring-Tool.xls&embedded=true"></iframe>

                </div>

            </div>


        </div>
    </div>

    <script type="text/javascript">
        //var wcppGetPrintersDelay_ms = 0;
        var wcppGetPrintersTimeout_ms = 60000; //60 sec
        var wcppGetPrintersTimeoutStep_ms = 500; //0.5 sec
        function wcpGetPrintersOnSuccess() {
            $('#spinner').css('visibility', 'hidden');
            // Display client installed printers
            if (arguments[0].length > 0) {
                var p = arguments[0].split("|");
                var options = '';
                for (var i = 0; i < p.length; i++) {
                    options += '<option>' + p[i] + '</option>';
                }
                $('#lstPrinters').html(options);
                $('#lstPrinters').focus();
            } else {
                alert("No printers are installed in your system.");
            }
        }
        function wcpGetPrintersOnFailure() {
            $('#spinner').css('visibility', 'hidden');
            // Do something if printers cannot be got from the client
            alert("No printers are installed in your system.");
        }
    </script>

    
        
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderScripts" runat="Server">

    <%-- Register the WebClientPrint script code --%>
    <%=Neodynamic.SDK.Web.WebClientPrint.CreateScript(HttpContext.Current.Request.Url.Scheme + "://" + HttpContext.Current.Request.Url.Host + ":" + HttpContext.Current.Request.Url.Port + "/WebClientPrintAPI.ashx", HttpContext.Current.Request.Url.Scheme + "://" + HttpContext.Current.Request.Url.Host + ":" + HttpContext.Current.Request.Url.Port + "/DemoPrintFileXLSHandler.ashx", HttpContext.Current.Session.SessionID)%>
</asp:Content>

