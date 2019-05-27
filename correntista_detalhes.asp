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
					var_codigo=request.querystring("cod")
					
					
					var_saldo=request.querystring("saldo")
					if var_saldo<>"" then
					
					

dim var_tipo, var_saldo

var_tipo=request.form("tipo")
var_saldo=request.form("valor")



if (var_tipo="") or (var_saldo="") then
	%>
									<div class="alert alert-danger">
										<button type="button" class="close" data-dismiss="alert">×</button>
										<strong>Não foi possível cadastrar o novo saldo. Por favor, preencha todos os campos</strong>
									</div>
	<%
end if

cn.execute("insert into movimentacoes (TipoMovimentacao, Valor, DataCriacao, IdCorrentista) VALUES ('"&var_tipo&"','"&var_saldo&"',getDate(),'"&var_codigo&"')")




%>
									<div class="alert alert-success">
										<button type="button" class="close" data-dismiss="alert">×</button>
										<strong>Saldo cadastrado com sucesso!</strong>
									</div>

<%


					
					end if
					
					
					


%>




						<div class="module">
							<div class="module-head">
								<h3>Detalhes do correntista</h3>
							</div>
							<div class="module-body">
								<table class="table">
								  <thead>
									<tr>
									  <th>#</th>
									  <th>Nome</th>
									  <th>Saldo</th>
									  <th>Data de criação</th>
									</tr>
								  </thead>
								  <tbody>
								  

									<%
									

						
						if var_codigo<>"" then

							set rs=cn.execute("select * from correntista WHERE IdCorrentista="&var_codigo)

						else 
						
							set rs=cn.execute("select * from correntista")
							
						end if


						if rs.eof then
							response.write "Não há correntistas disponiveis"
						else
							var_contador=0
							do while (not rs.eof)
								response.write "<tr><td>"&rs("IdCorrentista")&"</td>"
								response.write "<td>"&rs("Nome")&"</td>"
								response.write "<td>"&rs("SaldoFinanceiro")&"</td>"
								response.write "<td>"&rs("DataCriacao")&"</td>"
								rs.movenext
								var_contador=var_contador+1
							loop
						  end if
						
			

			%>
						
									
								  </tbody>
								</table>
							</div>
						</div>
						
						
						<div class="module">
							<div class="module-head">
								<h3>Movimentação financeira</h3>
							</div>
							<div class="module-body">
								<table class="table">
								  <thead>
									<tr>
									  <th>#</th>
									  <th>Tipo de Movimentação</th>
									  <th>Valor</th>
									  <th>Data de criação</th>
									</tr>
								  </thead>
								  <tbody>
									<%
									

						var_codigo=request.querystring("cod")
						if var_codigo<>"" then

							set rs=cn.execute("select * from movimentacoes WHERE IdCorrentista="&var_codigo)
	
							if rs.eof then
								response.write "Não há correntistas disponiveis"
							else
								var_contador=0
								do while (not rs.eof)
									response.write "<tr><td>"&rs("IdCorrentista")&"</td>"
									response.write "<td>"&rs("TipoMovimentacao")&"</td>"
									response.write "<td>"&rs("Valor")&"</td>"
									response.write "<td>"&rs("DataCriacao")&"</td></tr>"
									rs.movenext
									var_contador=var_contador+1
								loop
							  end if
							rs.close
							set rs =nothing
							cn.close
							set cn = nothing
						
						
						end if
			

			%>
						
									
								  </tbody>
								</table>
							</div>
						</div>
						
						
						
						
						
						
						
						
						
						
						<div class="module">
							<div class="module-head">
								<h3>Nova movimentação</h3>
							</div>
							<div class="module-body">
								
								<form class="form-horizontal row-fluid" action="correntista_detalhes.asp?saldo=1&cod=<%=var_codigo%>" method="POST">

										<div class="control-group">
											<label class="control-label" for="basicinput">Valor</label>
											<div class="controls">
											<label class="radio inline">
													<input type="radio" name="tipo" id="tipo" value="D" checked="">
													Débito
												</label> 
												<label class="radio inline">
													<input type="radio" name="tipo" id="tipo" value="C">
													Crédito
												</label> 
											</div>
											<div class="controls">
												<div class="input-append">
													<input id="valor" name="valor" type="number" step="any" placeholder="0,00" class="span8" required="required" ><span class="add-on">$</span>
													<button type="submit" class="btn-success" style="margin-left: 10px;">Atualizar saldo</button>
												</div>
											</div>
										</div>



										
										
									</form>
								
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