Imports System.IO
Imports System.Net
Imports Telerik.Web.UI

Public Class anexos_solicitacao_fatura
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


    End Sub

    Private Sub RadGridMostraFaturas_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles RadGridMostraFaturas.ItemCommand
        If e.CommandName = "DeleteNovo" Then
            Dim dataItem As GridDataItem = DirectCast(e.Item, GridDataItem)
            'get the Hyperlink using the Column uniqueName
            Dim HiddenFieldid_SF_LEITURA_FATURA As HiddenField = DirectCast(dataItem.FindControl("HiddenFieldid_SF_LEITURA_FATURA"), HiddenField)
            Dim caminho_ANEXOS_FATURAS As HiddenField = DirectCast(dataItem.FindControl("caminho_ANEXOS_FATURAS"), HiddenField)


            SqlDataSourceBuscaAnexos.DeleteParameters("id_SF_LEITURA_FATURA").DefaultValue = HiddenFieldid_SF_LEITURA_FATURA.Value
            SqlDataSourceBuscaAnexos.Delete()

            Dim fi As New FileInfo(caminho_ANEXOS_FATURAS.Value & HiddenFieldid_SF_LEITURA_FATURA.Value & ".pdf")
            fi.Delete()





        End If


    End Sub

    Private Sub RadGridMostraFaturas_PreRender(sender As Object, e As EventArgs) Handles RadGridMostraFaturas.PreRender
        If IsPostBack = False Then
            PersonalizarControles.SubRadGrid(RadGridMostraFaturas, 0)
            RadGridMostraFaturas.Rebind()
        End If
    End Sub
End Class