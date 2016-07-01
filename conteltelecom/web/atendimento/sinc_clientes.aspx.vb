Public Class sinc_clientes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ButtonSincronizar_Click(sender As Object, e As EventArgs) Handles ButtonSincronizar.Click


        Dim dvSql1 As DataView = CType(SqlDataSource2.Select(DataSourceSelectArguments.Empty), DataView)


        If dvSql1 IsNot Nothing Or dvSql1.Count < 0 Then

            For Each drvSql As DataRowView In dvSql1

                SqlDataSource3.SelectParameters("codMatriz_PS_CLIENTES").DefaultValue = drvSql("codMatriz_PS_CLIENTES")
                SqlDataSource3.SelectParameters("desc_CL_UNIDADES").DefaultValue = drvSql("nomeUnidade_LI_LINHAS")
                Dim dvSql2 As DataView = CType(SqlDataSource3.Select(DataSourceSelectArguments.Empty), DataView)
                If dvSql2.Count <= 0 Then

                    SqlDataSource2.InsertParameters("codMatriz_PS_CLIENTES").DefaultValue = drvSql("codMatriz_PS_CLIENTES")
                    SqlDataSource2.InsertParameters("desc_CL_UNIDADES").DefaultValue = drvSql("nomeUnidade_LI_LINHAS")
                    SqlDataSource2.Insert()


                End If




            Next
        End If




    End Sub
End Class