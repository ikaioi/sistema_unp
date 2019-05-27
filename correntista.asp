<!--#Include file="bd_include.asp" -->

<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Edmin</title>
	<link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link type="text/css" href="css/theme.css" rel="stylesheet">
	<link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
	<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
</head>
<body>


	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
					<i class="icon-reorder shaded"></i>
				</a>

			  	<a class="brand" href="index.html">
			  		Correntistas
			  	</a>

			
			</div>
		</div><!-- /navbar-inner -->
	</div><!-- /navbar -->

	<div class="wrapper">
		<div class="container">
			<div class="row">
				<div class="span3">
					<div class="sidebar">

							<ul class="widget widget-menu unstyled">
                                <li><a class="collapsed" data-toggle="collapse" href="#togglePages">
                                </i><i class="icon-chevron-down pull-right"></i><i class="icon-chevron-up pull-right">
                                </i>Correntista </a>
                                    <ul id="togglePages" class="collapse unstyled">
                                        <li><a href="correntista.asp">Listar correntistas </a></li>
                                        <li><a href="novo_correntista.asp">Adicionar Correntista </a></li>
                                    </ul>
                                </li>
								
                                
                            </ul>
							
					</div><!--/.sidebar-->
				</div><!--/.span3-->


				<div class="span9">
					<div class="content">
					
					<%
					var_codigo_novo=request.querystring("novo")
					if var_codigo_novo<>"" then
					
					

dim var_nome, var_saldo

var_nome=request.form("nome")
var_saldo=request.form("saldo")


if (var_nome="") or (var_saldo="") then
	%>
									<div class="alert alert-danger">
										<button type="button" class="close" data-dismiss="alert">×</button>
										<strong>Não foi possível cadastrar o novo correntista. Por favor, preencha todos os campos</strong>
									</div>
	<%
end if

cn.execute("insert into correntista (Nome, DataCriacao, SaldoFinanceiro) VALUES ('"&var_nome&"',getDate(),'"&var_saldo&"')")


'set verifica_usuario=cn.execute("insert into correntista (Nome, DataCriacao, SaldoFinanceiro) VALUES ('"&var_nome&"', getDate(), '"&var_saldo&"' );")'

%>
									<div class="alert alert-success">
										<button type="button" class="close" data-dismiss="alert">×</button>
										<strong>Correntista cadastrado com sucesso!</strong>
									</div>

<%


					
					end if
					
					
					


%>









					
					<%
									

						var_codigo_ex=request.querystring("codEx")
						if var_codigo_ex<>"" then

							' rotina para apagar correntista
							set rs=cn.execute("DELETE FROM correntista WHERE IdCorrentista="&var_codigo_ex&";")

%>

							<div class="alert alert-success">
										<button type="button" class="close" data-dismiss="alert">×</button>
										<strong>Correntista excluído com sucesso!</strong>
									</div>

<%
						end if
						
						%>
					
						<div class="module">
							<div class="module-head">
								<h3>Correntistas</h3>
							</div>
							<div class="module-body">
								<table class="table">
								  <thead>
									<tr>
									  <th>#</th>
									  <th>Nome</th>
									  <th>Saldo</th>
									  <th>Data de criação</th>
									  <th>Ações</th>
									</tr>
								  </thead>
								  <tbody>
									<%

						set RS=cn.execute("select * from correntista")
						if rs.eof then
							response.write "Não há correntistas disponiveis"
						else
							var_contador=0
							do while (not rs.eof)
								response.write "<tr><td><a href='correntista_detalhes.asp?cod="&rs("IdCorrentista")&"'>"&rs("IdCorrentista")&"</a></td>"
								response.write "<td><a href='correntista_detalhes.asp?cod="&rs("IdCorrentista")&"'>"&rs("Nome")&"</a></td>"
								response.write "<td><a href='correntista_detalhes.asp?cod="&rs("IdCorrentista")&"'>"&rs("SaldoFinanceiro")&"</a></td>"
								response.write "<td><a href='correntista_detalhes.asp?cod="&rs("IdCorrentista")&"'>"&rs("DataCriacao")&"</a></td>"
								response.write "<td><a href='correntista.asp?codEx="&rs("IdCorrentista")&"' class='btn btn-danger' onclick='return confirm(""Deseja realmente excluir?"")'>Excluir</a></td> </tr>"
								rs.movenext
								var_contador=var_contador+1
							loop
						  end if
						rs.close
						set rs =nothing
						cn.close
						set cn = nothing

						%>
						

						
									
								  </tbody>
								</table>
							</div>
						</div>

						
					<br />
						
					</div><!--/.content-->
				</div><!--/.span9-->
				
			</div>
		</div><!--/.container-->
	</div><!--/.wrapper-->

	<div class="footer">
		<div class="container">
			 

			<b class="copyright">&copy; 2014 Edmin - EGrappler.com </b> All rights reserved.
		</div>
	</div>

	<script src="scripts/jquery-1.9.1.min.js"></script>
	<script src="scripts/jquery-ui-1.10.1.custom.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="scripts/datatables/jquery.dataTables.js"></script>
	<script>
		$(document).ready(function() {
			$('.datatable-1').dataTable();
			$('.dataTables_paginate').addClass("btn-group datatable-pagination");
			$('.dataTables_paginate > a').wrapInner('<span />');
			$('.dataTables_paginate > a:first-child').append('<i class="icon-chevron-left shaded"></i>');
			$('.dataTables_paginate > a:last-child').append('<i class="icon-chevron-right shaded"></i>');
		} );
	</script>
</body>