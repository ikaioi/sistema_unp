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
					
						<div class="module">
							<div class="module-head">
								<h3>Adicionar novo correntista</h3>
							</div>
							<div class="module-body">
								
								
								<form class="form-horizontal row-fluid" action="correntista.asp?novo=1" method="POST">
										<div class="control-group">
											<label class="control-label" for="basicinput">Nome</label>
											<div class="controls">
												<input type="text" id="nome" name="nome" placeholder="Nome do correntista" class="span8" required="required">
											</div>
										</div>

										<div class="control-group">
											<label class="control-label" for="basicinput">Saldo</label>
											<div class="controls">
												<div class="input-append">
													<input id="saldo" name="saldo" type="number" step="any" placeholder="0,00" class="span8" required="required" ><span class="add-on">$</span>
												</div>
											</div>
										</div>



										<div class="control-group">
											<div class="controls">
												<button type="submit" class="btn-success">Cadastrar</button>
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