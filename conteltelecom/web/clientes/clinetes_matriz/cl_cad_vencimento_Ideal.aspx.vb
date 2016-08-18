Imports Telerik.Web.UI

Public Class cl_cad_vencimento_Ideal
    Inherits System.Web.UI.Page

    Public Sub New()

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub RadGridCadVencimentoIdeal_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridCadVencimentoIdeal.ItemCommand

        If e.CommandName = RadGrid.UpdateCommandName Then
            Try


                Dim eitem As GridEditableItem = TryCast(e.Item, GridEditableItem)

                Dim itemValue As TextBox = TryCast(eitem("id_OP_OPERADORAS").Controls(0), TextBox)
                Dim diaVenc_LI_LINHAS As RadNumericTextBox = TryCast(eitem.FindControl("vencimentoIdealTextBox"), RadNumericTextBox)

                SqlDataSourceUpdate.SelectParameters("id_OP_OPERADORAS").DefaultValue = itemValue.Text

                Dim dvSql1 As DataView = CType(SqlDataSourceUpdate.Select(DataSourceSelectArguments.Empty), DataView)
                If dvSql1 IsNot Nothing Or dvSql1.Count < 0 Then
                    For Each drvSql As DataRowView In dvSql1
                        If IsDBNull(drvSql("id_PS_CLIENTES")) = False Then
                            SqlDataSourceUpdate.UpdateParameters("id_PS_CLIENTES").DefaultValue = drvSql("id_PS_CLIENTES")
                            SqlDataSourceUpdate.UpdateParameters("id_OP_OPERADORAS").DefaultValue = itemValue.Text
                            SqlDataSourceUpdate.UpdateParameters("diaVenc_LI_LINHAS").DefaultValue = diaVenc_LI_LINHAS.Text

                        End If

                        SqlDataSourceUpdate.Update()
                    Next
                    RadWindowManagerMsg.RadAlert("PROCEDIMENTO DE ALTERAÇÃO DE VENCIMENTO IDEAL CONCLUÍDO COM SUCESSO.", 400, Nothing, "MESNAGEM", Nothing)
                End If
            Catch ex As Exception
                RadWindowManagerMsg.RadAlert("ATENÇÃO ERRO DURANTE  ALTERAÇÃO DE VENCIMENTO IDEAL.", 400, Nothing, "MESNAGEM", Nothing)
            End Try

        End If

    End Sub
End Class