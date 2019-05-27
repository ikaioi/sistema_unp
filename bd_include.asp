<%
'Observe que esse script de conexao ao banco de dados
'é específico para a área pública 
Dim cn
set cn=server.createobject("ADODB.Connection")

'cn.Open "Provider=SQLOLEDB; Data Source = (local); Initial Catalog=dbCorrentistas;User ID=webacesso;Password=Passou#da@hora;"
'cn.Open "Driver={SQL Server};Server=TUNPSERVER\TUNP;Database=dbCorrentistas;User=webacesso;Password=Passou#da@hora;"'
cn.Open "Driver={SQL Server};Server=TUNPSERVER\TUNP;DataBase=dbCorrentistas;UID=webacesso;PWD=Passou#da@hora;"

If cn.errors.count = 0 Then   
   'Response.Write "Connected OK"'
End If
%>